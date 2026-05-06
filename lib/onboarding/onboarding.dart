import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:blinking_border/blinking_border.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;

            // 🔥 Breakpoint
            if (width < 600) {
              return _mobileLayout(constraints);
            } else {
              return _tabletLayout(constraints);
            }
          },
        ),
      ),
    );
  }
}

////////////////////////////////////////////////////////////
/// 📱 MOBILE LAYOUT
////////////////////////////////////////////////////////////
Widget _mobileLayout(BoxConstraints constraints) {
  final w = constraints.maxWidth;
  final h = constraints.maxHeight;

  return SingleChildScrollView(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: w * 0.05),
      child: Column(
        children: [
          SizedBox(height: h * 0.03),

          /// Progress Bars
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _progressBar(true, w),
              SizedBox(width: w * 0.02),
              _progressBar(false, w),
              SizedBox(width: w * 0.02),
              _progressBar(false, w),
            ],
          ),

          SizedBox(height: h * 0.08),

          /// Blinking Container
          BlinkingBorder(
            blinkStyle: BlinkStyle.pulsing,
            color: Colors.yellow.withOpacity(0.12),
            pulseScale: 0.08,
            duration: const Duration(milliseconds: 1500),
            child: _blinkingContainer((w * 0.6).clamp(180, 260)),
          ),

          SizedBox(height: h * 0.05),

          /// Title
          Text(
            "Send Money Instantly",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: (w * 0.07).clamp(20, 32),
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: h * 0.01),

          /// Subtitle
          Text(
            "Free transfers to anyone, anywhere",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white70,
              fontSize: (w * 0.04).clamp(14, 18),
            ),
          ),

          SizedBox(height: h * 0.03),

          /// Dots
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _horizontalDot(true, w),
              SizedBox(width: w * 0.02),
              _horizontalDot(false, w),
              SizedBox(width: w * 0.02),
              _horizontalDot(false, w),
            ],
          ),

          SizedBox(height: h * 0.08),

          /// Button
          _button(w, h),

          SizedBox(height: h * 0.05),

          /// Login
          Text(
            "Already have an account? Log In",
            style: TextStyle(
              color: Colors.white70,
              fontSize: (w * 0.035).clamp(12, 16),
            ),
          ),

          SizedBox(height: h * 0.05),
        ],
      ),
    ),
  );
}

////////////////////////////////////////////////////////////
/// 💻 TABLET / DESKTOP LAYOUT
////////////////////////////////////////////////////////////
Widget _tabletLayout(BoxConstraints constraints) {
  final w = constraints.maxWidth;

  return Padding(
    padding: const EdgeInsets.all(40),
    child: Row(
      children: [
        /// LEFT SIDE (ICON)
        Expanded(
          child: Center(
            child: BlinkingBorder(
              blinkStyle: BlinkStyle.pulsing,
              color: Colors.yellow.withOpacity(0.12),
              pulseScale: 0.08,
              duration: const Duration(milliseconds: 1500),
              child: _blinkingContainer(280),
            ),
          ),
        ),

        /// RIGHT SIDE (TEXT)
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Send Money Instantly",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: (w * 0.035).clamp(28, 42),
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              Text(
                "Free transfers to anyone, anywhere",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: (w * 0.02).clamp(16, 22),
                ),
              ),

              const SizedBox(height: 40),

              SizedBox(width: 250, child: _button(w, 60)),
            ],
          ),
        ),
      ],
    ),
  );
}

////////////////////////////////////////////////////////////
/// 🔧 REUSABLE COMPONENTS
////////////////////////////////////////////////////////////

Widget _progressBar(bool active, double w) {
  return Container(
    height: 6,
    width: active ? w * 0.15 : w * 0.08,
    decoration: BoxDecoration(
      color: active ? Colors.greenAccent : Colors.white24,
      borderRadius: BorderRadius.circular(10),
    ),
  );
}

Widget _horizontalDot(bool active, double w) {
  return Container(
    width: w * 0.02,
    height: w * 0.02,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: active ? Colors.white : Colors.grey.withOpacity(0.3),
    ),
  );
}

Widget _button(double w, double h) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.greenAccent,
        padding: EdgeInsets.symmetric(vertical: h * 0.02),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: () {},
      child: Shimmer.fromColors(
        baseColor: Colors.black,
        highlightColor: Colors.grey,
        child: Text(
          'Get Started',
          style: TextStyle(
            fontSize: (w * 0.045).clamp(16, 22),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}

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
    child: Image.asset("images/sheild.jpg", fit: BoxFit.contain),
  );
}
