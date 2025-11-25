import 'package:fitsnap/screens/scan/scan.dart';
import 'package:flutter/material.dart';
import 'package:fitsnap/screens/wardrobe/wardrobe.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedNavIndex = 0;

  static const Color primaryPurple = Color(0xFF986DF4);
  static const Color lightPurple = Color(0xFFEDE4FF);
  static const Color accentPurple = Color(0xFF5F33E1);

  // Temporary item list
  final List<Map<String, String>> _allItems = [
    // Jackets
    {
      'type': 'Jacket',
      'color': 'Beige',
      'material': 'Nylon',
      'pattern': 'Solid',
      'style': 'Casual',
      'fit': 'Regular',
      'description': 'A stylish beige nylon jacket for everyday wear.',
      'imageUrl': 'image/item/rcmk.png',
    },
    {
      'type': 'Jacket',
      'color': 'Red',
      'material': 'Leather',
      'pattern': 'Solid',
      'style': 'Biker',
      'fit': 'Slim',
      'description': 'Classic black leather biker jacket.',
      'imageUrl': 'image/item/rcmk1.png',
    },
    {
      'type': 'Jacket',
      'color': 'Gray',
      'material': 'Wool',
      'pattern': 'Solid',
      'style': 'Formal',
      'fit': 'Regular',
      'description':
          'A formal gray wool jacket, perfect for business meetings.',
      'imageUrl': 'image/item/rcmk2.png',
    },
    {
      'type': 'Jacket',
      'color': 'Brown',
      'material': 'Suede',
      'pattern': 'Solid',
      'style': 'Casual',
      'fit': 'Regular',
      'description': 'A casual brown suede jacket.',
      'imageUrl': 'image/item/rcmk3.png',
    },
    {
      'type': 'Jacket',
      'color': 'Cream',
      'material': 'Fleece',
      'pattern': 'Solid',
      'style': 'Cozy',
      'fit': 'Loose',
      'description': 'A cozy and warm cream-colored fleece jacket.',
      'imageUrl': 'image/item/rcmk4.png',
    },

    // T-shirts, Polos, Blouses
    {
      'type': 'T-shirt',
      'color': 'White',
      'material': 'Cotton',
      'pattern': 'Graphic',
      'style': 'Casual',
      'fit': 'Regular',
      'description': 'A casual white cotton t-shirt with a stylish graphic.',
      'imageUrl': 'image/item/rcma.png',
    },
    {
      'type': 'Polo Shirt',
      'color': 'Black',
      'material': 'Pique',
      'pattern': 'Solid',
      'style': 'Sporty',
      'fit': 'Regular',
      'description': 'A classic black pique polo shirt.',
      'imageUrl': 'image/item/rcma1.png',
    },
    {
      'type': 'T-shirt',
      'color': 'Gray',
      'material': 'Cotton',
      'pattern': 'Solid',
      'style': 'Minimalist',
      'fit': 'Slim',
      'description': 'A minimalist gray cotton t-shirt.',
      'imageUrl': 'image/item/rcma2.png',
    },
    {
      'type': 'Blouse',
      'color': 'White',
      'material': 'Silk',
      'pattern': 'Solid',
      'style': 'Elegant',
      'fit': 'Loose',
      'description': 'An elegant white silk blouse with a flowing fit.',
      'imageUrl': 'image/item/rcma3.png',
    },

    // Trousers & Shorts
    {
      'type': 'Trouser',
      'color': 'Khaki',
      'material': 'Cotton',
      'pattern': 'Solid',
      'style': 'Casual',
      'fit': 'Regular',
      'description': 'Comfortable khaki cotton trousers for a relaxed look.',
      'imageUrl': 'image/item/rcmq1.png',
    },
    {
      'type': 'Short',
      'color': 'Black',
      'material': 'Wool',
      'pattern': 'Solid',
      'style': 'Formal',
      'fit': 'Slim',
      'description': 'Slim-fit gray wool short for formal occasions.',
      'imageUrl': 'image/item/rcmq2.png',
    },
    {
      'type': 'Trouser',
      'color': 'Black',
      'material': 'Linen',
      'pattern': 'Solid',
      'style': 'Casual',
      'fit': 'Regular',
      'description': 'Classic trouser for a casual summer style.',
      'imageUrl': 'image/item/rcmq3.png',
    },
    {
      'type': 'Short',
      'color': 'White',
      'material': 'Polyester',
      'pattern': 'Solid',
      'style': 'Sporty',
      'fit': 'Regular',
      'description': 'Sporty with track short made from lightweight polyester.',
      'imageUrl': 'image/item/rcmq4.png',
    },

    // Dresses
    {
      'type': 'Dress',
      'color': 'Blue',
      'material': 'Chiffon',
      'pattern': 'Floral',
      'style': 'Bohemian',
      'fit': 'Flowy',
      'description':
          'A beautiful blue floral chiffon dress with a bohemian vibe.',
      'imageUrl': 'image/item/rcmv.png',
    },

    // Shoes
    {
      'type': 'Shoes',
      'color': 'White',
      'material': 'Leather',
      'pattern': 'Solid',
      'style': 'Sneaker',
      'fit': 'Regular',
      'description':
          'Classic white leather sneakers for a clean, timeless look.',
      'imageUrl': 'image/item/rcmg.png',
    },
    {
      'type': 'Shoes',
      'color': 'Black',
      'material': 'Leather',
      'pattern': 'Solid',
      'style': 'Formal',
      'fit': 'Regular',
      'description': 'Elegant black leather formal shoes.',
      'imageUrl': 'image/item/rcmg1.png',
    },
    {
      'type': 'Shoes',
      'color': 'Brown',
      'material': 'Suede',
      'pattern': 'Solid',
      'style': 'Loafer',
      'fit': 'Regular',
      'description': 'Comfortable brown suede loafers for a smart-casual look.',
      'imageUrl': 'image/item/rcmg2.png',
    },
    {
      'type': 'Shoes',
      'color': 'Gray',
      'material': 'Canvas',
      'pattern': 'Solid',
      'style': 'Casual',
      'fit': 'Regular',
      'description': 'Versatile gray canvas sneakers for everyday use.',
      'imageUrl': 'image/item/rcmg3.png',
    },
  ];

  String CurrentDateManual() {
    DateTime now = DateTime.now();

    List<String> thuVietnamese = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];

    List<String> months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];

    // weekday bắt đầu từ 1, nhưng List bắt đầu từ 0 nên phải trừ 1
    String thuHienTai = thuVietnamese[now.weekday - 1];
    String monthName = months[now.month - 1];

    return '$thuHienTai, ${now.day} $monthName';
  }

  @override
  Widget build(BuildContext context) {
    String currentDate = CurrentDateManual(); // Gọi hàm lấy ngày

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HEADER TÍM
            Container(
              color: primaryPurple,
              padding: const EdgeInsets.fromLTRB(
                16,
                40,
                16,
                20,
              ), // Tăng padding top chút cho đẹp
              child: Column(
                children: [
                  // 1. Hello + Avatar
                  const SizedBox(
                    height: 20,
                  ), // Khoảng cách giữa Hello và Box trắng
                  // 2. WHITE BOX: Calendar + EVENT INFO
                  Container(
                    width: double.infinity, // Full width
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        // Thêm bóng nhẹ cho box nổi lên
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // --- Dòng Ngày Tháng ---
                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_today,
                              size: 18,
                              color: accentPurple,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                currentDate,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),

                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: Divider(
                            height: 1,
                            color: Color(0xFFEEEEEE),
                          ), // Đường kẻ mờ phân cách
                        ),

                        // --- PHẦN EVENT MỚI THÊM ---
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Nhãn nhỏ
                            Text(
                              'UPCOMING EVENT',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: accentPurple.withOpacity(0.8),
                                letterSpacing: 1.0,
                              ),
                            ),
                            const SizedBox(height: 6),

                            // Tên sự kiện
                            const Text(
                              'Wedding Guest',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w900, // Siêu đậm
                                color: Colors.black,
                                letterSpacing:
                                    0.5, // Giãn chữ nhẹ cho giống thiết kế
                              ),
                            ),
                            const SizedBox(height: 4),

                            // Địa điểm | Thời gian
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  size: 14,
                                  color: Colors.grey,
                                ),
                                const SizedBox(width: 4),
                                Expanded(
                                  child: Text(
                                    'GEM CENTER, DISTRICT 1 | 11-12AM',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey[600],
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
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
                    flex: 4,
                    child: _buildStatCard(
                      'Wardrobe',
                      _allItems.length.toString(),
                      'Items',
                      Icons.checkroom,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 4,
                    child: _buildStatCard(
                      'Saved',
                      '37',
                      'Outfits',
                      Icons.bookmark,
                    ),
                  ),
                  const SizedBox(width: 12),

                  // ADD + QR COLUMN
                  Expanded(
                    flex: 3,
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
                                Icons.qr_code_scanner,
                                size: 28,
                                color: accentPurple,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                final newItem = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ScanScreen(),
                                  ),
                                );
                                if (newItem != null &&
                                    newItem is Map<String, String>) {
                                  setState(() {
                                    _allItems.add(newItem);
                                  });
                                }
                              },
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
                                  Icons.add,
                                  size: 24,
                                  color: accentPurple,
                                ),
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

            // ─────────────────────────────────────────────
            // OUTFITS TODAY
            // ─────────────────────────────────────────────
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

            // ... (Phần tiêu đề "Your outfits today" giữ nguyên) ...
            const SizedBox(height: 12),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: _buildOutfitCard(
                            'image/item/rcma.png',
                            double.infinity,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: _buildOutfitCard(
                            'image/item/rcmk.png',
                            double.infinity,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12), // Khoảng cách giữa 2 hàng
                  // --- HÀNG 2 ---
                  Row(
                    children: [
                      // Món 3 (Phụ kiện - rcmk)
                      Expanded(
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: _buildOutfitCard(
                            'image/item/rcmv.png',
                            double.infinity,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),

                      // Món 4 (Giày - rcmg)
                      Expanded(
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: _buildOutfitCard(
                            'image/item/rcmg.png',
                            double.infinity,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String label) {
    //bool isSelected = selectedTab == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          //selectedTab = label;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          //color: isSelected ? lightPurple : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            //color: isSelected ? accentPurple : Colors.grey,
          ),
        ),
      ),
    );
  }

  // WARDROBE CARD
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
            MaterialPageRoute(
              builder: (context) => WardrobeScreen(allItems: _allItems),
            ),
          );
        }
      },
      child: Container(
        height: 125,
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
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 2),
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
        aspectRatio: 0.2,
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
        aspectRatio: 0.2,
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
