import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // This mock data is already in English
    final days = [
      {'month': 'May', 'day': '23', 'label': 'Fri'},
      {'month': 'May', 'day': '24', 'label': 'Sat'},
      {'month': 'May', 'day': '25', 'label': 'Sun', 'selected': true},
      {'month': 'May', 'day': '26', 'label': 'Mon'},
      {'month': 'May', 'day': '27', 'label': 'Tue'},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Outfit Calendar', // Translated
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF7559D9), // 💜 purple color
          ),
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
            // 🗓️ Month + Day
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(padding: EdgeInsets.only(bottom: 4, left: 4)),
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: days.length,
                itemBuilder: (context, index) {
                  final item = days[index];
                  final selected = item['selected'] == true;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Container(
                      width: 70,
                      decoration: BoxDecoration(
                        color: selected
                            ? const Color(0xFF7559D9)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            item['month'] as String,
                            style: TextStyle(
                              fontSize: 14,
                              color: selected ? Colors.white : Colors.black,
                            ),
                          ),
                          Text(
                            item['day'] as String,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: selected ? Colors.white : Colors.black,
                            ),
                          ),
                          Text(
                            item['label'] as String,
                            style: TextStyle(
                              color: selected ? Colors.white : Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 8),

            // 🔘 Full-width view buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF7559D9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Weekly View', // Translated
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      side: const BorderSide(color: Color(0xFF7559D9)),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Monthly View', // Translated
                      style: TextStyle(color: Color(0xFF7559D9)),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // 👕 Outfit suggestion (beige bg, 5 images)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F1E8), // 🩶 beige bg
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Suggested Outfit', // Translated
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Chip(
                        label: Text('Done'), // Already English
                        backgroundColor: Color(0xFFEDE7FF),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  AspectRatio(
                    aspectRatio:
                        4 /
                        3, // adjust frame ratio (higher = increase value after /)
                    child: Row(
                      children: [
                        // Left col: 3 images
                        Expanded(
                          flex: 3,
                          child: Column(
                            children: List.generate(3, (i) {
                              return Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.asset(
                                      'image/item/item_${i + 1}.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),

                        // Right col: 2 images
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: List.generate(2, (i) {
                              return Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.asset(
                                      'image/item/item_${i + 4}.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 🕒 Event info
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
                  const Icon(Symbols.schedule, color: Color(0xFF7559D9)),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'How to pitch a Design Sprint', // Already English
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '09:00 PM',
                          style: TextStyle(color: Colors.grey),
                        ), // Already English
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFFEDE7FF),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'To-do', // Already English
                      style: TextStyle(color: Color(0xFF7559D9)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
