import 'package:flutter/material.dart';
import 'package:fitsnap/screens/wardrobe/wardrobe.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedTab = 'Work';
  int selectedNavIndex = 0;

  static const Color primaryPurple = Color(0xFF986DF4);
  static const Color lightPurple = Color(0xFFEDE4FF);
  static const Color accentPurple = Color(0xFF5F33E1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: primaryPurple,
              padding: const EdgeInsets.fromLTRB(16, 30, 16, 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Hello!',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Bao Chau',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.notifications,
                        color: Colors.white,
                        size: 24,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.calendar_today, size: 16),
                            const SizedBox(width: 8),
                            const Text(
                              'Thursday, 03 October',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            _buildTab('Work'),
                            const SizedBox(width: 12),
                            _buildTab('Party'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    flex: 4, // Tăng flex để ô rộng hơn
                    child: _buildStatCard(
                      'Wardrobe',
                      '80',
                      'Items',
                      Icons.checkroom,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 4, // Tăng flex để ô rộng hơn
                    child: _buildStatCard(
                      'Saved',
                      '37',
                      'Outfits',
                      Icons.bookmark,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 3, // Giảm flex để ô nhỏ hơn
                    child: SizedBox(
                      height: 125,
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: lightPurple,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                ),
                              ),
                              child: const Icon(
                                Icons.add,
                                size: 28,
                                color: accentPurple,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: lightPurple,
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(12),
                                  bottomRight: Radius.circular(12),
                                ),
                              ),
                              child: const Icon(
                                Icons.qr_code_scanner,
                                size: 24,
                                color: accentPurple,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Your outfits today section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Your outfits today !',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'All week',
                    style: TextStyle(fontSize: 12, color: accentPurple),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                height: 170, // Set chiều cao cố định cho container cha
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: _buildOutfitCard(
                        'image/item/item_1.jpg',
                        double.infinity,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Expanded(
                            child: _buildOutfitCard(
                              'image/item/item_2.jpg',
                              double.infinity,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Expanded(
                            child: _buildOutfitCard(
                              'image/item/item_3.jpg',
                              double.infinity,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      flex: 1,
                      child: _buildOutfitCard(
                        'image/item/item_4.jpg',
                        double.infinity,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Recommend section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Text(
                'Recommend',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                height: 170, // Set chiều cao cố định cho container cha
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: _buildProductCard(
                        'image/item/item_1.jpg',
                        double.infinity,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Expanded(
                            child: _buildProductCard(
                              'image/item/item_2.jpg',
                              double.infinity,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Expanded(
                            child: _buildProductCard(
                              'image/item/item_4.jpg',
                              double.infinity,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      flex: 1,
                      child: _buildProductCard(
                        'image/item/item_5.jpg',
                        double.infinity,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String label) {
    bool isSelected = selectedTab == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = label;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? lightPurple : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: isSelected ? accentPurple : Colors.grey,
          ),
        ),
      ),
    );
  }

  // Thay đổi height của stat cards
  Widget _buildStatCard(
    String title,
    String number,
    String subtitle,
    IconData icon,
  ) {
    return GestureDetector(
      onTap: () {
        if (title == 'Wardrobe') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const WardrobeScreen()),
          );
        }
      },
      child: Container(
        height: 125, // Increased from 110 to 125 to accommodate content
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: lightPurple,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon, size: 24, color: accentPurple),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min, // Add this to prevent expansion
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 2), // Reduced from 4
                Text(
                  number,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOutfitCard(String imagePath, double width) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: lightPurple, width: 3),
      ),
      child: AspectRatio(
        aspectRatio: 0.2, // Giảm từ 0.7 xuống 0.6 để tăng chiều cao
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.white,
              child: Icon(Icons.image, size: 40, color: Colors.grey.shade300),
            );
          },
        ),
      ),
    );
  }

  Widget _buildProductCard(String imagePath, double width) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: lightPurple, width: 3),
      ),
      child: AspectRatio(
        aspectRatio: 0.2, // Giảm từ 0.7 xuống 0.6 để tăng chiều cao
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.white,
              child: Icon(Icons.image, size: 40, color: Colors.grey.shade300),
            );
          },
        ),
      ),
    );
  }
}
