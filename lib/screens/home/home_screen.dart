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
                      '80',
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
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ScanScreen(),
                                  ),
                                );
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
            MaterialPageRoute(builder: (context) => const WardrobeScreen()),
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
