
import 'package:flutter/material.dart';
import 'main.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBg,
      appBar: AppBar(
        title: const Text(
          'Login ♡ TechExpress',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Container(
                width: 190,
                height: 190,
                decoration: BoxDecoration(
                  color: babyBlue,
                  borderRadius: BorderRadius.circular(55),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const Positioned(
                      top: 20,
                      right: 25,
                      child: Icon(
                        Icons.auto_awesome,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    const Positioned(
                      bottom: 25,
                      left: 22,
                      child: Icon(
                        Icons.favorite,
                        color: Color(0xFFFFA9C8),
                        size: 25,
                      ),
                    ),
                    Container(
                      width: 115,
                      height: 115,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: const Icon(
                        Icons.shopping_bag_rounded,
                        size: 70,
                        color: pastelBlue,
                      ),
                    ),
                    const Positioned(
                      bottom: 32,
                      right: 40,
                      child: Icon(
                        Icons.star_rounded,
                        color: Color(0xFFFFCF70),
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Hello, little shopper! ♡',
                style: TextStyle(
                  color: softBlue,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Selamat Datang di',
                style: TextStyle(fontSize: 18, color: softBlue),
              ),
              const Text(
                'TechExpress',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w900,
                  color: softBlue,
                  letterSpacing: -1,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Temukan gadget impianmu dengan\nharga spesial dan voucher lucu!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 1.6,
                  color: Color(0xFF8B9DB1),
                ),
              ),
              const SizedBox(height: 28),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: pastelBlue,
                    foregroundColor: Colors.white,
                    elevation: 3,
                    shadowColor: pastelBlue.withOpacity(0.3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      '/katalog',
                    );
                  },
                  icon: const Icon(Icons.rocket_launch_rounded),
                  label: const Text(
                    'Mulai Belanja!',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'made with ♡ for gadget lovers',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFFA5B4C7),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
