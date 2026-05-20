import 'package:flutter/material.dart';
import 'package:money_transfer/onboarding/onboarding.dart';
import 'package:money_transfer/phone_authentication/phone_authentication.dart';
import 'package:money_transfer/profile/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const ProfilePage(),
    );
  }
}
