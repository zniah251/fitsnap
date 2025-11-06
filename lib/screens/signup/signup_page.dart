import 'package:flutter/material.dart';

class SignUpPageScreen extends StatefulWidget {
  const SignUpPageScreen({Key? key}) : super(key: key);

  @override
  State<SignUpPageScreen> createState() => SignUpPageScreenState();
}

class SignUpPageScreenState extends State<SignUpPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Header - FITSNAP text
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Image.asset(
                'image/load/appname.png',
                height: 60,
                width: 200,
                fit: BoxFit.contain,
              ),
            ),
            // Logo section
            Column(
              children: [
                // Logo image - thay đổi đường dẫn tại đây
                Image.asset(
                  'image/load/logo_Fitsnap.png', // Thay đổi đường dẫn logo tại đây
                  height: 150,
                  width: 150,
                  fit: BoxFit.contain,
                ),
              ],
            ),

            // Bottom section with buttons
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Column(
                children: [
                  // Page indicator dots
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF7C3AED),
                        ),
                      ),
                      SizedBox(width: 8),
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFE9D5FF), // Light purple
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),

                  // Sign Up button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () {
                          // TODO: Navigate to Sign Up screen
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF7C3AED), // Dark purple
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12),

                  // Sign In button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/main');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFD8B4FE), // Light purple
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF5B21B6), // Dark purple text
                          ),
                        ),
                      ),
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
