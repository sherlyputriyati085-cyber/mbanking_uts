import 'package:flutter/material.dart';

void main() => runApp(const BRImoApp());

class BRImoApp extends StatelessWidget {
  const BRImoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'sans-serif'),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isSaldoVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FA),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // --- HEADER BIRU POLOS (SESUAI FOTO) ---
            Stack(
              clipBehavior: Clip.none,
              children: [
                _buildBlueHeader(),
                _buildMainIntegratedCard(), // Box Putih berisi Saldo Biru + Transfer
              ],
            )

            const SizedBox(height: 15),
            const SizedBox(height: 15),

            // --- CARI FITUR & ATUR (BERDAMPINGAN BEDA BOX) ---
            _buildSearchAndAtur(),

            const SizedBox(height: 15),

            // --- grid fitur 4x2 (top up - donasi) ---
            _buildFeatureGrid(),

            const SizedBox(height: 20),

            // --- penawaran: spesial untukmu & diskon mudik (background ramadhan) ---
            _buildOfferSection(),

            const SizedBox(height: 120), 
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF00529C),
        elevation: 4,
        child: const Icon(Icons.qr_code_scanner, color: Colors.white size: 30),

        ),
        bottomNavigationBar: _buildBottomNav(),
    );
  }
  // 1. header atas sesuai foto
  Widget _buildBlueHeader() {
    return Container(
      height: 220,
      width: double.infinity,
      color: const Color(0xFF00529C),
      padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "selamat malam,",
                style: TextStyle(color: Colors.white70, fontSize: 14),
              )
              Text(
                "sherly putriyati",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          )
          Row(
            children: [
              const Icon(
                Icons.notifications_none,
                color: Colors.white,
                size: 26,
              )
            ],
          )
        ],
      ) 
    )
  }
}