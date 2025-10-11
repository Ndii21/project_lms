// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({Key? key}) : super(key: key);

  // Data jadwal mata kuliah
  final Map<String, List<Map<String, String>>> _scheduleData = const {
    'Senin': [
      // tidak ada kelas
    ],
    'Selasa': [
      {
        'subject': 'Riset operasi',
        'time': '07:45 - 10:00',
        'room': 'FASILKOM 4.81',
        'lecturer': 'Ahmad Khusaeri, M.Kom.',
      },
      {
        'subject': 'Pemrograman perangkat bergerak',
        'time': '15:30 - 18:00',
        'room': 'FASILKOM Lab Dasar 2',
        'lecturer': 'Purwantoro, S.Kom., M.Kom.',
      },
    ],
    'Rabu': [
      {
        'subject': 'Etika profesi',
        'time': '15:50 - 17:30',
        'room': 'FASILKOM 4.75',
        'lecturer': 'Aziz Masum M.Kom.',
      },
    ],
    'Kamis': [
      {
        'subject': 'Perencanaan strategi sistem informasi',
        'time': '07:30 - 10:00',
        'room': 'FASILKOM Lab Dasar 2',
        'lecturer': 'H. Bagja Nugraha, S.T., M.Kom.',
      },
    ],
    'Jumat': [
      {
        'subject': 'Metodologi penelitian',
        'time': '10:20 - 12:00',
        'room': 'FASILKOM 4.76',
        'lecturer': 'Apriade Voutama M.Kom.',
      },
      {
        'subject': 'Sistem enterprise resource planning',
        'time': '13:00 - 15:30',
        'room': 'FASILKOM 4.78',
        'lecturer': 'Azhari Ali Ridha, S.Kom, M.M.S.I',
      },
      {
        'subject': 'Testing dan implementasi sistem',
        'time': '05:30 - 18:00',
        'room': 'FASILKOM 4.78',
        'lecturer': 'Kamal Prihandani. S.Kom., M.Kom.',
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
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
