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

  // 👉 Hàm xử lý khi click item
  void onClothesSelected(int index) {
    print("Clicked item ${index + 1}");
    // TODO: Xử lý thử đồ ở đây
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightPurple,
      appBar: AppBar(
        backgroundColor: lightPurple,
        elevation: 0,
        // automaticallyImplyLeading: false, // ❌ BỎ dòng này hoặc set là true (nhưng dùng leading thủ công thì dòng này không quan trọng)
        centerTitle: true,

        // ✅ THÊM: Nút Back ở góc trái
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios, // Dùng icon mũi tên kiểu iOS cho đẹp
            color: Colors.black,
            size: 22,
          ),
          onPressed: () {
            Navigator.pop(context); // Quay lại trang InsertScreen trước đó
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
          // LEFT — user image
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
                      child: Image.file(
                        widget.imageFile,
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
                  itemCount: 30,
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
                            'image/item/item_${index + 1}.png',
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
          // Điều hướng về MainScreen và chọn đúng Tab
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
