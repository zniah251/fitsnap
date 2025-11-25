import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  File? _image;
  final picker = ImagePicker();
  bool _isLoading = false;
  bool _isAnalyzed = false;

  // Bỏ 'final' để có thể cập nhật dữ liệu sau khi analyze
  // Dữ liệu mặc định ban đầu (hoặc rỗng)
  Map<String, String> _itemData = {
    'name': 'Unknown Item',
    'category': '...',
    'type': '...',
    'color': '...',
    'material': '...',
    'pattern': '...',
    'style': '...',
    'season': '...',
    'gender': '...',
    'fit': '...',
    'description': 'Please scan an image to analyze details.',
  };

  static const Color lightPurple = Color(0xFFEDE4FF);
  static const Color accentPurple = Color(0xFF5F33E1);
  static const Color primaryPurple = Color(0xFF7559D9);

  Future<void> getImage() async {
    try {
      setState(() => _isLoading = true);

      final pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
      );

      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
          _isAnalyzed = false; // Reset trạng thái khi chọn ảnh mới
        }
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to pick image. Please try again.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  Future<void> analyzeImage() async {
    if (_image == null) return;

    setState(() => _isLoading = true);

    // 1. Giả lập gọi API mất 5 giây
    await Future.delayed(const Duration(seconds: 5));

    // 2. Cập nhật dữ liệu khớp với chiếc áo trong hình (Sơ mi sọc xanh)
    setState(() {
      _isLoading = false;
      _isAnalyzed = true;

      _itemData = {
        'name': 'Striped Pocket Shirt',
        'category': 'Top',
        'type': 'Shirt',
        'color': 'Blue & White',
        'material': 'Cotton Blend',
        'pattern': 'Vertical Stripes',
        'style': 'Casual',
        'season': 'Spring/Summer',
        'gender': 'Unisex',
        'fit': 'Relaxed Fit',
        'description':
            'A casual blue and white vertical striped shirt featuring dual chest pockets with flaps. Perfect for a relaxed daily outfit or layering.',
      };
    });
  }

  void saveToWardrobe() {
    final newItem = Map<String, String>.from(_itemData);
    newItem['imageUrl'] = 'image/item/tn.png';

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Saved to wardrobe!'),
        backgroundColor: accentPurple,
        duration: Duration(seconds: 2),
      ),
    );

    // Navigate back and return the new item
    Navigator.pop(context, newItem);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          'Scan Item',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Image Upload Area
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              height: 300,
              decoration: BoxDecoration(
                color: lightPurple,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: accentPurple.withOpacity(0.3)),
              ),
              child: _image == null
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            size: 80,
                            color: accentPurple.withOpacity(0.5),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Take or select a photo of clothing',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black.withOpacity(0.6),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    )
                  : Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.file(
                            _image!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                        if (_isLoading)
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black45,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    'Analyzing AI...',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
            ),
            const SizedBox(height: 20),

            // Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: _isLoading ? null : getImage,
                      icon: Icon(
                        _image == null ? Icons.photo_library : Icons.refresh,
                        color: accentPurple,
                      ),
                      label: Text(
                        _image == null ? 'Select Image' : 'Change Image',
                        style: const TextStyle(
                          fontSize: 16,
                          color: accentPurple,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        side: const BorderSide(color: accentPurple, width: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  if (_image != null && !_isAnalyzed) ...[
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: _isLoading ? null : analyzeImage,
                        icon: const Icon(
                          Icons.auto_awesome,
                          color: Colors.white,
                        ),
                        label: const Text(
                          'Analyze',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: accentPurple,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),

            // Analysis Results
            if (_isAnalyzed) ...[
              const SizedBox(height: 24),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: lightPurple,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.check_circle,
                            color: accentPurple,
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'Analysis Results',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Item Name
                    Text(
                      _itemData['name']!,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: primaryPurple,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Basic Info Grid
                    _buildInfoGrid(),
                    const SizedBox(height: 16),

                    // Description
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: lightPurple.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.description,
                                size: 18,
                                color: accentPurple,
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Description',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: accentPurple,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            _itemData['description']!,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade700,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Save Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: saveToWardrobe,
                        icon: const Icon(Icons.checkroom, color: Colors.white),
                        label: const Text(
                          'Save to Wardrobe',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: accentPurple,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildInfoGrid() {
    final items = [
      {
        'icon': Icons.category,
        'label': 'Category',
        'value': _itemData['category']!,
      },
      {'icon': Icons.style, 'label': 'Type', 'value': _itemData['type']!},
      {'icon': Icons.palette, 'label': 'Color', 'value': _itemData['color']!},
      {
        'icon': Icons.texture,
        'label': 'Material',
        'value': _itemData['material']!,
      },
      {
        'icon': Icons.pattern,
        'label': 'Pattern',
        'value': _itemData['pattern']!,
      },
      {'icon': Icons.star, 'label': 'Style', 'value': _itemData['style']!},
      {
        'icon': Icons.wb_sunny,
        'label': 'Season',
        'value': _itemData['season']!,
      },
      {'icon': Icons.person, 'label': 'Gender', 'value': _itemData['gender']!},
      {'icon': Icons.straighten, 'label': 'Fit', 'value': _itemData['fit']!},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: lightPurple,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(item['icon'] as IconData, size: 24, color: accentPurple),
              const SizedBox(height: 6),
              Text(
                item['label'] as String,
                style: const TextStyle(
                  fontSize: 11,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                item['value'] as String,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );
      },
    );
  }
}