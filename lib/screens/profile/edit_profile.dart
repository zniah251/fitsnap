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

  // --- EXISTING DATA ---
  final TextEditingController nameController = TextEditingController(
    text: 'Bao Chau', // Kept as it is a proper name
  );
  final TextEditingController ageController = TextEditingController(text: '25');
  final TextEditingController heightController = TextEditingController(
    text: '165',
  );
  final TextEditingController weightController = TextEditingController(
    text: '55',
  );
  final TextEditingController jobController = TextEditingController(
    text: 'Office Worker', // Translated
  );
  String selectedGender = 'Female'; // Translated

  // --- NEWLY ADDED DATA ---
  // (Simulating user's selected data)
  List<String> selectedStyles = ['Casual', 'Minimalist']; // Already English
  List<String> selectedColors = ['Black', 'White', 'Beige']; // Translated
  List<String> selectedPurposes = [
    'Work / Office', // Translated
    'Daily / Casual Outing', // Translated
  ];

  // List of options
  final List<String> styles = [
    'Casual',
    'Formal',
    'Sporty',
    'Streetwear',
    'Vintage/Retro',
    'Minimalist',
  ];

  final List<Map<String, dynamic>> colors = [
    {'name': 'Black', 'color': Colors.black}, // Translated
    {'name': 'White', 'color': Colors.white}, // Translated
    {'name': 'Blue', 'color': Colors.blue}, // Translated
    {'name': 'Brown', 'color': Colors.brown}, // Translated
    {'name': 'Pastel', 'color': Color(0xFFFFB6C1)}, // Translated
    {'name': 'Grey', 'color': Colors.grey}, // Translated
    {'name': 'Beige', 'color': Color(0xFFF5F5DC)}, // Translated
    {'name': 'Green', 'color': Colors.green}, // Translated
  ];

  final List<String> purposes = [
    'Work / Office', // Translated
    'Daily / Casual Outing', // Translated
    'Sports / Gym', // Translated
    'Party / Special Event', // Translated
  ];
  // --- END OF NEW ADDITIONS ---

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
          'Edit Profile', // Translated
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
                              content: Text(
                                'Change profile picture',
                              ), // Translated
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
                'Full Name', // Translated
                nameController,
                'Enter your full name', // Translated
                Icons.person_outline,
              ),
              const SizedBox(height: 16),

              // Gender
              const Text(
                'Gender', // Translated
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: _buildGenderCard('Male', Icons.male),
                  ), // Translated
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildGenderCard('Female', Icons.female),
                  ), // Translated
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildGenderCard('Other', Icons.more_horiz),
                  ), // Translated
                ],
              ),
              const SizedBox(height: 16),

              // Age
              _buildTextField(
                'Age', // Translated
                ageController,
                'Enter your age', // Translated
                Icons.cake,
                isNumber: true,
              ),
              const SizedBox(height: 16),

              // Height & Weight
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      'Height (cm)', // Translated
                      heightController,
                      'e.g., 165', // Translated
                      Icons.height,
                      isNumber: true,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildTextField(
                      'Weight (kg)', // Translated
                      weightController,
                      'e.g., 55', // Translated
                      Icons.monitor_weight,
                      isNumber: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Job
              _buildTextField(
                'Occupation', // Translated
                jobController,
                'e.g., Student', // Translated
                Icons.work,
              ),
              const SizedBox(height: 24),

              // --- NEW SECTION: STYLES ---
              const Text(
                'Favorite Styles', // Translated
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

              // --- NEW SECTION: COLORS ---
              const Text(
                'Favorite Colors (select up to 3)', // Translated
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
              _buildColorGrid(), // New function to build color grid
              const SizedBox(height: 24),

              // --- NEW SECTION: PURPOSES ---
              const Text(
                'Wearing Purposes', // Translated
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
              ...purposes.map((purpose) => _buildPurposeCard(purpose)).toList(),
              const SizedBox(height: 32),
              // --- END OF NEW ADDITIONS ---

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
                    'Save Changes', // Translated
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
              return 'This field is required'; // Translated
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

  // --- NEW FUNCTION: BUILD COLOR GRID ---
  Widget _buildColorGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5, // Display 5 columns
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
                // Keep the 3-color limit logic
                selectedColors.add(colorItem['name']);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'You can only select up to 3 colors',
                    ), // Translated
                    backgroundColor: Colors.redAccent,
                  ),
                );
              }
            });
          },
          child: Column(
            children: [
              Container(
                width: 50, // Slightly smaller size
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
                  fontSize: 11, // Smaller font
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

  // --- NEW FUNCTION: BUILD STYLE CHIP ---
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

  // --- NEW FUNCTION: BUILD PURPOSE CARD ---
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
    // Add validation for TextFormField fields
    if (_formKey.currentState!.validate()) {
      final updatedData = {
        'name': nameController.text,
        'gender': selectedGender,
        'age': ageController.text,
        'height': heightController.text,
        'weight': weightController.text,
        'job': jobController.text,
        // --- UPDATE SAVED DATA ---
        'styles': selectedStyles,
        'colors': selectedColors,
        'purposes': selectedPurposes,
      };

      // TODO: Save to backend/database
      print('Updated Profile: $updatedData');

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Changes saved!'), // Translated
          backgroundColor: accentPurple,
        ),
      );

      Navigator.pop(context, true); // Return true so the Profile screen knows
    }
  }
}
