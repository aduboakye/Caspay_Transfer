import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isNotificationOn = false;
  int selectedIndex = 3; // default = Profile

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 900;
    final isTablet = screenWidth > 600 && screenWidth <= 900;

    // Adjust content max width based on screen size
    double contentMaxWidth = isDesktop ? 800 : (isTablet ? 600 : 500);

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),

      // ---------------- APPBAR ----------------
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0D0D),
        centerTitle: true,
        title: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                Text(
                  "Cash Pay",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(Icons.notifications, color: Colors.white),
              ],
            ),
          ),
        ),
      ),

      // ---------------- BODY ----------------
      body: SafeArea(
        child: isDesktop
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // -------- SIDEBAR (DESKTOP) --------
                  Container(
                    width: 260,
                    color: const Color(0xFF0D0D0D),
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: buildNavItem(Icons.home, "Home", 0),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: buildNavItem(Icons.history, "History", 1),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: buildNavItem(Icons.send, "Send", 2),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: buildNavItem(Icons.person, "Profile", 3),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.yellow.withOpacity(0.12),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.info,
                                  color: Colors.yellow,
                                  size: 20,
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    "v1.0.0",
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // -------- MAIN CONTENT --------
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          left: BorderSide(
                            color: Colors.yellow.withOpacity(0.2),
                            width: 0.5,
                          ),
                        ),
                      ),
                      child: Center(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: contentMaxWidth,
                            minWidth: isDesktop ? 400 : 300,
                          ),
                          child: buildContent(),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : buildContent(),
      ),

      // ---------------- MOBILE/TABLET NAV ----------------
      bottomNavigationBar: isDesktop
          ? null
          : BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index) {
                setState(() => selectedIndex = index);
              },
              backgroundColor: const Color(0xFF0D0D0D),
              selectedItemColor: Colors.yellow,
              unselectedItemColor: Colors.white54,
              type: BottomNavigationBarType.fixed,
              elevation: 8,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                  icon: Icon(Icons.history),
                  label: "History",
                ),
                BottomNavigationBarItem(icon: Icon(Icons.send), label: "Send"),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "Profile",
                ),
              ],
            ),
    );
  }

  // ---------------- CONTENT ----------------
  Widget buildContent() {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final padding = isMobile
        ? const EdgeInsets.all(16)
        : const EdgeInsets.all(24);

    return SingleChildScrollView(
      padding: padding,
      child: Column(
        children: [
          const SizedBox(height: 20),

          // Profile header with better spacing
          Center(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.yellow, width: 2),
                  ),
                  child: const CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person, size: 55, color: Colors.yellow),
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Adu Boakye",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.yellow.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "Member since April 2023",
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // Cards grid for tablet/desktop
          if (MediaQuery.of(context).size.width > 700)
            LayoutBuilder(
              builder: (context, constraints) {
                final isThreeRow = constraints.maxWidth > 600;
                return isThreeRow
                    ? Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 1400),
                          child: Row(
                            children: [
                              Expanded(child: subscriptionCard()),
                              const SizedBox(width: 20),
                              Expanded(child: settingsCard()),
                              const SizedBox(width: 20),
                              Expanded(child: accountManagementCard()),
                            ],
                          ),
                        ),
                      )
                    : Column(
                        children: [
                          subscriptionCard(),
                          const SizedBox(height: 20),
                          accountManagementCard(),
                          const SizedBox(height: 20),
                          settingsCard(),
                        ],
                      );
              },
            )
          else
            Column(
              children: [
                subscriptionCard(),
                const SizedBox(height: 20),
                accountManagementCard(),
                const SizedBox(height: 20),
                settingsCard(),
              ],
            ),
        ],
      ),
    );
  }

  // ---------------- SIDEBAR ITEM ----------------
  Widget buildNavItem(IconData icon, String title, int index) {
    final isSelected = selectedIndex == index;

    return Container(
      decoration: BoxDecoration(
        color: isSelected
            ? Colors.yellow.withOpacity(0.12)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: isSelected ? Colors.yellow : Colors.white),
        title: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.yellow : Colors.white,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        onTap: () {
          setState(() => selectedIndex = index);
        },
      ),
    );
  }

  // ---------------- SUBSCRIPTION ----------------
  Widget subscriptionCard() {
    return Card(
      elevation: 4,
      color: const Color(0xFF1A1A1A),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.yellow.withOpacity(0.2)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.yellow.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.payment,
                    color: Colors.yellow,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Premium Plan",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "MONTHLY FEE: \$5",
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.yellow.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.attach_money,
                    color: Colors.yellow,
                    size: 24,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            const Divider(color: Colors.white24),
            const SizedBox(height: 10),
            Row(
              children: const [
                Icon(Icons.calendar_today, color: Colors.yellow, size: 16),
                SizedBox(width: 8),
                Text(
                  "Next Bill: 14 April 2023",
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Manage Subscription",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------- ACCOUNT ----------------
  Widget accountManagementCard() {
    return Card(
      elevation: 4,
      color: const Color(0xFF1A1A1A),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.yellow.withOpacity(0.2)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Account Management",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Divider(color: Colors.white24),
            const SizedBox(height: 10),
            buildTile(Icons.person, "Personal Details"),
            buildTile(Icons.security, "Security"),
            buildTile(Icons.payment, "Payment Methods"),
          ],
        ),
      ),
    );
  }

  // ---------------- SETTINGS ----------------
  Widget settingsCard() {
    return Card(
      elevation: 4,
      color: const Color(0xFF1A1A1A),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.yellow.withOpacity(0.2)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Settings",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Divider(color: Colors.white24),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.yellow.withOpacity(0.08),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: const [
                        Icon(Icons.notifications, color: Colors.white),
                        SizedBox(width: 2),
                        Expanded(
                          child: Text(
                            "Notifications",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
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
            const SizedBox(height: 10),
            buildTile(Icons.logout, "Logout", isRed: true),
          ],
        ),
      ),
    );
  }

  // ---------------- REUSABLE TILE ----------------
  Widget buildTile(IconData icon, String title, {bool isRed = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isRed
            ? Colors.red.withOpacity(0.12)
            : Colors.yellow.withOpacity(0.08),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(icon, color: isRed ? Colors.red : Colors.white),

          const SizedBox(width: 2),
          Expanded(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: isRed ? Colors.red : Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
