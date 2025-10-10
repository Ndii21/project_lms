import 'package:flutter/material.dart';

class GradesPage extends StatelessWidget {
  const GradesPage({Key? key}) : super(key: key);

  // Data nilai statis (Hanya Semester 5 yang sedang berjalan)
  final List<Map<String, dynamic>> _gradesData = const [
    {
      'course': 'Pemrograman perangkat bergerak',
      'grade': '-',
      'score': 0,
      'status': 'Sedang Berjalan',
      'color': Color(0xFFE67E22), // Orange: Ongoing
    },
    {
      'course': 'Perencanaan strategi sistem informasi',
      'grade': '-',
      'score': 0,
      'status': 'Sedang Berjalan',
      'color': Color(0xFFE67E22),
    },
    {
      'course': 'Sistem enterprise resource planning',
      'grade': '-',
      'score': 0,
      'status': 'Sedang Berjalan',
      'color': Color(0xFFE67E22),
    },
    {
      'course': 'Metodologi penelitian',
      'grade': '-',
      'score': 0,
      'status': 'Sedang Berjalan',
      'color': Color(0xFFE67E22),
    },
    {
      'course': 'Testing dan implementasi sistem',
      'grade': '-',
      'score': 0,
      'status': 'Sedang Berjalan',
      'color': Color(0xFFE67E22),
    },
    {
      'course': 'Riset operasi',
      'grade': '-',
      'score': 0,
      'status': 'Sedang Berjalan',
      'color': Color(0xFFE67E22),
    },
    {
      'course': 'Etika profesi',
      'grade': '-',
      'score': 0,
      'status': 'Sedang Berjalan',
      'color': Color(0xFFE67E22),
    },
    {
      'course': 'Magang',
      'grade': '-',
      'score': 0,
      'status': 'Sedang Berjalan',
      'color': Color(0xFFE67E22),
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Menggunakan IPK Kumulatif dari semester sebelumnya (S1-S4) sebagai nilai mock
    double ipk = 3.79;

    return Scaffold(
      backgroundColor: const Color(0xFFECF0F1),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2C3E50),
        elevation: 0,
        title: const Text(
          'Nilai',
          style: TextStyle(color: Color(0xFFECF0F1)),
        ),
      ),
      body: Column(
        children: [
          // Header dengan IPK
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
              children: [
                const Text(
                  'Indeks Prestasi Kumulatif',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFFECF0F1),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  ipk.toStringAsFixed(2),
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3498DB),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'S/D Semester 4 dari 4.00',
                  style: TextStyle(
                    fontSize: 14,
                    color: const Color(0xFFECF0F1).withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),

          // Daftar nilai
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _gradesData.length,
              itemBuilder: (context, index) {
                final gradeData = _gradesData[index];
                return _buildGradeCard(
                  gradeData['course'],
                  gradeData['grade'],
                  gradeData['score'],
                  gradeData['status'],
                  gradeData['color'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk kartu nilai
  Widget _buildGradeCard(
    String course,
    String grade,
    int score,
    String status,
    Color statusColor,
  ) {
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
      child: Row(
        children: [
          // Grade (huruf)
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                grade,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: statusColor,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),

          // Informasi mata kuliah
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2C3E50),
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Icon(
                      Icons.assessment,
                      size: 14,
                      color: const Color(0xFF2C3E50).withOpacity(0.5),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      // Menampilkan status jika nilai 0, atau nilai jika ada
                      score > 0 ? 'Nilai: $score' : 'Nilai: Belum Ada',
                      style: TextStyle(
                        fontSize: 13,
                        color: const Color(0xFF2C3E50).withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: statusColor,
                    ),
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