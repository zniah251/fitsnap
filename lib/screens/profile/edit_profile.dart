import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  static const Color primaryPurple = Color(0xFF7559D9);
  static const Color lightPurple = Color(0xFFEDE4FF);
  static const Color accentPurple = Color(0xFF5F33E1);

  final _formKey = GlobalKey<FormState>();

  // --- DỮ LIỆU CÓ SẴN ---
  final TextEditingController nameController = TextEditingController(
    text: 'Bao Chau',
  );
  final TextEditingController ageController = TextEditingController(text: '25');
  final TextEditingController heightController = TextEditingController(
    text: '165',
  );
  final TextEditingController weightController = TextEditingController(
    text: '55',
  );
  final TextEditingController jobController = TextEditingController(
    text: 'Nhân viên văn phòng',
  );
  String selectedGender = 'Nữ';

  // --- DỮ LIỆU MỚI ĐƯỢC THÊM ---
  // (Giả lập dữ liệu đã chọn của người dùng)
  List<String> selectedStyles = ['Casual', 'Minimalist'];
  List<String> selectedColors = ['Đen', 'Trắng', 'Be'];
  List<String> selectedPurposes = [
    'Đi làm / công sở',
    'Đi học / đi chơi hàng ngày',
  ];

  // Danh sách các lựa chọn (sao chép từ ProfileSetupScreen)
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
  // --- KẾT THÚC PHẦN THÊM MỚI ---

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    heightController.dispose();
    weightController.dispose();
    jobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Chỉnh sửa hồ sơ',
          style: TextStyle(color: primaryPurple, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Picture
              Center(
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: lightPurple,
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.person,
                          size: 50,
                          color: primaryPurple,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Đổi ảnh đại diện'),
                              backgroundColor: accentPurple,
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: accentPurple,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: const Icon(
                            Icons.camera_alt,
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Name
              _buildTextField(
                'Họ và tên',
                nameController,
                'Nhập họ và tên',
                Icons.person_outline,
              ),
              const SizedBox(height: 16),

              // Gender
              const Text(
                'Giới tính',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(child: _buildGenderCard('Nam', Icons.male)),
                  const SizedBox(width: 12),
                  Expanded(child: _buildGenderCard('Nữ', Icons.female)),
                  const SizedBox(width: 12),
                  Expanded(child: _buildGenderCard('Khác', Icons.more_horiz)),
                ],
              ),
              const SizedBox(height: 16),

              // Age
              _buildTextField(
                'Tuổi',
                ageController,
                'Nhập tuổi',
                Icons.cake,
                isNumber: true,
              ),
              const SizedBox(height: 16),

              // Height & Weight
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      'Chiều cao (cm)',
                      heightController,
                      'VD: 165',
                      Icons.height,
                      isNumber: true,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildTextField(
                      'Cân nặng (kg)',
                      weightController,
                      'VD: 55',
                      Icons.monitor_weight,
                      isNumber: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Job
              _buildTextField(
                'Nghề nghiệp',
                jobController,
                'VD: Sinh viên',
                Icons.work,
              ),
              const SizedBox(height: 24),

              // --- PHẦN MỚI THÊM: PHONG CÁCH ---
              const Text(
                'Phong cách yêu thích',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: styles
                    .map((style) => _buildStyleChip(style))
                    .toList(),
              ),
              const SizedBox(height: 24),

              // --- PHẦN MỚI THÊM: MÀU SẮC ---
              const Text(
                'Màu sắc yêu thích (chọn tối đa 3)',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
              _buildColorGrid(), // Hàm mới để build lưới màu
              const SizedBox(height: 24),

              // --- PHẦN MỚI THÊM: MỤC ĐÍCH ---
              const Text(
                'Mục đích mặc',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
              ...purposes.map((purpose) => _buildPurposeCard(purpose)).toList(),
              const SizedBox(height: 32),
              // --- KẾT THÚC PHẦN THÊM MỚI ---

              // Save Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _saveProfile,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: accentPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    'Lưu thay đổi',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller,
    String hint,
    IconData icon, {
    bool isNumber = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: isNumber ? TextInputType.number : TextInputType.text,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey.shade400),
            prefixIcon: Icon(icon, color: Colors.grey.shade600),
            filled: true,
            fillColor: Colors.grey.shade50,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade200),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: primaryPurple, width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Vui lòng không để trống trường này';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildGenderCard(String gender, IconData icon) {
    final isSelected = selectedGender == gender;
    return GestureDetector(
      onTap: () => setState(() => selectedGender = gender),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: isSelected ? lightPurple : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? primaryPurple : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              size: 28,
              color: isSelected ? primaryPurple : Colors.grey.shade600,
            ),
            const SizedBox(height: 6),
            Text(
              gender,
              style: TextStyle(
                fontSize: 13,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? primaryPurple : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- HÀM MỚI THÊM: BUILD LƯỚI MÀU ---
  Widget _buildColorGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5, // Hiển thị 5 cột cho gọn
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
                // Vẫn giữ logic giới hạn 3 màu
                selectedColors.add(colorItem['name']);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Chỉ được chọn tối đa 3 màu'),
                    backgroundColor: Colors.redAccent,
                  ),
                );
              }
            });
          },
          child: Column(
            children: [
              Container(
                width: 50, // Giảm kích thước 1 chút
                height: 50,
                decoration: BoxDecoration(
                  color: colorItem['color'],
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected ? primaryPurple : Colors.grey.shade300,
                    width: isSelected ? 3 : 1,
                  ),
                ),
                child: isSelected
                    ? const Icon(Icons.check, color: Colors.white, size: 20)
                    : null,
              ),
              const SizedBox(height: 6),
              Text(
                colorItem['name'],
                style: TextStyle(
                  fontSize: 11, // Chữ nhỏ hơn
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? primaryPurple : Colors.black87,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );
      },
    );
  }

  // --- HÀM MỚI THÊM: BUILD STYLE CHIP ---
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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
            fontSize: 13,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? primaryPurple : Colors.black87,
          ),
        ),
      ),
    );
  }

  // --- HÀM MỚI THÊM: BUILD PURPOSE CARD ---
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
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? lightPurple : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? primaryPurple : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                color: isSelected ? primaryPurple : Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? primaryPurple : Colors.grey.shade400,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? const Icon(Icons.check, color: Colors.white, size: 14)
                  : null,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                purpose,
                style: TextStyle(
                  fontSize: 14,
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

  void _saveProfile() {
    // Thêm validation cho các trường TextFormField
    if (_formKey.currentState!.validate()) {
      final updatedData = {
        'name': nameController.text,
        'gender': selectedGender,
        'age': ageController.text,
        'height': heightController.text,
        'weight': weightController.text,
        'job': jobController.text,
        // --- CẬP NHẬT DỮ LIỆU LƯU ---
        'styles': selectedStyles,
        'colors': selectedColors,
        'purposes': selectedPurposes,
      };

      // TODO: Save to backend/database
      print('Updated Profile: $updatedData');

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Đã lưu thay đổi!'),
          backgroundColor: accentPurple,
        ),
      );

      Navigator.pop(context, true); // Trả về true để màn hình Profile biết
    }
  }
}
