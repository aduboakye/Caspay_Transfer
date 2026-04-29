import 'package:flutter/material.dart';
import 'package:responsive_mediaquery/responsive_mediaquery.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isNotificationOn = false;

  @override
  Widget build(BuildContext context) {
    ResponsiveMediaQuery().init(context);
    final h = ResponsiveMediaQuery.verticalLength;
    final w = ResponsiveMediaQuery.horizontalLength;

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0D0D),
        centerTitle: true,
        leadingWidth: w * 15,
        leading: Padding(
          padding: EdgeInsets.only(left: w * 2),
          child: CircleAvatar(
            backgroundColor: Colors.grey.shade800,
            radius: w * 3,
            child: Icon(Icons.person, color: Colors.white, size: w * 5),
          ),
        ),
        title: Text(
          "Cash Pay",
          style: TextStyle(color: Colors.white, fontSize: w * 5),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: w * 2),
            child: Icon(Icons.notifications, color: Colors.white, size: w * 5),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF0D0D0D),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
          BottomNavigationBarItem(icon: Icon(Icons.send), label: "Send"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: w * 5),
          child: Column(
            children: [
              SizedBox(height: h * 3),

              CircleAvatar(
                radius: w * 15,
                backgroundColor: Colors.grey.shade800,
                child: Icon(
                  Icons.person,
                  size: w * 15,
                  color: Colors.greenAccent,
                ),
              ),

              SizedBox(height: h * 2),

              Text(
                "Adu Boakye",
                style: TextStyle(color: Colors.white, fontSize: w * 7),
              ),

              Text(
                "Joined 14 April 2023",
                style: TextStyle(color: Colors.white70, fontSize: w * 3.5),
              ),

              SizedBox(height: h * 3),

              subscriptionCard(w, h),
              SizedBox(height: h * 3),

              accountManagementCard(w, h),
              SizedBox(height: h * 3),

              settingsCard(w, h),
            ],
          ),
        ),
      ),
    );
  }

  // -------------------------
  // SUBSCRIPTION CARD
  // -------------------------
  Widget subscriptionCard(double w, double h) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(w * 4),
      decoration: BoxDecoration(
        color: Colors.yellow.withOpacity(0.12),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.payment, color: Colors.yellow, size: w * 8),
              SizedBox(width: w * 3),
              Expanded(
                child: Text(
                  "SUBSCRIPTION PLAN\nMONTHLY FEE: 5",
                  style: TextStyle(color: Colors.white, fontSize: w * 3.5),
                ),
              ),
              CircleAvatar(
                radius: w * 6,
                backgroundColor: Colors.yellow.withOpacity(0.12),
                child: Icon(
                  Icons.attach_money,
                  color: Colors.yellow,
                  size: w * 5,
                ),
              ),
            ],
          ),

          SizedBox(height: h * 1),

          Text(
            "Next Bill: 14 April 2023",
            style: TextStyle(color: Colors.white, fontSize: w * 3.5),
          ),

          SizedBox(height: h * 2),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                padding: EdgeInsets.symmetric(vertical: h * 1.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {},
              child: Text(
                "Manage Subscription",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: w * 4,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // -------------------------
  // ACCOUNT MANAGEMENT CARD
  // -------------------------
  Widget accountManagementCard(double w, double h) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Account Management",
          style: TextStyle(color: Colors.white, fontSize: w * 4.5),
        ),

        SizedBox(height: h * 1.5),

        buildSettingTile(Icons.person, "Personal Details", w),
        buildSettingTile(Icons.security, "Security", w),
        buildSettingTile(Icons.payment, "Payment Methods", w),
      ],
    );
  }

  // -------------------------
  // SETTINGS CARD
  // -------------------------
  Widget settingsCard(double w, double h) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Settings",
          style: TextStyle(color: Colors.white, fontSize: w * 4.5),
        ),

        SizedBox(height: h * 1.5),

        Container(
          decoration: BoxDecoration(
            color: Colors.yellow.withOpacity(0.12),
            borderRadius: BorderRadius.circular(16),
          ),
          padding: EdgeInsets.all(w * 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.notifications, color: Colors.white),
                  SizedBox(width: w * 3),
                  Text(
                    "Notifications",
                    style: TextStyle(color: Colors.white, fontSize: w * 4),
                  ),
                ],
              ),
              Switch(
                value: isNotificationOn,
                activeColor: Colors.yellow,
                onChanged: (value) {
                  setState(() => isNotificationOn = value);
                },
              ),
            ],
          ),
        ),

        SizedBox(height: h * 1.5),

        buildSettingTile(Icons.logout, "Logout", w),
      ],
    );
  }

  // -------------------------
  // REUSABLE TILE
  // -------------------------
  Widget buildSettingTile(IconData icon, String title, double w) {
    return Container(
      margin: EdgeInsets.only(bottom: w * 3),
      padding: EdgeInsets.all(w * 4),
      decoration: BoxDecoration(
        color: Colors.yellow.withOpacity(0.12),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white),
          SizedBox(width: w * 3),
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: w * 4),
          ),
        ],
      ),
    );
  }
}
