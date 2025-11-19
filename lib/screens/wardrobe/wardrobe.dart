import 'package:fitsnap/screens/wardrobe/itemdetail.dart'; // Đảm bảo đường dẫn này đúng
import 'package:flutter/material.dart';
import 'package:fitsnap/navbar.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class WardrobeScreen extends StatefulWidget {
  const WardrobeScreen({super.key});

  @override
  State<WardrobeScreen> createState() => WardrobeScreenState();
}

class WardrobeScreenState extends State<WardrobeScreen> {
  int _selectedIndex = 0;

  static const Color lightPurple = Color(0xFFEDE4FF);
  static const Color accentPurple = Color(0xFF5F33E1);

  // Labels kept in English as requested
  final List<Map<String, dynamic>> categories = [
    {'icon': Symbols.checkroom, 'label': 'T-shirt', 'count': '17'},
    {'icon': Symbols.dry_cleaning, 'label': 'Dress', 'count': '17'},
    {'icon': Symbols.shopping_bag, 'label': 'Jacket', 'count': '17'},
    {'icon': Symbols.trending_flat, 'label': 'Trousers', 'count': '17'},
    {'icon': Symbols.diamond, 'label': 'Jewelry', 'count': '17'},
    {'icon': Symbols.wb_sunny, 'label': 'Outerwear', 'count': '17'},
    {'icon': Symbols.ac_unit, 'label': 'Sweater', 'count': '17'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightPurple,
      body: Column(
        children: [
          // HEADER
          Container(
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

          // CATEGORY SECTION
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
                      height: 90, // Keep height 90 to avoid overflow
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 248, 242, 250),
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
                              fontWeight: FontWeight.w400,
                              color: Colors.black87,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
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

          // BODY LIST
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(top: 8),
              children: [
                _buildClothesSection('Jackets', '17'), // Translated
                _buildClothesSection('Sweaters', '17'), // Translated
                _buildClothesSection('T-shirts', '17'), // Translated
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
    // Mock data translated to English
    final List<Map<String, String>> mockItems = [
      {
        'category': 'Clothing',
        'type': 'Jacket',
        'color': 'Black',
        'material': 'Cotton',
        'pattern': 'Solid',
        'style': 'Casual',
        'fit': 'Regular',
        'description': 'Classic denim jacket, perfect for fall and winter.',
        'imageUrl': 'image/item/item_1.png',
      },
      {
        'category': 'Clothing',
        'type': 'Sweater',
        'color': 'Navy Blue',
        'material': 'Wool',
        'pattern': 'Striped',
        'style': 'Preppy',
        'fit': 'Slim',
        'description': 'Soft wool sweater, keeps you warm.',
        'imageUrl': 'image/item/item_2.png',
      },
      {
        'category': 'Clothing',
        'type': 'T-shirt',
        'color': 'White',
        'material': 'Cotton',
        'pattern': 'Solid',
        'style': 'Minimalist',
        'fit': 'Regular',
        'description': 'Basic white t-shirt, easy to match.',
        'imageUrl': 'image/item/item_3.png',
      },
    ];

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
            itemCount: mockItems.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ItemDetailScreen(itemData: mockItems[index]),
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
                      mockItems[index]['imageUrl']!,
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
