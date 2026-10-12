
import 'package:flutter/material.dart';
import 'login.dart';
import 'katalog.dart';
import 'profil.dart';

// WARNA TECH EXPRESS
const Color babyBlue = Color(0xFFDCEEFF);
const Color pastelBlue = Color(0xFF8CBDEB);
const Color softBlue = Color(0xFF547FA8);
const Color babyPink = Color(0xFFFFE1EC);
const Color lavender = Color(0xFFE9E0FF);
const Color mint = Color(0xFFDDF5E8);
const Color cream = Color(0xFFFFF5E5);
const Color appBg = Color(0xFFF7FAFF);

void main() {
  runApp(const TechExpress());
}

class TechExpress extends StatelessWidget {
  const TechExpress({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TechExpress',

      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: appBg,
        colorScheme: ColorScheme.fromSeed(
          seedColor: pastelBlue,
          primary: pastelBlue,
          surface: Colors.white,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: babyBlue,
          foregroundColor: softBlue,
          elevation: 0,
          centerTitle: false,
        ),
        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 2,
          shadowColor: Color(0x40B6D5F2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(24),
            ),
          ),
        ),
      ),

      initialRoute: '/login',

      routes: {
        '/login': (context) => const LoginPage(),
        '/': (context) => const KatalogPage(),
        '/katalog': (context) => const KatalogPage(),
        '/profil': (context) => const ProfilPage(),
      },
    );
  }
}
