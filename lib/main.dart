import 'package:flutter/foundation.dart';
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
  bool __isSaldoVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FA),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // --- HEADER BIRU POLOS ---
            Stack(
              clipBehavior: Clip.none,
              children: [
                _buildBlueHeader(),
                _buildMainIntegratedCard(), // Box Putih berisi Saldo Biru + Transfer
              ],
            ),
            const SizedBox(height: 25),
            // --- CARI FITUR & ATUR (BERDAMPINGAN BEDA BOX) ---
            _buildSearchAndAtur(),

            const SizedBox(height: 15),

            // --- GRID FITUR 4x2 (TOP UP - DONASI) ---
            _buildFeatureGrid(),

            const SizedBox(height: 25),

            // --- PENAWARAN: SPESIAL UNTUKMU & LIHAT SEMUA ---
            _buildOfferHeader(),

            const SizedBox(height: 120),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF00529C),
        elevation: 4,
        child: const Icon(Icons.qr_code_scanner, color: Colors.white, size: 30),
      ),
    );
  }
}
