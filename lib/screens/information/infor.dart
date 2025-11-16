import 'package:flutter/material.dart';

class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  static const Color primaryPurple = Color(0xFF7559D9);
  static const Color lightPurple = Color(0xFFEDE7FF);
  static const Color beigeBackground = Color(0xFFF5F1E8);

  String? selectedGender;
  int currentStep = 0;
  final TextEditingController ageController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController jobController = TextEditingController();

  List<String> selectedStyles = [];
  List<String> selectedColors = [];
  List<String> selectedPurposes = [];

  final List<String> styles = [
    'Casual',
    'Formal',
    'Sporty',
    'Streetwear',
    'Vintage/Retro',
    'Minimalist',
  ];

  final List<Map<String, dynamic>> colors = [
    {'name': 'Đen', 'color': Colors.black},
    {'name': 'Trắng', 'color': Colors.white},
    {'name': 'Xanh dương', 'color': Colors.blue},
    {'name': 'Nâu', 'color': Colors.brown},
    {'name': 'Pastel', 'color': Color(0xFFFFB6C1)},
    {'name': 'Xám', 'color': Colors.grey},
    {'name': 'Be', 'color': Color(0xFFF5F5DC)},
    {'name': 'Xanh lá', 'color': Colors.green},
  ];

  final List<String> purposes = [
    'Đi làm / công sở',
    'Đi học / đi chơi hàng ngày',
    'Thể thao / tập gym',
    'Dự tiệc / dịp đặc biệt',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: currentStep > 0
            ? IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => setState(() => currentStep--),
              )
            : null,
        title: Text(
          'Thiết lập hồ sơ',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: primaryPurple,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Progress Indicator
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: List.generate(4, (index) {
                return Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    height: 4,
                    decoration: BoxDecoration(
                      color: index <= currentStep
                          ? primaryPurple
                          : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                );
              }),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: _buildCurrentStep(),
            ),
          ),
          // Next Button
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: _canProceed()
                      ? primaryPurple
                      : Colors.grey.shade300,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  elevation: _canProceed() ? 2 : 0,
                ),
                onPressed: _canProceed() ? _handleNext : null,
                child: Text(
                  currentStep == 3 ? 'Hoàn thành' : 'Tiếp tục',
                  style: TextStyle(
                    color: _canProceed() ? Colors.white : Colors.grey.shade500,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentStep() {
    switch (currentStep) {
      case 0:
        return _buildBasicInfoStep();
      case 1:
        return _buildStyleStep();
      case 2:
        return _buildColorStep();
      case 3:
        return _buildPurposeStep();
      default:
        return _buildBasicInfoStep();
    }
  }

  // Step 1: Basic Info
  Widget _buildBasicInfoStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Thông tin cơ bản',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'Giúp chúng tôi hiểu bạn hơn',
          style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
        ),
        const SizedBox(height: 30),
        // Gender Selection
        const Text(
          'Giới tính',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(child: _buildGenderCard('Nam', Icons.male)),
            const SizedBox(width: 12),
            Expanded(child: _buildGenderCard('Nữ', Icons.female)),
            const SizedBox(width: 12),
            Expanded(child: _buildGenderCard('Khác', Icons.more_horiz)),
          ],
        ),
        const SizedBox(height: 24),
        // Age
        _buildTextField('Độ tuổi', ageController, 'Nhập tuổi của bạn'),
        const SizedBox(height: 16),
        // Height & Weight
        Row(
          children: [
            Expanded(
              child: _buildTextField(
                'Chiều cao (cm)',
                heightController,
                'VD: 170',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildTextField(
                'Cân nặng (kg)',
                weightController,
                'VD: 65',
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Job
        _buildTextField(
          'Nghề nghiệp',
          jobController,
          'VD: Sinh viên, Nhân viên văn phòng...',
        ),
      ],
    );
  }

  // Step 2: Style Preferences
  Widget _buildStyleStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Phong cách yêu thích',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'Chọn 1 hoặc nhiều phong cách bạn thích',
          style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: styles.map((style) => _buildStyleChip(style)).toList(),
        ),
      ],
    );
  }

  // Step 3: Color Preferences
  Widget _buildColorStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Màu sắc yêu thích',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'Chọn tối đa 3 màu bạn thích mặc nhất',
          style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
        ),
        const SizedBox(height: 24),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.8,
          ),
          itemCount: colors.length,
          itemBuilder: (context, index) {
            final colorItem = colors[index];
            final isSelected = selectedColors.contains(colorItem['name']);
            return GestureDetector(
              onTap: () {
                setState(() {
                  if (isSelected) {
                    selectedColors.remove(colorItem['name']);
                  } else if (selectedColors.length < 3) {
                    selectedColors.add(colorItem['name']);
                  }
                });
              },
              child: Column(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: colorItem['color'],
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isSelected
                            ? primaryPurple
                            : Colors.grey.shade300,
                        width: isSelected ? 3 : 1,
                      ),
                    ),
                    child: isSelected
                        ? const Icon(Icons.check, color: Colors.white, size: 24)
                        : null,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    colorItem['name'],
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.normal,
                      color: isSelected ? primaryPurple : Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  // Step 4: Purpose
  Widget _buildPurposeStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Mục đích mặc',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'Bạn mua quần áo chủ yếu cho mục đích gì?',
          style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
        ),
        const SizedBox(height: 24),
        ...purposes.map((purpose) => _buildPurposeCard(purpose)).toList(),
      ],
    );
  }

  Widget _buildGenderCard(String gender, IconData icon) {
    final isSelected = selectedGender == gender;
    return GestureDetector(
      onTap: () => setState(() => selectedGender = gender),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: isSelected ? lightPurple : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? primaryPurple : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              size: 32,
              color: isSelected ? primaryPurple : Colors.grey.shade600,
            ),
            const SizedBox(height: 8),
            Text(
              gender,
              style: TextStyle(
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? primaryPurple : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller,
    String hint,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Colors.grey.shade50,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStyleChip(String style) {
    final isSelected = selectedStyles.contains(style);
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            selectedStyles.remove(style);
          } else {
            selectedStyles.add(style);
          }
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? lightPurple : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? primaryPurple : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Text(
          style,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? primaryPurple : Colors.black87,
          ),
        ),
      ),
    );
  }

  Widget _buildPurposeCard(String purpose) {
    final isSelected = selectedPurposes.contains(purpose);
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            selectedPurposes.remove(purpose);
          } else {
            selectedPurposes.add(purpose);
          }
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? lightPurple : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? primaryPurple : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: isSelected ? primaryPurple : Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? primaryPurple : Colors.grey.shade400,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? const Icon(Icons.check, color: Colors.white, size: 16)
                  : null,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                purpose,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? primaryPurple : Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _canProceed() {
    switch (currentStep) {
      case 0:
        return selectedGender != null &&
            ageController.text.isNotEmpty &&
            heightController.text.isNotEmpty &&
            weightController.text.isNotEmpty;
      case 1:
        return selectedStyles.isNotEmpty;
      case 2:
        return selectedColors.isNotEmpty;
      case 3:
        return selectedPurposes.isNotEmpty;
      default:
        return false;
    }
  }

  void _handleNext() {
    if (!_canProceed()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            currentStep == 0
                ? 'Vui lòng điền đầy đủ thông tin'
                : 'Vui lòng chọn ít nhất một lựa chọn',
          ),
          backgroundColor: Colors.red.shade400,
        ),
      );
      return;
    }

    if (currentStep < 3) {
      setState(() => currentStep++);
    } else {
      // Complete setup - save data and navigate to main
      _saveUserData();
      Navigator.pushReplacementNamed(context, '/main');
    }
  }

  void _saveUserData() {
    // Save user preferences to local storage or backend
    final userData = {
      'gender': selectedGender,
      'age': ageController.text,
      'height': heightController.text,
      'weight': weightController.text,
      'job': jobController.text,
      'styles': selectedStyles,
      'colors': selectedColors,
      'purposes': selectedPurposes,
    };

    // TODO: Implement actual data saving
    print('User Data: $userData');
  }
}
