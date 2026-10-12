
import 'package:flutter/material.dart';
import 'voucher.dart';
import 'main.dart';

class DetailPage extends StatefulWidget {
  final String nama;
  final int harga;
  final IconData icon;
  final Color warna;
  final String voucherAwal;
  final Function(String) onVoucherChanged;

  const DetailPage({
    super.key,
    required this.nama,
    required this.harga,
    required this.icon,
    required this.warna,
    required this.voucherAwal,
    required this.onVoucherChanged,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late String voucher;

  @override
  void initState() {
    super.initState();
    voucher = widget.voucherAwal;
  }

  int get hargaAkhir {
    if (voucher == 'Diskon 10%') {
      return (widget.harga * 0.9).round();
    }
    if (voucher == 'Diskon 20%') {
      return (widget.harga * 0.8).round();
    }
    return widget.harga;
  }

  String rupiah(int harga) {
    String angka = harga.toString();
    String hasil = '';

    for (int i = 0; i < angka.length; i++) {
      hasil += angka[i];
      int sisa = angka.length - i - 1;
      if (sisa > 0 && sisa % 3 == 0) {
        hasil += '.';
      }
    }

    return 'Rp $hasil';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Product Details ♡',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: 245,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [babyBlue, lavender],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(32),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Positioned(
                    top: 20,
                    right: 22,
                    child: Icon(
                      Icons.auto_awesome_rounded,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                  const Positioned(
                    bottom: 20,
                    left: 22,
                    child: Icon(
                      Icons.favorite_rounded,
                      color: Color(0xFFFFA9C8),
                      size: 28,
                    ),
                  ),
                  Icon(
                    widget.icon,
                    size: 130,
                    color: widget.warna,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 22),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.nama,
                style: const TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w900,
                  color: softBlue,
                ),
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Your next favorite gadget! ♡',
                style: TextStyle(color: Color(0xFF9AAFC4)),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.sell_rounded,
                          color: pastelBlue,
                        ),
                        const SizedBox(width: 10),
                        const Expanded(child: Text('Harga normal')),
                        Text(
                          rupiah(widget.harga),
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    const Divider(height: 28),
                    Row(
                      children: [
                        const Icon(
                          Icons.savings_rounded,
                          color: Color(0xFF69B99A),
                        ),
                        const SizedBox(width: 10),
                        const Expanded(
                          child: Text('Harga spesial'),
                        ),
                        Flexible(
                          child: Text(
                            rupiah(hargaAkhir),
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                              color: Color(0xFF55A68D),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: babyPink.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.redeem_rounded,
                            color: Color(0xFFD879A0),
                            size: 30,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Voucher kamu',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFFAC718A),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  voucher == '-' ? 'Belum ada ♡' : voucher,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: Color(0xFFAC6184),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(
                            Icons.favorite_rounded,
                            color: Color(0xFFFFA9C8),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.card_giftcard_rounded),
                label: const Text(
                  'Pilih Voucher ♡',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: () async {
                  final hasil = await Navigator.push<String>(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const VoucherPage(),
                    ),
                  );

                  if (hasil != null) {
                    setState(() {
                      voucher = hasil;
                    });
                    widget.onVoucherChanged(hasil);
                  }
                },
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'A little treat just for you ✧',
              style: TextStyle(
                color: Color(0xFFA5B4C7),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
