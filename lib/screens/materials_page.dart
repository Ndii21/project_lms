import 'package:flutter/material.dart';
import 'material_detail_page.dart';

class MaterialsPage extends StatelessWidget {
  const MaterialsPage({Key? key}) : super(key: key);

  // Data mata kuliah statis
  final List<Map<String, dynamic>> _courses = const [
    {
      'name': 'Pemrograman Mobile',
      'icon': Icons.phone_android,
      'color': Color(0xFF3498DB),
      'materials': [
        'Materi-1-Pengenalan-Flutter.pdf',
        'Materi-2-Widget-Dasar.pdf',
        'Materi-3-State-Management.pdf',
        'Presentasi-Layout-Flutter.pptx',
        'Code-Sample-Navigation.zip',
      ],
    },
    {
      'name': 'Basis Data',
      'icon': Icons.storage,
      'color': Color(0xFF27AE60),
      'materials': [
        'Materi-1-Pengenalan-Database.pdf',
        'Materi-2-SQL-Dasar.pdf',
        'Materi-3-Normalisasi.pdf',
        'Presentasi-ERD.pptx',
        'Tutorial-MySQL.docx',
      ],
    },
    {
      'name': 'Pemrograman Web',
      'icon': Icons.web,
      'color': Color(0xFFE67E22),
      'materials': [
        'Materi-1-HTML-CSS.pdf',
        'Materi-2-JavaScript.pdf',
        'Materi-3-PHP-MySQL.pdf',
        'Presentasi-Responsive-Design.pptx',
        'Project-Template.zip',
      ],
    },
    {
      'name': 'Algoritma Pemrograman',
      'icon': Icons.code,
      'color': Color(0xFF9B59B6),
      'materials': [
        'Materi-1-Pengenalan-Algoritma.pdf',
        'Materi-2-Struktur-Data.pdf',
        'Materi-3-Sorting-Searching.pdf',
        'Presentasi-Kompleksitas-Algoritma.pptx',
        'Latihan-Soal.pdf',
      ],
    },
    {
      'name': 'Jaringan Komputer',
      'icon': Icons.router,
      'color': Color(0xFFE74C3C),
      'materials': [
        'Materi-1-Pengenalan-Jaringan.pdf',
        'Materi-2-OSI-Layer.pdf',
        'Materi-3-TCP-IP.pdf',
        'Presentasi-Protokol-Jaringan.pptx',
        'Tutorial-Cisco-Packet-Tracer.pdf',
      ],
    },
    {
      'name': 'Sistem Operasi',
      'icon': Icons.computer,
      'color': Color(0xFF34495E),
      'materials': [
        'Materi-1-Pengenalan-OS.pdf',
        'Materi-2-Process-Management.pdf',
        'Materi-3-Memory-Management.pdf',
        'Presentasi-Scheduling.pptx',
        'Lab-Linux-Commands.pdf',
      ],
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
          'Materi Kuliah',
          style: TextStyle(color: Color(0xFFECF0F1)),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _courses.length,
        itemBuilder: (context, index) {
          final course = _courses[index];
          return _buildCourseCard(
            context,
            course['name'],
            course['icon'],
            course['color'],
            course['materials'],
          );
        },
      ),
    );
  }

  // Widget untuk kartu mata kuliah
  Widget _buildCourseCard(
    BuildContext context,
    String courseName,
    IconData icon,
    Color color,
    List<String> materials,
  ) {
    return MouseRegion( // Tambahin MouseRegion di sini
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          // Navigasi ke halaman detail materi
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MaterialDetailPage(
                courseName: courseName,
                materials: materials,
                color: color,
              ),
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
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
              // Icon mata kuliah
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 30,
                ),
              ),
              const SizedBox(width: 16),

              // Nama mata kuliah dan jumlah materi
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      courseName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2C3E50),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '${materials.length} Materi tersedia',
                      style: TextStyle(
                        fontSize: 13,
                        color: const Color(0xFF2C3E50).withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),

              // Icon panah
              Icon(
                Icons.arrow_forward_ios,
                color: const Color(0xFF2C3E50).withOpacity(0.3),
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}