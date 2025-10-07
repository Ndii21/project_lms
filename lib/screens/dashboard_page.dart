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
      'title': 'Pembayaran UKT Semester Genap',
      'message': 'Batas akhir pembayaran UKT pada 20 Januari 2026',
      'icon': Icons.payment,
      'color': Color(0xFF3498DB),
    },
    {
      'title': 'Acara Webinar Nasional',
      'message': 'Webinar "Masa Depan AI" akan diadakan pada 10 November 2025',
      'icon': Icons.campaign,
      'color': Color(0xFF27AE60),
    },
    {
      'title': 'Penyesuaian Jadwal Kuliah',
      'message': 'Cek kembali jadwal kuliah Anda untuk minggu ini',
      'icon': Icons.calendar_today,
      'color': Color(0xFFE67E22),
    },
  ];

  // Data dummy untuk notifikasi
  final List<Map<String, dynamic>> _notifications = const [
    {
      'title': 'Nilai Baru',
      'message': 'Nilai UTS Pemrograman Web telah tersedia',
      'icon': Icons.grade,
      'color': Color(0xFFE67E22),
    },
    {
      'title': 'Materi Baru',
      'message': 'Materi Algoritma Pemrograman telah diupload',
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

  // Widget baru untuk kartu informasi terkini
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