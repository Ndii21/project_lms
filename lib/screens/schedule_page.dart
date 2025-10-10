import 'package:flutter/material.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({Key? key}) : super(key: key);

  // Data jadwal statis untuk setiap hari (diambil dari mata kuliah Semester 5)
  final Map<String, List<Map<String, String>>> _scheduleData = const {
    'Senin': [
      {
        'subject': 'Perencanaan strategi sistem informasi',
        'time': '08:00 - 10:00',
        'room': 'Ruang C401',
        'lecturer': 'Ir. Budi Santoso, MBA',
      },
      {
        'subject': 'Pemrograman perangkat bergerak',
        'time': '10:00 - 12:00',
        'room': 'Lab Komputer 2',
        'lecturer': 'Dr. Sarah Setiadi',
      },
      {
        'subject': 'Sistem enterprise resource planning',
        'time': '13:00 - 15:00',
        'room': 'Ruang B301',
        'lecturer': 'M. Rizki Pratama, S.Kom',
      },
    ],
    'Selasa': [
      {
        'subject': 'Testing dan implementasi sistem',
        'time': '09:00 - 11:00',
        'room': 'Lab Komputer 1',
        'lecturer': 'Dr. Rina Wati',
      },
      {
        'subject': 'Etika profesi',
        'time': '10:30 - 12:30',
        'room': 'Ruang C201',
        'lecturer': 'Drs. Hadi Susanto',
      },
    ],
    'Rabu': [
      {
        'subject': 'Riset operasi',
        'time': '12:00 - 14:00',
        'room': 'Ruang D203',
        'lecturer': 'Dr. Lina Marlina',
      },
      {
        'subject': 'Magang',
        'time': '08:00 - 16:00',
        'room': 'Kantor',
        'lecturer': 'Supervisor Magang',
      },
    ],
    'Kamis': [
      {
        'subject': 'Metodologi penelitian',
        'time': '15:00 - 17:00',
        'room': 'Ruang A205',
        'lecturer': 'Prof. Dr. Andi Wijaya',
      },
    ],
    'Jumat': [
      // Tidak ada mata kuliah terjadwal di hari Jumat
    ],
  };

  @override
  Widget build(BuildContext context) {
    // Menghitung IPK (rata-rata)
    // IPK calculation removed as it's not relevant here but retained in grades_page

    return Scaffold(
      backgroundColor: const Color(0xFFECF0F1),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2C3E50),
        elevation: 0,
        title: const Text(
          'Jadwal Kuliah',
          style: TextStyle(color: Color(0xFFECF0F1)),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _scheduleData.length,
        itemBuilder: (context, index) {
          String day = _scheduleData.keys.elementAt(index);
          List<Map<String, String>> classes = _scheduleData[day]!;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header untuk hari
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  children: [
                    Container(
                      width: 4,
                      height: 24,
                      decoration: BoxDecoration(
                        color: const Color(0xFF3498DB),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      day,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2C3E50),
                      ),
                    ),
                  ],
                ),
              ),

              // Daftar mata kuliah untuk hari tersebut
              ...classes.map((classData) => _buildScheduleCard(
                    classData['subject']!,
                    classData['time']!,
                    classData['room']!,
                    classData['lecturer']!,
                  )),

              const SizedBox(height: 8),
            ],
          );
        },
      ),
    );
  }

  // Widget untuk kartu jadwal
  Widget _buildScheduleCard(
      String subject, String time, String room, String lecturer) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Nama mata kuliah
          Text(
            subject,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C3E50),
            ),
          ),
          const SizedBox(height: 12),

          // Informasi waktu
          Row(
            children: [
              const Icon(
                Icons.access_time,
                size: 16,
                color: Color(0xFF3498DB),
              ),
              const SizedBox(width: 8),
              Text(
                time,
                style: TextStyle(
                  fontSize: 14,
                  color: const Color(0xFF2C3E50).withOpacity(0.7),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Informasi ruangan
          Row(
            children: [
              const Icon(
                Icons.room,
                size: 16,
                color: Color(0xFF3498DB),
              ),
              const SizedBox(width: 8),
              Text(
                room,
                style: TextStyle(
                  fontSize: 14,
                  color: const Color(0xFF2C3E50).withOpacity(0.7),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Informasi dosen
          Row(
            children: [
              const Icon(
                Icons.person,
                size: 16,
                color: Color(0xFF3498DB),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  lecturer,
                  style: TextStyle(
                    fontSize: 14,
                    color: const Color(0xFF2C3E50).withOpacity(0.7),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}