import 'package:flutter/material.dart';
import 'material_detail_page.dart';

class MaterialsPage extends StatelessWidget {
  const MaterialsPage({Key? key}) : super(key: key);

  // Data mata kuliah statis (Hanya Semester 5 yang sedang aktif)
  final List<Map<String, dynamic>> _courses = const [
    {
      'name': 'Pemrograman perangkat bergerak',
      'icon': Icons.phone_android,
      'color': Color(0xFF3498DB), // Blue
      'materials': [
        'Materi-1-Pengenalan-Flutter-Dart.pdf',
        'Materi-2-Widgets-Navigation.pdf',
        'Presentasi-State-Management.pptx',
        'Tugas-Project-UI-Sederhana.zip',
      ],
      'videos': [
        {
          'title': 'Pengenalan Native vs Hybrid Mobile Dev',
          'duration': '15:30'
        },
        {'title': 'Dasar-dasar Bahasa Dart dan Flutter', 'duration': '20:10'},
      ],
      'assignments': [
        {
          'title': 'Tugas Mandiri 1: Desain UI',
          'dueDate': 'Tenggat: 25 Okt 2025',
          'status': 'Belum Dikumpulkan'
        },
        {
          'title': 'Project Kelompok: Aplikasi CRUD',
          'dueDate': 'Tenggat: 30 Nov 2025',
          'status': 'Belum Dikumpulkan'
        },
      ],
    },
    {
      'name': 'Perencanaan strategi sistem informasi',
      'icon': Icons.lightbulb,
      'color': Color(0xFF27AE60), // Green
      'materials': [
        'Materi-1-Konsep-Dasar-PSIS.pdf',
        'Materi-2-Metodologi-PSIS.pdf',
        'Studi-Kasus-PSIS-Perusahaan-X.docx',
      ],
      'videos': [
        {'title': 'Model-model Perencanaan Strategis SI', 'duration': '12:00'},
        {'title': 'Mengukur Value IT untuk Bisnis', 'duration': '18:15'},
      ],
      'assignments': [
        {
          'title': 'Analisis Rencana Strategi SI',
          'dueDate': 'Tenggat: 15 Nov 2025',
          'status': 'Belum Dikumpulkan'
        },
      ],
    },
    {
      'name': 'Sistem enterprise resource planning',
      'icon': Icons.business,
      'color': Color(0xFFE67E22), // Orange
      'materials': [
        'Materi-1-Pengenalan-ERP.pdf',
        'Presentasi-Modul-SAP.pptx',
        'Studi-Kasus-Implementasi-ERP.pdf',
      ],
      'videos': [
        {
          'title': 'Mengapa Implementasi ERP Sering Gagal?',
          'duration': '19:00'
        },
        {'title': 'Modul Inti dan Integrasi Sistem ERP', 'duration': '25:00'},
      ],
      'assignments': [
        {
          'title': 'Laporan Analisis Modul ERP',
          'dueDate': 'Tenggat: 20 Nov 2025',
          'status': 'Belum Dikumpulkan'
        },
      ],
    },
    {
      'name': 'Metodologi penelitian',
      'icon': Icons.science,
      'color': Color(0xFF9B59B6), // Purple
      'materials': [
        'Materi-1-Jenis-Metode-Penelitian.pdf',
        'Materi-2-Cara-Menyusun-Proposal.pdf',
        'Template-Proposal-Penelitian.docx',
      ],
      'videos': [
        {
          'title': 'Merumuskan Masalah dan Hipotesis Penelitian',
          'duration': '17:40'
        },
        {'title': 'Teknik Pengambilan Sampel Kuantitatif', 'duration': '14:20'},
      ],
      'assignments': [
        {
          'title': 'Draft Proposal Penelitian',
          'dueDate': 'Tenggat: 1 Des 2025',
          'status': 'Belum Dikumpulkan'
        },
      ],
    },
    {
      'name': 'Testing dan implementasi sistem',
      'icon': Icons.checklist,
      'color': Color(0xFFE74C3C), // Red
      'materials': [
        'Materi-1-Testing-Fungsional.pdf',
        'Materi-2-UAT-dan-Implementasi.pdf',
        'Checklist-Uji-Coba.pdf',
      ],
      'videos': [
        {
          'title': 'Jenis-jenis Testing (Unit, Integrasi, System)',
          'duration': '16:00'
        },
        {
          'title': 'Strategi Go-Live & Post-Implementation Review',
          'duration': '18:45'
        },
      ],
      'assignments': [
        {
          'title': 'Laporan Uji Coba Black Box',
          'dueDate': 'Tenggat: 28 Okt 2025',
          'status': 'Belum Dikumpulkan'
        },
      ],
    },
    {
      'name': 'Riset operasi',
      'icon': Icons.calculate,
      'color': Color(0xFF34495E), // Dark Blue/Grey
      'materials': [
        'Materi-1-Linear-Programming.pdf',
        'Materi-2-Metode-Simplex.pdf',
        'Latihan-Soal-Riset-Operasi.pdf',
      ],
      'videos': [
        {'title': 'Metode Transportasi dan Penugasan', 'duration': '11:10'},
        {'title': 'Pengantar Teori Antrian', 'duration': '19:00'},
      ],
      'assignments': [
        {
          'title': 'Latihan Soal 1-5',
          'dueDate': 'Tenggat: 10 Nov 2025',
          'status': 'Belum Dikumpulkan'
        },
      ],
    },
    {
      'name': 'Etika profesi',
      'icon': Icons.gavel,
      'color': Color(0xFF1ABC9C), // Teal/Turquoise
      'materials': [
        'Materi-1-Kode-Etik-TI.pdf',
        'Materi-2-Isu-Privasi-dan-HAKI.pdf',
      ],
      'videos': [
        {
          'title': 'Etika Digital dan Perlindungan Data Pribadi',
          'duration': '14:50'
        },
        {
          'title': 'Tanggung Jawab Profesional di Bidang TI',
          'duration': '13:00'
        },
      ],
      'assignments': [
        {
          'title': 'Studi Kasus Etika Profesi',
          'dueDate': 'Tenggat: 5 Nov 2025',
          'status': 'Belum Dikumpulkan'
        },
      ],
    },
    {
      'name': 'Magang',
      'icon': Icons.work,
      'color': Color(0xFFF1C40F), // Yellow/Gold
      'materials': [
        'Panduan-Pelaksanaan-Magang.pdf',
        'Template-Laporan-Mingguan.docx',
      ],
      'videos': [
        {'title': 'Cara Menyusun Logbook Harian Magang', 'duration': '08:00'},
        {
          'title': 'Tips Beradaptasi di Lingkungan Kerja IT',
          'duration': '10:30'
        },
      ],
      'assignments': [
        {
          'title': 'Laporan Akhir Magang',
          'dueDate': 'Tenggat: 30 Des 2025',
          'status': 'Belum Dikumpulkan'
        },
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
            course['videos'],
            course['assignments'],
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
    List<Map<String, dynamic>> videos, // Terima data videos
    List<Map<String, dynamic>> assignments, // Terima data assignments
  ) {
    return MouseRegion(
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
                videos: videos,
                assignments:
                    assignments, // Kirim data assignments ke halaman detail
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