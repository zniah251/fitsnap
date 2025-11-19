import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  int _selectedDateIndex = 5; // Mặc định chọn ngày 21

  static const Color purpleColor = Color(0xFF7559D9);
  static const Color weatherDarkBlue = Color(0xFF1E2A47);

  // DỮ LIỆU
  final List<Map<String, dynamic>> weekDays = [
    {
      'day': '16',
      'label': 'Sun',
      'weatherType': 'sunny',
      'temp': '30°',
      'humidity': '60%',
      'rainStatus': 'Sunny',
      'minTemp': '25.0',
      'maxTemp': '32.0',
      'eventTitle': null,
      'eventLoc': null,
      'outfitImages': null,
    },
    {
      'day': '17',
      'label': 'Mon',
      'weatherType': 'cloud',
      'temp': '29°',
      'humidity': '65%',
      'rainStatus': 'Cloudy',
      'minTemp': '24.0',
      'maxTemp': '31.0',
      'eventTitle': null,
      'eventLoc': null,
      'outfitImages': null,
    },
    {
      'day': '18',
      'label': 'Tue',
      'weatherType': 'cloud',
      'temp': '28°',
      'humidity': '62%',
      'rainStatus': 'Cloudy',
      'minTemp': '24.5',
      'maxTemp': '30.5',
      'eventTitle': null,
      'eventLoc': null,
      'outfitImages': null,
    },
    {
      'day': '19',
      'label': 'Wed',
      'weatherType': 'rain_sun',
      'temp': '27°',
      'humidity': '70%',
      'rainStatus': 'Light Rain',
      'minTemp': '24.0',
      'maxTemp': '29.0',
      'eventTitle': 'Coffee Date',
      'eventLoc': 'HIGHLANDS COFFEE | 02-04PM',
      'outfitImages': [
        'image/item/rcma1.png',
        'image/item/rcmk1.png',
        'image/item/rcmq1.png',
        'image/item/rcmg1.png',
      ],
    },
    {
      'day': '20',
      'label': 'Thu',
      'weatherType': 'rain_sun',
      'temp': '27°',
      'humidity': '67%',
      'rainStatus': 'Light Rain',
      'minTemp': '22.6',
      'maxTemp': '29.8',
      'eventTitle': null,
      'eventLoc': null,
      'outfitImages': null,
    },
    {
      'day': '21',
      'label': 'Fri',
      'weatherType': 'rain_sun',
      'temp': '26°',
      'humidity': '82%',
      'rainStatus': 'Light Rain',
      'minTemp': '23.0',
      'maxTemp': '26.9',
      'eventTitle': 'Wedding Guest',
      'eventLoc': 'GEM CENTER | 11-12AM',
      'outfitImages': [
        'image/item/rcma.png',
        'image/item/rcmk.png',
        'image/item/rcmv.png',
        'image/item/rcmg.png',
      ],
    },
    {
      'day': '22',
      'label': 'Sat',
      'weatherType': 'rain_sun',
      'temp': '26°',
      'humidity': '83%',
      'rainStatus': 'Light Rain',
      'minTemp': '22.7',
      'maxTemp': '26.2',
      'eventTitle': null,
      'eventLoc': null,
      'outfitImages': null,
    },
  ];

  // 🔥 HÀM HIỆN MODAL THÊM EVENT
  void _showAddEventModal(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController locController = TextEditingController();
    TimeOfDay selectedTime = TimeOfDay.now();

    // Danh sách Tag
    final List<String> vibes = [
      'Smart', // Lịch sự
      'Formal', // Trang trọng
      'Dynamic', // Năng động
      'Casual', // Thường ngày
      'Cute', // Dễ thương
      'Cool', // Ngầu
      'Sporty', // Thể thao
      'Date', // Hẹn hò
      'Gala', // Dạ hội
    ];
    List<String> selectedVibes = [];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom + 20,
                left: 20,
                right: 20,
                top: 20,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 50,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Add New Event",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: purpleColor,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // 1. Tên Event
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: "Event Name",
                        prefixIcon: const Icon(Icons.event, color: purpleColor),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // 2. Địa điểm
                    TextField(
                      controller: locController,
                      decoration: InputDecoration(
                        labelText: "Location",
                        prefixIcon: const Icon(
                          Icons.location_on,
                          color: purpleColor,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // 3. Chọn giờ
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text(
                        "Time",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEDE7FF),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "${selectedTime.hour}:${selectedTime.minute.toString().padLeft(2, '0')} ${selectedTime.period == DayPeriod.am ? 'AM' : 'PM'}",
                          style: const TextStyle(
                            color: purpleColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      onTap: () async {
                        final TimeOfDay? picked = await showTimePicker(
                          context: context,
                          initialTime: selectedTime,
                        );
                        if (picked != null) {
                          setModalState(() => selectedTime = picked);
                        }
                      },
                    ),
                    const Divider(),

                    // 4. Chọn Tag (Max 3)
                    const Text(
                      "Vibe (Max 3)",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 8,
                      children: vibes.map((tag) {
                        bool isSelected = selectedVibes.contains(tag);
                        return FilterChip(
                          label: Text(tag),
                          selected: isSelected,
                          selectedColor: purpleColor.withOpacity(0.2),
                          labelStyle: TextStyle(
                            color: isSelected ? purpleColor : Colors.black,
                          ),
                          onSelected: (bool selected) {
                            setModalState(() {
                              if (selected) {
                                if (selectedVibes.length < 3)
                                  selectedVibes.add(tag);
                              } else {
                                selectedVibes.remove(tag);
                              }
                            });
                          },
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 24),

                    // 5. Nút Save
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: purpleColor,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          if (nameController.text.isNotEmpty) {
                            // CẬP NHẬT DỮ LIỆU RA MÀN HÌNH CHÍNH
                            setState(() {
                              String timeStr =
                                  "${selectedTime.hour}:${selectedTime.minute.toString().padLeft(2, '0')} ${selectedTime.period == DayPeriod.am ? 'AM' : 'PM'}";

                              // Gán dữ liệu vào ngày đang chọn
                              weekDays[_selectedDateIndex]['eventTitle'] =
                                  nameController.text;
                              weekDays[_selectedDateIndex]['eventLoc'] =
                                  "${locController.text} | $timeStr";

                              weekDays[_selectedDateIndex]['outfitImages'] = [
                                'image/item/rcma1.png',
                                'image/item/rcmk2.png',
                                'image/item/rcmq2.png',
                                'image/item/rcmg2.png',
                              ];
                            });
                            Navigator.pop(context); // Đóng modal
                          }
                        },
                        child: const Text(
                          "Save Event",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectedData = weekDays[_selectedDateIndex];

    // Lấy danh sách ảnh của ngày được chọn
    List<String>? outfitList = selectedData['outfitImages'];
    bool hasOutfit = outfitList != null && outfitList.length == 4;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Outfit Calendar',
          style: TextStyle(fontWeight: FontWeight.bold, color: purpleColor),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            // 1. NAVIGATION
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.chevron_left,
                    size: 30,
                    color: Colors.grey,
                  ),
                ),
                const Text(
                  'November 2025',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.chevron_right,
                    size: 30,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // 2. DATE STRIP
            SizedBox(
              height: 110,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: weekDays.length,
                itemBuilder: (context, index) {
                  final item = weekDays[index];
                  final isSelected = index == _selectedDateIndex;

                  return GestureDetector(
                    onTap: () => setState(() => _selectedDateIndex = index),
                    child: Container(
                      width: 65,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected ? purpleColor : Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: isSelected
                            ? null
                            : Border.all(color: Colors.grey.shade200),
                        boxShadow: [
                          if (!isSelected)
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            item['label'],
                            style: TextStyle(
                              fontSize: 12,
                              color: isSelected ? Colors.white70 : Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item['day'],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          ),
                          const SizedBox(height: 4),
                          _buildCustomWeatherIcon(
                            item['weatherType'],
                            size: 18,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item['temp'],
                            style: TextStyle(
                              fontSize: 10,
                              color: isSelected ? Colors.white : Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // 3. OUTFIT SUGGESTION
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F1E8),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Suggested Outfit',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // 🔥 LOGIC HIỂN THỊ ẢNH ĐỘNG
                  hasOutfit
                      ? Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: AspectRatio(
                                    aspectRatio: 1,
                                    child: _buildOutfitImage(outfitList![0]),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: AspectRatio(
                                    aspectRatio: 1,
                                    child: _buildOutfitImage(outfitList[1]),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Expanded(
                                  child: AspectRatio(
                                    aspectRatio: 1,
                                    child: _buildOutfitImage(outfitList[2]),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: AspectRatio(
                                    aspectRatio: 1,
                                    child: _buildOutfitImage(outfitList[3]),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      : SizedBox(
                          // KHÔNG CÓ ẢNH -> HIỆN THÔNG BÁO
                          height: 100,
                          width: double.infinity,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.checkroom,
                                  color: Colors.grey,
                                  size: 40,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "No outfit planned yet",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 4. EVENT INFO
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEDE7FF),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Symbols.calendar_month,
                      color: purpleColor,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          selectedData['eventTitle'] ?? 'No Event',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: selectedData['eventTitle'] != null
                                ? Colors.black87
                                : Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 4),
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
                                selectedData['eventLoc'] ?? 'Relaxing day...',
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // 🔥 NÚT ADD: GỌI MODAL
                  InkWell(
                    onTap: () => _showAddEventModal(context),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: purpleColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 5. DETAILED WEATHER BOX
            _buildDetailedWeatherBox(selectedData),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // --- WIDGETS HỖ TRỢ ---

  Widget _buildOutfitImage(String path) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        path,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => Container(
          color: Colors.white,
          child: const Center(
            child: Icon(Icons.image_not_supported, color: Colors.grey),
          ),
        ),
      ),
    );
  }

  Widget _buildCustomWeatherIcon(String type, {double size = 40}) {
    if (type == 'rain_sun' || type == 'light_rain') {
      return SizedBox(
        width: size,
        height: size,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Positioned(
              top: -size * 0.1,
              right: -size * 0.1,
              child: Icon(
                Icons.wb_sunny,
                color: Colors.amber,
                size: size * 0.6,
              ),
            ),
            Icon(Icons.cloud, color: Colors.grey[300], size: size * 0.8),
            Positioned(
              bottom: 0,
              child: Icon(
                Symbols.rainy,
                color: Colors.lightBlueAccent,
                size: size * 0.5,
              ),
            ),
          ],
        ),
      );
    } else if (type == 'sunny') {
      return Icon(Icons.wb_sunny, color: Colors.amber, size: size * 0.8);
    } else if (type == 'cloud') {
      return Icon(Icons.cloud, color: Colors.grey[400], size: size * 0.8);
    } else {
      return Icon(Symbols.rainy, color: Colors.blueAccent, size: size * 0.8);
    }
  }

  Widget _buildDetailedWeatherBox(Map<String, dynamic> data) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: weatherDarkBlue,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: weatherDarkBlue.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.location_on, color: Colors.white70, size: 14),
              SizedBox(width: 4),
              Text(
                "Ho Chi Minh City",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${data['label']} - Day ${data['day']}",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.water_drop, color: Colors.white70, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    "${data['humidity']}",
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildCustomWeatherIcon(data['weatherType'] ?? 'sunny', size: 60),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data['rainStatus'] ?? '',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "Forecast",
                    style: TextStyle(color: Colors.white54, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Divider(color: Colors.white24, height: 1),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    "${data['minTemp']} °C",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "Min Temp",
                    style: TextStyle(color: Colors.white54, fontSize: 12),
                  ),
                ],
              ),
              Container(width: 1, height: 30, color: Colors.white24),
              Column(
                children: [
                  Text(
                    "${data['maxTemp']} °C",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "Max Temp",
                    style: TextStyle(color: Colors.white54, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
