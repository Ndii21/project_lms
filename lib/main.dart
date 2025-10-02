import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/login_page.dart';
import 'package:flutter/foundation.dart';
void main() {
  runApp(const CampusHubApp());
}

class CampusHubApp extends StatelessWidget {
  const CampusHubApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campus Hub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Menggunakan font Poppins untuk seluruh aplikasi
        textTheme: GoogleFonts.poppinsTextTheme(),
        primaryColor: const Color(0xFF2C3E50),
        scaffoldBackgroundColor: const Color(0xFFECF0F1),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF3498DB),
          primary: const Color(0xFF3498DB),
          secondary: const Color(0xFF2C3E50),
          error: const Color(0xFFE74C3C),
        ),
      ),
      home: const LoginPage(),
    );
  }
}
