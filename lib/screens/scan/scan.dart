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

  // Mock data - sẽ được thay thế bằng dữ liệu từ API/Gemini
  final Map<String, String> _itemData = {
    'name': 'Áo Sơ Mi Oxford',
    'category': 'Áo',
    'type': 'Sơ mi',
    'color': 'Xanh navy',
    'material': 'Cotton Oxford',
    'pattern': 'Trơn',
    'style': 'Formal',
    'season': 'All Season',
    'gender': 'Nam',
    'fit': 'Slim fit',
    'description':
        'Áo sơ mi Oxford chất liệu cotton cao cấp, thiết kế thanh lịch phù hợp cho môi trường công sở. Có thể kết hợp với quần tây hoặc chinos.',
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
          _isAnalyzed = false;
        }
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Không thể chọn ảnh. Vui lòng thử lại.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  Future<void> analyzeImage() async {
    setState(() => _isLoading = true);

    // Simulate API call - Replace with actual Gemini API call
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isLoading = false;
      _isAnalyzed = true;
    });
  }

  void saveToWardrobe() {
    // TODO: Implement save to wardrobe functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Đã lưu vào tủ đồ!'),
        backgroundColor: accentPurple,
        duration: Duration(seconds: 2),
      ),
    );

    // Navigate back or to wardrobe
    Navigator.pop(context);
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
                            Icons.qr_code_scanner,
                            size: 80,
                            color: accentPurple.withOpacity(0.5),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Chụp hoặc chọn ảnh quần áo',
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
                              child: CircularProgressIndicator(
                                color: Colors.white,
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
                      onPressed: getImage,
                      icon: Icon(
                        _image == null ? Icons.photo_library : Icons.refresh,
                        color: accentPurple,
                      ),
                      label: Text(
                        _image == null ? 'Chọn ảnh' : 'Đổi ảnh',
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
                          'Phân tích',
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
                          'Kết quả phân tích',
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
                                'Mô tả',
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
                          'Lưu vào tủ đồ',
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
        'label': 'Loại',
        'value': _itemData['category']!,
      },
      {'icon': Icons.style, 'label': 'Kiểu', 'value': _itemData['type']!},
      {'icon': Icons.palette, 'label': 'Màu sắc', 'value': _itemData['color']!},
      {
        'icon': Icons.texture,
        'label': 'Chất liệu',
        'value': _itemData['material']!,
      },
      {
        'icon': Icons.pattern,
        'label': 'Họa tiết',
        'value': _itemData['pattern']!,
      },
      {'icon': Icons.star, 'label': 'Phong cách', 'value': _itemData['style']!},
      {'icon': Icons.wb_sunny, 'label': 'Mùa', 'value': _itemData['season']!},
      {
        'icon': Icons.person,
        'label': 'Giới tính',
        'value': _itemData['gender']!,
      },
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
