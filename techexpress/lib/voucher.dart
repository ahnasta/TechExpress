
import 'package:flutter/material.dart';
import 'main.dart';

void main() {
  runApp(const TechExpress());
}

class VoucherPage extends StatelessWidget {
  const VoucherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pick Your Voucher ♡',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'A little gift for you!',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w900,
                color: softBlue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Pilih diskon favoritmu dan hemat belanja ♡',
              style: TextStyle(
                color: Color(0xFF94A8BC),
                height: 1.5,
              ),
            ),
            const SizedBox(height: 25),
            _buatVoucher(
              context,
              'Diskon 10%',
              'Little Treat',
              'Hemat 10% untuk gadget favoritmu.',
              babyBlue,
              const Color(0xFF639BD0),
              Icons.local_offer_rounded,
            ),
            const SizedBox(height: 18),
            _buatVoucher(
              context,
              'Diskon 20%',
              'Super Sweet Deal!',
              'Diskon lebih besar, happy lebih besar!',
              babyPink,
              const Color(0xFFD879A0),
              Icons.redeem_rounded,
            ),
            const SizedBox(height: 25),
            const Center(
              child: Text(
                'Choose happiness, choose savings! ✧',
                style: TextStyle(
                  color: Color(0xFFA5B4C7),
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buatVoucher(
    BuildContext context,
    String nama,
    String judul,
    String deskripsi,
    Color warna,
    Color aksen,
    IconData icon,
  ) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(25),
      child: InkWell(
        borderRadius: BorderRadius.circular(25),
        onTap: () {
          Navigator.pop(context, nama);
        },
        child: Container(
          padding: const EdgeInsets.all(17),
          decoration: BoxDecoration(
            border: Border.all(color: warna, width: 2),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            children: [
              Container(
                width: 70,
                height: 85,
                decoration: BoxDecoration(
                  color: warna,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(icon, color: aksen, size: 38),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      judul,
                      style: TextStyle(
                        fontSize: 12,
                        color: aksen,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      nama,
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w900,
                        color: aksen,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      deskripsi,
                      style: const TextStyle(
                        fontSize: 11,
                        color: Color(0xFF94A8BC),
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.favorite_rounded, color: aksen, size: 20),
            ],
          ),
        ),
      ),
    );
  }
}
