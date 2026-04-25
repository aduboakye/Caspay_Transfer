import 'package:flutter/material.dart';
import 'package:responsive_mediaquery/responsive_mediaquery.dart';
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
    ResponsiveMediaQuery().init(context);

    final h = ResponsiveMediaQuery.verticalLength; // 1% of height
    final w = ResponsiveMediaQuery.horizontalLength; // 1% of width

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 5),
            child: Column(
              children: [
                SizedBox(height: h * 2),

                /// Progress Bars
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _progressBar(active: true, width: w),
                    SizedBox(width: w * 2),
                    _progressBar(active: false, width: w),
                    SizedBox(width: w * 2),
                    _progressBar(active: false, width: w),
                  ],
                ),

                SizedBox(height: h * 12),

                /// Blinking Container
                BlinkingBorder(
                  blinkStyle: BlinkStyle.pulsing,
                  color: Colors.yellow.withOpacity(0.12),
                  pulseScale: 0.08,
                  duration: const Duration(milliseconds: 1500),
                  child: _blinkingContainer(w * 60),
                ),

                SizedBox(height: h * 5),

                /// Title
                Text(
                  "Send Money Instantly",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: w * 7,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: h * 1),

                /// Subtitle
                Text(
                  "Free transfers to anyone, anywhere",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white70, fontSize: w * 4),
                ),

                SizedBox(height: h * 2),

                /// Dots
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _horizontalDot(active: true, size: w),
                    SizedBox(width: w * 2),
                    _horizontalDot(active: false, size: w),
                    SizedBox(width: w * 2),
                    _horizontalDot(active: false, size: w),
                  ],
                ),

                SizedBox(height: h * 8),

                /// Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent,
                      padding: EdgeInsets.symmetric(vertical: h * 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(w * 3),
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
                          fontSize: w * 5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: h * 6),

                /// Login Text
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Already have an account? Log In",
                    style: TextStyle(color: Colors.white70, fontSize: w * 3.5),
                  ),
                ),

                SizedBox(height: h * 5),
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
    height: width * 2,
    width: active ? width * 15 : width * 8,
    decoration: BoxDecoration(
      color: active ? Colors.greenAccent : Colors.white24,
      borderRadius: BorderRadius.circular(10),
    ),
  );
}

/// Dot
Widget _horizontalDot({required bool active, required double size}) {
  return Container(
    width: size * 2,
    height: size * 2,
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
