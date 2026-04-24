import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:blinking_border/blinking_border.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenHeight = size.height;
    final screenWidth = size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: screenHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.02),

                /// Progress Bars
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _progressBar(active: true, width: screenWidth),
                    SizedBox(width: screenWidth * 0.02),
                    _progressBar(active: false, width: screenWidth),
                    SizedBox(width: screenWidth * 0.02),
                    _progressBar(active: false, width: screenWidth),
                  ],
                ),

                SizedBox(height: screenHeight * 0.15),

                /// Blinking Container
                BlinkingBorder(
                  blinkStyle: BlinkStyle.pulsing,
                  color: Colors.yellow.withOpacity(0.12),
                  pulseScale: 0.08,
                  duration: const Duration(milliseconds: 1500),
                  child: _blinkingContainer(screenWidth * 0.6),
                ),

                SizedBox(height: screenHeight * 0.05),

                /// Title
                Text(
                  "Send Money Instantly",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.07,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: screenHeight * 0.01),

                /// Subtitle
                Text(
                  "Free transfers to anyone, anywhere",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: screenWidth * 0.04,
                  ),
                ),

                SizedBox(height: screenHeight * 0.015),

                /// Dots
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _horizontalDot(active: true, size: screenWidth),
                    SizedBox(width: screenWidth * 0.02),
                    _horizontalDot(active: false, size: screenWidth),
                    SizedBox(width: screenWidth * 0.02),
                    _horizontalDot(active: false, size: screenWidth),
                  ],
                ),

                SizedBox(height: screenHeight * 0.08),

                /// Button
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.greenAccent,
                        padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.02,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            screenWidth * 0.03,
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: Shimmer.fromColors(
                        baseColor: Colors.black,
                        highlightColor: Colors.grey,
                        child: Text(
                          'Get Started',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: screenWidth * 0.05,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: screenHeight * 0.06),

                /// Login Text
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Already have an account? Log In",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: screenWidth * 0.035,
                    ),
                  ),
                ),

                SizedBox(height: screenHeight * 0.05),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Progress Bar
Widget _progressBar({required bool active, required double width}) {
  return Container(
    height: width * 0.02,
    width: active ? width * 0.15 : width * 0.08,
    decoration: BoxDecoration(
      color: active ? Colors.greenAccent : Colors.white24,
      borderRadius: BorderRadius.circular(10),
    ),
  );
}

/// Dot
Widget _horizontalDot({required bool active, required double size}) {
  return Container(
    width: size * 0.02,
    height: size * 0.02,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: active ? Colors.white : Colors.grey.withOpacity(0.3),
    ),
  );
}

/// Blinking Container
Widget _blinkingContainer(double size) {
  return Container(
    height: size,
    width: size,
    padding: EdgeInsets.all(size * 0.12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(size * 0.08),
      color: Colors.yellow.withOpacity(0.12),
      boxShadow: [
        BoxShadow(
          color: Colors.greenAccent.withOpacity(0.6),
          blurRadius: size * 0.15,
          spreadRadius: size * 0.04,
        ),
      ],
    ),
    child: Image.asset(
      "images/sheild.jpg",
      height: size * 0.4,
      width: size * 0.4,
    ),
  );
}
