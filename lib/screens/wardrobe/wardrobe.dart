import 'package:fitsnap/mainscreen.dart';
import 'package:fitsnap/screens/wardrobe/itemdetail.dart';
import 'package:flutter/material.dart';
import 'package:fitsnap/navbar.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class WardrobeScreen extends StatefulWidget {
  final List<Map<String, String>> allItems;
  const WardrobeScreen({super.key, required this.allItems});

  @override
  State<WardrobeScreen> createState() => WardrobeScreenState();
}

class WardrobeScreenState extends State<WardrobeScreen> {
  int _selectedIndex = 0;

  static const Color lightPurple = Color(0xFFEDE4FF);
  static const Color accentPurple = Color(0xFF5F33E1);

  // Cố định category theo các loại của bạn (ĐÃ THÊM GIÀY VÀ ÁO POLO)
  final List<Map<String, dynamic>> categories = [
    {'icon': Symbols.shopping_bag, 'label': 'Jacket', 'type': 'Jacket'},
    {'icon': Symbols.ac_unit, 'label': 'Sweater', 'type': 'Sweater'},
    {'icon': Symbols.checkroom, 'label': 'T-shirt', 'type': 'T-shirt'},
    {'icon': Symbols.checkroom, 'label': 'Shirt', 'type': 'Shirt'},
    {'icon': Symbols.woman, 'label': 'Blouse', 'type': 'Blouse'},
    {'icon': Symbols.trending_flat, 'label': 'Trouser', 'type': 'Trouser'},
    {'icon': Symbols.dry_cleaning, 'label': 'Dress', 'type': 'Dress'},
    {
      'icon': Symbols.airline_seat_legroom_reduced,
      'label': 'Short',
      'type': 'Short',
    },
    // 👇 THÊM ÁO POLO
    {'icon': Symbols.apparel, 'label': 'Polo', 'type': 'Polo Shirt'},
    // 👇 THÊM GIÀY
    {'icon': Symbols.footprint, 'label': 'Shoes', 'type': 'Shoes'},
  ];

  String selectedType = "Jacket";

  int selectedIndex = 0;

  // ... (Phần khai báo list categories và items giữ nguyên) ...

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightPurple,
      body: Column(
        children: [
          _buildHeader(),
          _buildCategorySelector(),
          Expanded(child: _buildFilteredItemsList()),
        ],
      ),
      // 👇 SỬA PHẦN NÀY (Giữ nguyên logic của bạn)
      bottomNavigationBar: CustomBottomNav(
        selectedIndex: selectedIndex,
        onItemTapped: (index) {
          // 1. Nếu bấm vào chính tab Wardrobe (index 1) thì không làm gì
          if (index == selectedIndex) return;

          // 2. Nếu bấm nút khác -> Chuyển hướng về MainScreen
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

  Widget _buildHeader() {
    return Container(
      decoration: const BoxDecoration(
        color: accentPurple,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                    'Virtual Wardrobe',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 15,
                    child: Icon(Icons.person, color: accentPurple, size: 20),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: Colors.grey, size: 20),
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
    );
  }

  Widget _buildCategorySelector() {
    return Container(
      height: 130,
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          children: [
            const SizedBox(width: 20),
            ...categories.map((category) {
              bool isSelected = category['type'] == selectedType;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedType = category['type'];
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 20),
                  width: 70,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? accentPurple.withOpacity(0.2)
                        : const Color.fromARGB(255, 248, 242, 250),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(category['icon'], color: Colors.black, size: 30),
                      const SizedBox(height: 6),
                      Text(
                        category['label'],
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildFilteredItemsList() {
    final filteredItems = widget.allItems
        .where((item) => item['type'] == selectedType)
        .toList();

    return ListView(
      padding: const EdgeInsets.only(top: 8),
      children: [
        _buildClothesSection(
          selectedType,
          filteredItems.length.toString(),
          filteredItems,
        ),
      ],
    );
  }

  Widget _buildClothesSection(
    String title,
    String count,
    List<Map<String, String>> items,
  ) {
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
            itemCount: items.length,
            itemBuilder: (context, index) {
              var item = items[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ItemDetailScreen(itemData: item),
                    ),
                  );
                },
                child: Container(
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
                      item['imageUrl'] ?? '',
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
