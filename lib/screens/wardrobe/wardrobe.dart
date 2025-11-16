import 'package:flutter/material.dart';
import 'package:fitsnap/navbar.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart'; // ✅ import thêm bộ icon hiện đại

class WardrobeScreen extends StatefulWidget {
  const WardrobeScreen({super.key});

  @override
  State<WardrobeScreen> createState() => WardrobeScreenState();
}

class WardrobeScreenState extends State<WardrobeScreen> {
  int _selectedIndex = 0;

  static const Color lightPurple = Color(0xFFEDE4FF);
  static const Color accentPurple = Color(0xFF5F33E1);

  // ✅ Danh sách category có icon riêng phù hợp hơn
  final List<Map<String, dynamic>> categories = [
    {'icon': Symbols.checkroom, 'label': 'T-shirt', 'count': '17'}, // áo
    {'icon': Symbols.dry_cleaning, 'label': 'Dress', 'count': '17'}, // váy
    {
      'icon': Symbols.shopping_bag,
      'label': 'Jacket',
      'count': '17',
    }, // áo khoác
    {'icon': Symbols.trending_flat, 'label': 'Trousers', 'count': '17'}, // quần
    {'icon': Symbols.diamond, 'label': 'Jewelry', 'count': '17'}, // trang sức
    {
      'icon': Symbols.wb_sunny,
      'label': 'Outerwear',
      'count': '17',
    }, // đồ đi ngoài
    {'icon': Symbols.ac_unit, 'label': 'Sweater', 'count': '17'}, // đồ ấm
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightPurple,
      body: Column(
        children: [
          // HEADER (giữ nguyên)
          Container(
            decoration: BoxDecoration(
              color: accentPurple,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: SafeArea(
              bottom: false,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        const Text(
                          'Tủ Đồ Ảo',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 15,
                          child: Icon(
                            Icons.person,
                            color: accentPurple,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      bottom: 20,
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.search,
                            color: Colors.grey,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search',
                                hintStyle: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 14,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          const Icon(Icons.tune, color: Colors.grey, size: 20),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ✅ CATEGORY — phiên bản đẹp hơn
          Container(
            height: 130,
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  ...categories.map(
                    (category) => Container(
                      margin: const EdgeInsets.only(right: 20),
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(
                          255,
                          248,
                          242,
                          250,
                        ), // Hồng nhạt
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            category['icon'],
                            color: const Color.fromARGB(255, 0, 0, 0),
                            size: 30,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            category['label'],
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                ],
              ),
            ),
          ),

          // GRID (giữ nguyên)
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(top: 8),
              children: [
                _buildClothesSection('Áo khoác', '17'),
                _buildClothesSection('Sweater', '17'),
                _buildClothesSection('Áo thun', '17'),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNav(
        selectedIndex: _selectedIndex,
        onItemTapped: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildClothesSection(String title, String count) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                count,
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                width: 120,
                margin: EdgeInsets.only(left: index == 0 ? 16 : 8, right: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: accentPurple.withOpacity(0.2)),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'image/item/item_${index + 1}.png',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Icon(
                          Icons.image_outlined,
                          color: Colors.grey,
                          size: 32,
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
