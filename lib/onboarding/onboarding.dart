import 'package:flutter/material.dart';

import 'package:blinking_border/blinking_border.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _progressBar(active: true),
                const SizedBox(width: 8),
                _progressBar(active: false),
                const SizedBox(width: 8),
                _progressBar(active: false),
              ],
            ),

            const SizedBox(height: 120),

            BlinkingBorder(
              blinkStyle: BlinkStyle.pulsing,
              color: Colors.yellow.withOpacity(0.12),
              pulseScale: 0.08, // 8% scale change
              duration: Duration(milliseconds: 1500),
              child: _blinkingcontainer(),
            ),

            const SizedBox(height: 40),

            const Text(
              "Send Money Instantly",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 10),

            Text(
              "Free transfers to anyone, anywhere",
              style: TextStyle(color: Colors.white70, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _horizontalDot(active: true), // ● Active
                SizedBox(width: 8),
                _horizontalDot(active: false), // ○ Inactive
                SizedBox(width: 8),
                _horizontalDot(active: false), // ○ Inactive
              ],
            ),

            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Get Started",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 50),

            GestureDetector(
              onTap: () {},
              child: Text(
                "Already have an account? Log In",
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

Widget _progressBar({required bool active}) {
  return Container(
    height: 10,
    width: active ? 60 : 30,
    decoration: BoxDecoration(
      color: active ? Colors.greenAccent : Colors.white24,
      borderRadius: BorderRadius.circular(10),
    ),
  );
}

Widget _horizontalDot({required bool active}) {
  return Container(
    width: 8,
    height: 8,
    decoration: BoxDecoration(
      shape: BoxShape.circle, // Makes it a circle (dot)
      color: active ? Colors.white : Colors.grey.withOpacity(0.3),
    ),
  );
}

Widget _blinkingcontainer() {
  return Container(
    height: 300,
    width: 300,

    padding: const EdgeInsets.all(35),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.yellow.withOpacity(0.12),
      boxShadow: [
        BoxShadow(
          color: Colors.greenAccent.withOpacity(0.6),
          blurRadius: 40,
          spreadRadius: 8,
        ),
      ],
    ),
    child: Image.asset(
      "images/sheild.jpg", // <-- your shield image
      height: 90,
      width: 90,
    ),
  );
}
