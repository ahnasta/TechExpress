
import 'package:flutter/material.dart';
import 'main.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Profile ♡',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Container(
              width: 125,
              height: 125,
              decoration: BoxDecoration(
                color: babyPink,
                borderRadius: BorderRadius.circular(42),
              ),
              child: const Icon(
                Icons.face_3_rounded,
                size: 82,
                color: Color(0xFFD879A0),
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              'Hello, Bestie! ♡',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w900,
                color: softBlue,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Welcome to your little gadget world',
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xFF9AAFC4)),
            ),
            const SizedBox(height: 28),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [babyBlue, lavender],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(28),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.workspace_premium_rounded,
                        color: Color(0xFF547FA8),
                        size: 30,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'TECH EXPRESS CLUB',
                        style: TextStyle(
                          color: Color(0xFF547FA8),
                          fontWeight: FontWeight.w900,
                          fontSize: 13,
                          letterSpacing: 1,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.auto_awesome_rounded,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Text(
                    'MEMBER CODE',
                    style: TextStyle(
                      color: Color(0xFF6887A8),
                      fontSize: 11,
                      letterSpacing: 2,
                    ),
                  ),
                  SizedBox(height: 7),
                  Text(
                    'TE001 ♡',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF456B92),
                      letterSpacing: 2,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Your membership, your little perks!',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF547FA8),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(17),
              decoration: BoxDecoration(
                color: mint,
                borderRadius: BorderRadius.circular(22),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.favorite_rounded,
                    color: Color(0xFF55A68D),
                    size: 28,
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Keep shopping, keep smiling!',
                      style: TextStyle(
                        color: Color(0xFF438B76),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text('♡'),
                ],
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: babyPink,
                  foregroundColor: const Color(0xFFC7688F),
                  elevation: 0,
                ),
                icon: const Icon(Icons.logout_rounded),
                label: const Text(
                  'Logout',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/login',
                    (route) => false,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 1,
        backgroundColor: Colors.white,
        indicatorColor: babyBlue,
        onDestinationSelected: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/katalog');
          }
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.storefront_outlined),
            selectedIcon: Icon(Icons.storefront_rounded),
            label: 'Katalog',
          ),
          NavigationDestination(
            icon: Icon(Icons.face_3_outlined),
            selectedIcon: Icon(Icons.face_3_rounded),
            label: 'My Profile',
          ),
        ],
      ),
    );
  }
}
