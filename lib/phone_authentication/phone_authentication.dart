import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:responsive_mediaquery/responsive_mediaquery.dart';

class PhoneAuthentication extends StatefulWidget {
  const PhoneAuthentication({super.key});

  @override
  State<PhoneAuthentication> createState() => _PhoneAuthenticationState();
}

class _PhoneAuthenticationState extends State<PhoneAuthentication> {
  @override
  Widget build(BuildContext context) {
    ResponsiveMediaQuery().init(context);

    final h = ResponsiveMediaQuery.verticalLength; // 1% height
    final w = ResponsiveMediaQuery.horizontalLength; // 1% width

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0D0D),
        title: Text(
          "Cash Pay",
          style: TextStyle(color: Colors.white, fontSize: w * 5),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back, color: Colors.white, size: w * 6),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: h * 3),

                // PHONE ICON
                CircleAvatar(
                  radius: w * 15,
                  backgroundColor: Colors.grey.shade800,
                  child: Icon(
                    Icons.phone_android,
                    size: w * 15,
                    color: Colors.greenAccent,
                  ),
                ),

                SizedBox(height: h * 3),

                // TITLE
                Text(
                  'WELCOME BACK',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: w * 8,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: h * 2),

                // SUBTEXT
                Text(
                  'Enter your phone number to secure your\nSovereign account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: w * 4,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(height: h * 4),

                // LABEL
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'PHONE NUMBER',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: w * 4,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(height: h * 1.5),

                // PHONE INPUT ROW
                Row(
                  children: [
                    // SMALL FIELD
                    Container(
                      width: w * 20,
                      child: TextField(
                        style: TextStyle(fontSize: w * 4, color: Colors.white),
                        decoration: InputDecoration(
                          labelText: "+1",
                          labelStyle: TextStyle(fontSize: w * 4),
                          filled: true,
                          fillColor: Colors.grey.shade800,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(w * 3),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: w * 3),

                    // BIG FIELD
                    Expanded(
                      child: TextField(
                        style: TextStyle(fontSize: w * 4, color: Colors.white),
                        decoration: InputDecoration(
                          labelText: "Phone Number",
                          labelStyle: TextStyle(fontSize: w * 4),
                          filled: true,
                          fillColor: Colors.grey.shade800,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(w * 3),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: h * 4),

                // SEND CODE BUTTON
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                    padding: EdgeInsets.symmetric(vertical: h * 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(w * 5),
                    ),
                    minimumSize: Size(double.infinity, h * 7),
                  ),
                  onPressed: () {},
                  child: Shimmer.fromColors(
                    baseColor: Colors.black,
                    highlightColor: Colors.grey,
                    child: Text(
                      'Send Verification Code >',
                      style: TextStyle(
                        fontSize: w * 5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: h * 3),

                Text(
                  'OR',
                  style: TextStyle(color: Colors.white, fontSize: w * 5),
                ),

                SizedBox(height: h * 3),

                // GOOGLE BUTTON
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                    padding: EdgeInsets.symmetric(vertical: h * 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(w * 5),
                    ),
                    minimumSize: Size(double.infinity, h * 7),
                  ),
                  onPressed: () {},
                  child: Shimmer.fromColors(
                    baseColor: Colors.black,
                    highlightColor: Colors.grey,
                    child: Text(
                      'Continue with Google',
                      style: TextStyle(
                        fontSize: w * 5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: h * 4),

                // FOOTER TEXT
                Text(
                  "By continuing, you agree to our",
                  style: TextStyle(color: Colors.white70, fontSize: w * 3.5),
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
                          fontSize: w * 3.5,
                        ),
                      ),
                    ),

                    Text(
                      'and',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: w * 3.5,
                      ),
                    ),

                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Privacy Policy",
                        style: TextStyle(
                          color: Colors.greenAccent,
                          fontSize: w * 3.5,
                        ),
                      ),
                    ),
                  ],
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
