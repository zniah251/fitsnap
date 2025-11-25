import 'package:fitsnap/mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:fitsnap/navbar.dart';
import 'dart:io';

class TryOnScreen extends StatefulWidget {
  final File imageFile;

  const TryOnScreen({super.key, required this.imageFile});

  @override
  State<TryOnScreen> createState() => _TryOnScreenState();
}

class _TryOnScreenState extends State<TryOnScreen> {
  int _selectedIndex = 2;

  static const Color lightPurple = Color(0xFFEDE4FF);
  static const Color accentPurple = Color(0xFF5F33E1);
  static const Color slightlyDarkerPurple = Color(0xFFE5D3FF);

  // Danh sách các file ảnh quần áo
  final List<String> _itemImages = [
    'rcma.png',
    'rcma1.png',
    'rcma2.png',
    'rcma3.png',
    'rcmg.png',
    'rcmg1.png',
    'rcmg2.png',
    'rcmg3.png',
    'rcmk.png',
    'rcmk1.png',
    'rcmk2.png',
    'rcmk3.png',
    'rcmk4.png',
    'rcmq1.png',
    'rcmq2.png',
    'rcmq3.png',
    'rcmq4.png',
    'rcmv.png',
    'tn.png',
  ];

  // Biến để lưu ảnh đang hiển thị bên trái
  // Ban đầu là ảnh người dùng chụp/chọn (kiểu File)
  // Sau khi click, sẽ đổi thành ảnh mẫu (kiểu String - đường dẫn asset)
  dynamic _displayingImage;
  bool _isUsingAssetImage = false; // Cờ để biết đang dùng ảnh File hay Asset

  @override
  void initState() {
    super.initState();
    // Khởi tạo ảnh hiển thị ban đầu là ảnh từ widget truyền sang
    _displayingImage = widget.imageFile;
    _isUsingAssetImage = false;
  }

  // 👉 Hàm xử lý khi click item
  void onClothesSelected(int index) {
    print("Clicked item: ${_itemImages[index]}");

    setState(() {
      // Đổi ảnh hiển thị sang ảnh mẫu trong asset
      _displayingImage = 'image/body/modelat.png';
      _isUsingAssetImage = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightPurple,
      appBar: AppBar(
        backgroundColor: lightPurple,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 22),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Virtual Try-On',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Row(
        children: [
          // LEFT — user image (Hiển thị ảnh động dựa trên trạng thái)
          Expanded(
            flex: 3,
            child: Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: lightPurple,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: lightPurple, width: 1.5),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18.5),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Center(
                      // Kiểm tra để hiển thị đúng loại ảnh (File hoặc Asset)
                      child: _isUsingAssetImage
                          ? Image.asset(
                              _displayingImage as String, // Ép kiểu về String
                              fit: BoxFit.contain,
                              width: constraints.maxWidth,
                              height: constraints.maxHeight,
                              errorBuilder: (context, error, stackTrace) {
                                // Xử lý nếu ảnh asset không tìm thấy
                                return const Center(child: Icon(Icons.error));
                              },
                            )
                          : Image.file(
                              _displayingImage as File, // Ép kiểu về File
                              fit: BoxFit.contain,
                              width: constraints.maxWidth,
                              height: constraints.maxHeight,
                            ),
                    );
                  },
                ),
              ),
            ),
          ),

          // RIGHT — clickable clothes grid
          Expanded(
            flex: 2,
            child: Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: slightlyDarkerPurple,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: accentPurple.withOpacity(0.15)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: GridView.builder(
                  itemCount: _itemImages.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => onClothesSelected(index), // 👉 Click item
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.white, width: 1),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            'image/item/${_itemImages[index]}',
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey[100],
                                child: const Center(
                                  child: Icon(
                                    Icons.image_outlined,
                                    color: Colors.grey,
                                    size: 32,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: CustomBottomNav(
        selectedIndex: _selectedIndex,
        onItemTapped: (index) {
          if (index == _selectedIndex) return;
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => MainScreen(initialIndex: index),
            ),
            (route) => false,
          );
        },
      ),
    );
  }
}
