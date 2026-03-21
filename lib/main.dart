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
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  // header atas sesuai foto
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
              ),
              Text(
                "Sherly",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.notifications_none,
                color: Colors.white,
                size: 26,
              ),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: const [
                    Icon(
                      Icons.headset_mic_outlined,
                      color: Colors.white,
                      size: 18,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Pusat\nBantuan",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        height: 1.1,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  // 2. Box Terintegrasi (Saldo Biru di dalam Bingkai Putih)
  Widget _buildMainIntegratedCard() {
    return Container(
      margin: const EdgeInsets.only(top: 130, left: 20, right: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 15)],
      ),

    child: Column(
        children: [
          // Box Saldo Biru Tua
          Container(
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: const Color(0xFF0D47A1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Saldo Rekening Utama", style: TextStyle(color: Colors.white, fontSize: 13)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(_isSaldoVisible ? "Rp 5.250.000" : "● ● ● ● ● ●",
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () => setState(() => _isSaldoVisible = !_isSaldoVisible),
                      child: Icon(_isSaldoVisible ? Icons.visibility : Icons.visibility_off_outlined, color: Colors.white, size: 20),
                    ),
                  ],
                ),
                const Divider(color: Colors.white24, thickness: 1, height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Semua Rekeningmu", style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500)),
                    Icon(Icons.chevron_right, color: Colors.white),
                  ],
                ),
              ],
            ),
          ),
           // Fitur Utama (Transfer, BRIVA, dll)
          Padding(
            padding: const EdgeInsets.only(bottom: 20, top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                 _buildMainIcon(Icons.payments_outlined, "Transfer", Colors.blue[50]!),
                _buildMainIcon(Icons.account_balance, "BRIVA", Colors.teal[50]!),
                _buildMainIcon(Icons.water_drop, "PDAM", Colors.blue[50]!),
                _buildMainIcon(Icons.phone_android, "Pulsa/Data", Colors.green[50]!),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
}
