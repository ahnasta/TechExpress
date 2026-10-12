
import 'package:flutter/material.dart';
import 'detail.dart';
import 'main.dart';

class KatalogPage extends StatefulWidget {
  const KatalogPage({super.key});

  @override
  State<KatalogPage> createState() => _KatalogPageState();
}

class _KatalogPageState extends State<KatalogPage> {
  final TextEditingController pencarian = TextEditingController();
  final Map<String, String> voucherGadget = {};

  final List<Map<String, dynamic>> gadgets = [
    {
      'nama': 'Smartphone X',
      'harga': 3000000,
      'icon': Icons.phone_android_rounded,
      'warna': babyBlue,
      'aksen': Color(0xFF639BD0),
    },
    {
      'nama': 'Laptop Pro',
      'harga': 8500000,
      'icon': Icons.laptop_mac_rounded,
      'warna': lavender,
      'aksen': Color(0xFF927BCB),
    },
    {
      'nama': 'Tablet Air',
      'harga': 4500000,
      'icon': Icons.tablet_mac_rounded,
      'warna': mint,
      'aksen': Color(0xFF55A68D),
    },
    {
      'nama': 'Smartwatch Fit',
      'harga': 1200000,
      'icon': Icons.watch_rounded,
      'warna': cream,
      'aksen': Color(0xFFD69A54),
    },
    {
      'nama': 'Headphone Max',
      'harga': 750000,
      'icon': Icons.headphones_rounded,
      'warna': babyPink,
      'aksen': Color(0xFFD879A0),
    },
    {
      'nama': 'Gaming Console',
      'harga': 5500000,
      'icon': Icons.sports_esports_rounded,
      'warna': Color(0xFFE1E7FF),
      'aksen': Color(0xFF7586D6),
    },
  ];

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

  int hargaDiskon(int harga, String? voucher) {
    if (voucher == null) {
      return harga;
    }

    final cocok = RegExp(r'Diskon (\d+)%').firstMatch(voucher);

    if (cocok == null) {
      return harga;
    }

    final persen = int.tryParse(cocok.group(1) ?? '');

    if (persen == null || persen < 0 || persen > 100) {
      return harga;
    }

    return (harga * (100 - persen) / 100).round();
  }

  @override
  void dispose() {
    pencarian.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final daftar = gadgets.where((gadget) {
      return (gadget['nama'] as String)
          .toLowerCase()
          .contains(pencarian.text.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: appBg,

      appBar: AppBar(
        backgroundColor: appBg,
        title: const Row(
          children: [
            Icon(Icons.storefront_rounded, size: 27),
            SizedBox(width: 9),
            Text(
              'TechExpress ♡',
              style: TextStyle(
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'Kembali ke Home',
            icon: const Icon(
              Icons.arrow_back_rounded,
              size: 28,
              color: softBlue,
            ),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/',
                (route) => false,
              );
            },
          ),
        ],
      ),

      body: Column(
        children: [
          // BANNER
          Container(
            margin: const EdgeInsets.fromLTRB(16, 8, 16, 14),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFFB9DCFF),
                  Color(0xFFE3DFFF),
                ],
              ),
              borderRadius: BorderRadius.circular(22),
            ),
            child: Row(
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '♡ LITTLE GADGET SHOP',
                        style: TextStyle(
                          color: Color(0xFF547FA8),
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Find your\nhappy gadgets!',
                        style: TextStyle(
                          color: Color(0xFF456B92),
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Belanja kecil, bahagia besar ♡',
                        style: TextStyle(
                          color: Color(0xFF547FA8),
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.65),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.devices_rounded,
                    size: 42,
                    color: Color(0xFF6C9FD3),
                  ),
                ),
              ],
            ),
          ),

          // PENCARIAN
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: pencarian,
              onChanged: (value) => setState(() {}),
              decoration: InputDecoration(
                hintText: 'Cari gadget favoritmu...',
                prefixIcon: const Icon(
                  Icons.search_rounded,
                  color: pastelBlue,
                ),
                suffixIcon: pencarian.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.close_rounded),
                        onPressed: () {
                          pencarian.clear();
                          setState(() {});
                        },
                      )
                    : const Icon(
                        Icons.favorite_border_rounded,
                        color: Color(0xFFFFA9C8),
                      ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 12,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // JUDUL KATALOG
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 18, 20, 10),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'Pick your favorite! ♡',
                    style: TextStyle(
                      color: softBlue,
                      fontWeight: FontWeight.w900,
                      fontSize: 17,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 11,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: lavender,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${daftar.length} items',
                    style: const TextStyle(
                      color: Color(0xFF806AB5),
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // DAFTAR PRODUK
          Expanded(
            child: daftar.isEmpty
                ? const Center(
                    child: Text('Gadget tidak ditemukan ♡'),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    itemCount: daftar.length,
                    itemBuilder: (context, index) {
                      final gadget = daftar[index];

                      final nama = gadget['nama'] as String;
                      final harga = gadget['harga'] as int;
                      final icon = gadget['icon'] as IconData;
                      final warna = gadget['warna'] as Color;
                      final aksen = gadget['aksen'] as Color;

                      final voucher = voucherGadget[nama];
                      final hargaAkhir = hargaDiskon(harga, voucher);

                      return _kartuGadget(
                        context,
                        nama,
                        harga,
                        hargaAkhir,
                        icon,
                        warna,
                        aksen,
                        voucher,
                      );
                    },
                  ),
          ),
        ],
      ),

      // NAVIGASI BAWAH
      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        backgroundColor: Colors.white,
        indicatorColor: babyBlue,
        onDestinationSelected: (index) {
          if (index == 1) {
            Navigator.pushReplacementNamed(context, '/profil');
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

  // KARTU PRODUK
  Widget _kartuGadget(
    BuildContext context,
    String nama,
    int harga,
    int hargaAkhir,
    IconData icon,
    Color warna,
    Color aksen,
    String? voucher,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              nama: nama,
              harga: harga,
              icon: icon,
              warna: aksen,
              voucherAwal: voucher ?? '-',
              onVoucherChanged: (hasil) {
                setState(() {
                  if (hasil == '-') {
                    voucherGadget.remove(nama);
                  } else {
                    voucherGadget[nama] = hasil;
                  }
                });
              },
            ),
          ),
        ).then((_) {
          if (mounted) {
            setState(() {});
          }
        });
      },
      child: Card(
        color: Colors.white,
        margin: const EdgeInsets.only(bottom: 10),
        elevation: 2,
        shadowColor: pastelBlue.withOpacity(0.15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        child: Padding(
          padding: const EdgeInsets.all(11),
          child: Row(
            children: [
              // IKON PRODUK
              Container(
                width: 68,
                height: 68,
                decoration: BoxDecoration(
                  color: warna,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(
                      icon,
                      size: 37,
                      color: aksen,
                    ),
                    if (voucher != null)
                      Positioned(
                        top: 3,
                        right: 3,
                        child: Icon(
                          Icons.local_offer_rounded,
                          size: 14,
                          color: aksen,
                        ),
                      ),
                  ],
                ),
              ),

              const SizedBox(width: 13),

              // NAMA DAN HARGA
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      nama,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF5D7895),
                      ),
                    ),
                    const SizedBox(height: 5),

                    if (voucher != null)
                      Text(
                        rupiah(harga),
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),

                    Text(
                      rupiah(hargaAkhir),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                        color: aksen,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Row(
                      children: [
                        if (voucher != null)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 7,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: warna,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              voucher,
                              style: TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.bold,
                                color: aksen,
                              ),
                            ),
                          ),

                        const Spacer(),

                        const Text(
                          'See more',
                          style: TextStyle(
                            fontSize: 11,
                            color: softBlue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 3),
                        const Icon(
                          Icons.arrow_forward_rounded,
                          size: 13,
                          color: softBlue,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
