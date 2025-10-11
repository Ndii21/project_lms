import 'package:flutter/material.dart';
import 'notification_popup.dart'; // Import file baru

class DashboardPage extends StatelessWidget {
  final String userName;
  final Function(int) onQuickAccessTap;

  const DashboardPage({
    Key? key,
    required this.userName,
    required this.onQuickAccessTap,
  }) : super(key: key);

  // Data dummy untuk informasi terkini
  final List<Map<String, dynamic>> _currentInfo = const [
    {
      'title': 'Pembayaran UKT Semester Ganjil',
      'message': 'Batas akhir pembayaran UKT pada 2 Agustus 2025',
      'icon': Icons.payment,
      'color': Color(0xFF3498DB),
    },
    {
      'title': 'Acara Webinar Nasional',
      'message':
          'Webinar "Masa Depan Web3" akan diadakan pada 10 November 2025 di Aula Syech Kuro',
      'icon': Icons.campaign,
      'color': Color(0xFF27AE60),
    },
    {
      'title': 'Informasi Perpustakaan',
      'message': 'Mohon Maaf, Perpustakaan tutup pada 10 - 13 Oktober 2025',
      'icon': Icons.calendar_today,
      'color': Color(0xFFE67E22),
    },
  ];

  // Data dummy untuk notifikasi
  final List<Map<String, dynamic>> _notifications = const [
    {
      'title': 'Tugas Baru',
      'message':
          'Silakan kerjakan tugas Pemrograman Perangkat Bergerak, Tugas 1 Desain UI.',
      'icon': Icons.grade,
      'color': Color(0xFFE67E22),
    },
    {
      'title': 'Materi Baru',
      'message':
          'Materi Cara Menyusun Proposal telah diunggah di mata kuliah Metodologi Penelitian.',
      'icon': Icons.book,
      'color': Color(0xFF3498DB),
    },
    {
      'title': 'Pengumuman',
      'message': 'Kuliah besok dimulai pukul 09:00',
      'icon': Icons.announcement,
      'color': Color(0xFFE74C3C),
    },
  ];

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
                onPressed: () {
                  // Menampilkan pop-up notifikasi saat ikon diklik
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return NotificationPopup(notifications: _notifications);
                    },
                  );
                },
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
                  child: Text(
                    '${_notifications.length}',
                    style: const TextStyle(
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
                  Text(
                    'Halo, $userName!',
                    style: const TextStyle(
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
                    'Riset Operasi',
                    '07:45 - 10:00',
                    'FASILKOM 4-81',
                    Icons.phone_android,
                  ),
                  const SizedBox(height: 10),
                  _buildScheduleCard(
                    'Pemrograman Perangkat Bergerak',
                    '15:30 - 17:30',
                    'FASILKOM Lab Dasar 2',
                    Icons.storage,
                  ),
                  const SizedBox(height: 24),

                  // Informasi Terkini
                  const Text(
                    'Informasi Terkini',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2C3E50),
                    ),
                  ),
                  const SizedBox(height: 12),
                  ..._currentInfo.map((info) => _buildInfoCard(
                        info['title'],
                        info['message'],
                        info['icon'],
                        info['color'],
                      )),
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

  // Widget untuk kartu informasi terkini
  Widget _buildInfoCard(
      String title, String message, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 10),
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
}
