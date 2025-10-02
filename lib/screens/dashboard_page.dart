import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECF0F1),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2C3E50),
        elevation: 0,
        title: const Text(
          'Dashboard',
          style: TextStyle(color: Color(0xFFECF0F1)),
        ),
        actions: [
          // Icon notifikasi dengan badge
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications, color: Color(0xFFECF0F1)),
                onPressed: () {},
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Color(0xFFE74C3C),
                    shape: BoxShape.circle,
                  ),
                  child: const Text(
                    '3',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header dengan sapaan
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: Color(0xFF2C3E50),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Halo, Budi!',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFECF0F1),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Selamat datang kembali',
                    style: TextStyle(
                      fontSize: 14,
                      color: const Color(0xFFECF0F1).withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ),

            // Konten utama
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Jadwal hari ini
                  const Text(
                    'Jadwal Hari Ini',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2C3E50),
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildScheduleCard(
                    'Pemrograman Mobile',
                    '10:00 - 12:00',
                    'Ruang A301',
                    Icons.phone_android,
                  ),
                  const SizedBox(height: 10),
                  _buildScheduleCard(
                    'Basis Data',
                    '13:00 - 15:00',
                    'Ruang B201',
                    Icons.storage,
                  ),
                  const SizedBox(height: 24),

                  // Notifikasi terbaru
                  const Text(
                    'Notifikasi Terbaru',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2C3E50),
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildNotificationCard(
                    'Nilai Baru',
                    'Nilai UTS Pemrograman Web telah tersedia',
                    Icons.grade,
                    const Color(0xFF3498DB),
                  ),
                  const SizedBox(height: 10),
                  _buildNotificationCard(
                    'Materi Baru',
                    'Materi Algoritma Pemrograman telah diupload',
                    Icons.book,
                    const Color(0xFF27AE60),
                  ),
                  const SizedBox(height: 10),
                  _buildNotificationCard(
                    'Pengumuman',
                    'Kuliah besok dimulai pukul 09:00',
                    Icons.announcement,
                    const Color(0xFFE74C3C),
                  ),
                  const SizedBox(height: 24),

                  // Quick Access
                  const Text(
                    'Akses Cepat',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2C3E50),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildQuickAccessButton(
                        'Jadwal',
                        Icons.schedule,
                        const Color(0xFF3498DB),
                      ),
                      _buildQuickAccessButton(
                        'Materi',
                        Icons.book,
                        const Color(0xFF27AE60),
                      ),
                      _buildQuickAccessButton(
                        'Nilai',
                        Icons.grade,
                        const Color(0xFFE67E22),
                      ),
                      _buildQuickAccessButton(
                        'Profil',
                        Icons.person,
                        const Color(0xFF9B59B6),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk kartu jadwal
  Widget _buildScheduleCard(
      String subject, String time, String room, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF3498DB).withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: const Color(0xFF3498DB), size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subject,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2C3E50),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 14,
                    color: const Color(0xFF2C3E50).withOpacity(0.6),
                  ),
                ),
                Text(
                  room,
                  style: TextStyle(
                    fontSize: 12,
                    color: const Color(0xFF2C3E50).withOpacity(0.4),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk kartu notifikasi
  Widget _buildNotificationCard(
      String title, String message, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2C3E50),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  message,
                  style: TextStyle(
                    fontSize: 12,
                    color: const Color(0xFF2C3E50).withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk tombol akses cepat
  Widget _buildQuickAccessButton(String label, IconData icon, Color color) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Icon(icon, color: color, size: 30),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF2C3E50),
          ),
        ),
      ],
    );
  }
}
