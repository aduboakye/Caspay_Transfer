import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PhoneAuthentication extends StatelessWidget {
  const PhoneAuthentication({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;

            if (width < 600) {
              return _mobileLayout(context, constraints);
            } else {
              return _tabletDesktopLayout(context, constraints);
            }
          },
        ),
      ),
    );
  }
}

////////////////////////////////////////////////////////////
/// 📱 MOBILE
////////////////////////////////////////////////////////////
Widget _mobileLayout(BuildContext context, BoxConstraints constraints) {
  final w = constraints.maxWidth;
  final h = constraints.maxHeight;

  return Scaffold(
    backgroundColor: const Color(0xFF0D0D0D),
    appBar: _appBar(w),
    body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * 0.05),
        child: Column(
          children: [
            SizedBox(height: h * 0.03),

            _icon(w),

            SizedBox(height: h * 0.03),

            _title(w),
            SizedBox(height: h * 0.02),
            _subtitle(w),

            SizedBox(height: h * 0.04),

            _phoneInput(w),

            SizedBox(height: h * 0.04),

            _button(w, h, "Send Verification Code >"),

            SizedBox(height: h * 0.03),

            Text(
              "OR",
              style: TextStyle(
                color: Colors.white,
                fontSize: (w * 0.05).clamp(16, 20),
              ),
            ),

            SizedBox(height: h * 0.03),

            _button(w, h, "Continue with Google"),

            SizedBox(height: h * 0.04),

            _footer(w),

            SizedBox(height: h * 0.05),
          ],
        ),
      ),
    ),
  );
}

////////////////////////////////////////////////////////////
/// 💻 TABLET + DESKTOP
////////////////////////////////////////////////////////////
Widget _tabletDesktopLayout(BuildContext context, BoxConstraints constraints) {
  final w = constraints.maxWidth;

  bool isDesktop = w > 1000;

  return Scaffold(
    backgroundColor: const Color(0xFF0D0D0D),
    appBar: _appBar(w),
    body: Padding(
      padding: const EdgeInsets.all(40),
      child: isDesktop
          ? Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1000),
                child: Row(
                  children: [
                    /// LEFT SIDE
                    Expanded(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _icon(w),
                            const SizedBox(height: 20),
                            _title(w),
                            const SizedBox(height: 10),
                            _subtitle(w),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(width: 20),

                    /// RIGHT SIDE
                    Expanded(
                      child: Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 500),
                          child: _formSection(w),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 500),
                child: _formSection(w),
              ),
            ),
    ),
  );
}

////////////////////////////////////////////////////////////
/// 🔧 FORM SECTION
////////////////////////////////////////////////////////////
Widget _formSection(double w) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      _phoneInput(w),

      const SizedBox(height: 30),

      _button(w, 60, "Send Verification Code >"),

      const SizedBox(height: 20),

      const Text("OR", style: TextStyle(color: Colors.white)),

      const SizedBox(height: 20),

      _button(w, 60, "Continue with Google"),

      const SizedBox(height: 30),

      _footer(w),
    ],
  );
}

////////////////////////////////////////////////////////////
/// 🔧 COMPONENTS
////////////////////////////////////////////////////////////

PreferredSizeWidget _appBar(double w) {
  return AppBar(
    backgroundColor: const Color(0xFF0D0D0D),
    centerTitle: true,
    title: Text(
      "Cash Pay",
      style: TextStyle(color: Colors.white, fontSize: (w * 0.05).clamp(18, 24)),
    ),
    leading: IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.arrow_back,
        color: Colors.white,
        size: (w * 0.06).clamp(20, 28),
      ),
    ),
  );
}

Widget _icon(double w) {
  return CircleAvatar(
    radius: (w * 0.15).clamp(40, 70),
    backgroundColor: Colors.grey.shade800,
    child: Icon(
      Icons.phone_android,
      size: (w * 0.15).clamp(40, 70),
      color: Colors.greenAccent,
    ),
  );
}

Widget _title(double w) {
  return Text(
    'WELCOME BACK',
    textAlign: TextAlign.center,
    style: TextStyle(
      color: Colors.white,
      fontSize: (w * 0.08).clamp(22, 34),
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget _subtitle(double w) {
  return Text(
    'Enter your phone number to secure your\nSovereign account',
    textAlign: TextAlign.center,
    style: TextStyle(color: Colors.white70, fontSize: (w * 0.04).clamp(14, 18)),
  );
}

Widget _phoneInput(double w) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'PHONE NUMBER',
        style: TextStyle(
          color: Colors.white,
          fontSize: (w * 0.04).clamp(14, 18),
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 10),
      Row(
        children: [
          SizedBox(
            width: (w * 0.2).clamp(80, 120),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: "+1",
                filled: true,
                fillColor: Colors.grey.shade800,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: "Phone Number",
                filled: true,
                fillColor: Colors.grey.shade800,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

Widget _button(double w, double h, String text) {
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
          text,
          style: TextStyle(
            fontSize: (w * 0.045).clamp(16, 22),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}

Widget _footer(double w) {
  return Column(
    children: [
      Text(
        "By continuing, you agree to our",
        style: TextStyle(
          color: Colors.white70,
          fontSize: (w * 0.035).clamp(12, 16),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {},
            child: Text(
              "Terms of Service",
              style: TextStyle(
                color: Colors.greenAccent,
                fontSize: (w * 0.035).clamp(12, 16),
              ),
            ),
          ),
          const Text("and", style: TextStyle(color: Colors.white70)),
          TextButton(
            onPressed: () {},
            child: Text(
              "Privacy Policy",
              style: TextStyle(
                color: Colors.greenAccent,
                fontSize: (w * 0.035).clamp(12, 16),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
