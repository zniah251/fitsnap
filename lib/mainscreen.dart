import 'package:flutter/material.dart';
import 'package:fitsnap/navbar.dart';

// Import các màn hình con của bạn
import 'package:fitsnap/screens/home/home_screen.dart';
import 'package:fitsnap/screens/calendar/calendar.dart'; // Hoặc WardrobeScreen
import 'package:fitsnap/screens/virtual_try-on/insert.dart';
import 'package:fitsnap/screens/profile/profile.dart';

class MainScreen extends StatefulWidget {
  // Tham số này giúp bạn mở MainScreen tại một tab cụ thể
  final int initialIndex;

  // Mặc định nếu không truyền gì thì mở tab 0 (Home)
  const MainScreen({super.key, this.initialIndex = 0});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int _selectedIndex;

  // Danh sách màn hình khớp thứ tự: 0, 1, 2, 3
  final List<Widget> _screens = [
    const HomeScreen(), // Index 0
    const CalendarScreen(), // Index 1
    const InsertScreen(), // Index 2
    const ProfileScreen(), // Index 3
  ];

  @override
  void initState() {
    super.initState();
    // Khởi tạo tab được chọn dựa trên tham số truyền vào
    _selectedIndex = widget.initialIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Dùng IndexedStack để giữ trạng thái (không bị load lại khi chuyển tab)
      body: IndexedStack(index: _selectedIndex, children: _screens),
      bottomNavigationBar: CustomBottomNav(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
