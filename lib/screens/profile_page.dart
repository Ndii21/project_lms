import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final String userName;
  final String userNim;

  const ProfilePage({
    Key? key,
    required this.userName,
    required this.userNim,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Index untuk mengontrol halaman mana yang aktif
  int _selectedIndex = 0;

  // Helper untuk menghasilkan mock data mata kuliah dengan nilai
  List<Map<String, dynamic>> _generateSemesterCourses(
      int semester, List<String> subjects) {
    int baseScore = 90 - (semester - 1) * 2;
    String baseGrade = (semester < 3) ? 'A' : 'A-';

    return List.generate(subjects.length, (i) {
      int sks;
      if (subjects[i].toLowerCase().contains('inggris') ||
          subjects[i].toLowerCase().contains('pancasila') ||
          subjects[i].toLowerCase().contains('kewarganegaraan') ||
          subjects[i].toLowerCase().contains('agama') ||
          subjects[i].toLowerCase().contains('etika') ||
          subjects[i].toLowerCase().contains('hukum')) {
        sks = 2; // Reduce SKS for non-core/general subjects
      } else if (subjects[i].toLowerCase().contains('pemrograman') ||
          subjects[i].toLowerCase().contains('basis data') ||
          subjects[i].toLowerCase().contains('struktur data') ||
          subjects[i].toLowerCase().contains('rekayasa') ||
          subjects[i].toLowerCase().contains('jaringan') ||
          subjects[i].toLowerCase().contains('testing')) {
        sks = 4; 
      } else if (subjects[i].toLowerCase().contains('skripsi')) {
        sks = 6;
      } else {
        sks = 3;
      }
      if (subjects[i].toLowerCase().contains('magang') ||
          subjects[i].toLowerCase().contains('kkn')) sks = 3;

      int score = baseScore + (i % 3);
      String grade = baseGrade;
      if (score >= 90)
        grade = 'A';
      else if (score >= 85)
        grade = 'A-';
      else if (score >= 80) grade = 'B+';

      return {
        'no': i + 1,
        'kode': 'MK${semester}0${i + 1}',
        'nama': subjects[i],
        'sks': sks,
        'nilai_angka': score,
        'nilai_huruf': grade,
      };
    });
  }

  final Map<int, List<String>> _allCourseData = const {
    1: [
      'Kepemimpinan & keterampilan interpersonal',
      'Aljabar linear',
      'Pengantar teknologi informasi',
      'Pancasila',
      'Bahasa inggris umum',
      'Pengenalan algoritma dan pemrograman',
      'Pendidikan agama',
      'Budaya bangsa',
    ],
    2: [
      'E-business',
      'Bahasa inggris untuk presentasi bisnis',
      'Bahasa indonesia',
      'Pengenalan basis data',
      'Konsep sistem informasi',
      'Kewarganegaraan',
      'Algoritma dan struktur data',
    ],
    3: [
      'Basis data lanjut',
      'Sistem informasi akuntansi dan keuangan',
      'Statistika & probabilitas',
      'Sistem operasi',
      'Fisika dasar',
      'Organisasi dan arsitektur komputer',
      'Analisis proses bisnis',
    ],
    4: [
      'Rekayasa perangkat lunak',
      'Data warehouse',
      'Pemrograman berbasis web',
      'Manajemen sistem informasi',
      'Jaringan dan keamanan sistem',
      'Pemrograman berorientasi objek',
      'Analisa dan perancangan sistem informasi',
    ],
    5: [
      'Pemrograman perangkat bergerak',
      'Perencanaan strategi sistem informasi',
      'Sistem enterprise resource planning',
      'Metodologi penelitian',
      'Testing dan implementasi sistem',
      'Riset operasi',
      'Etika profesi',
      'Magang',
    ],
    6: [
      'Sistem cerdas',
      'Interaksi manusia dan komputer',
      'Technopreneurship',
      'Teknik data mining',
      'Sistem pendukung keputusan',
      'Computing assisted audit tools & techniques',
      'Information system audit',
      'Digital and new media',
      'E-business design',
      'Developing business applications',
      'Web services applications',
      'Komputasi awan dan blockchain',
      'Karya tulis ilmiah',
      'KKN',
    ],
    7: [
      'Pemrograman animasi dan multimedia',
      'Hukum paten dan merk',
      'Kapita selekta ilmu komputer',
      'Text mining',
      'Business web solution',
      'Analisis big data',
      'IT in financial market',
      'IT governance',
      'Integrasi aplikasi korporasi',
      'Teknologi opensource dan terbaru',
    ],
    8: ['Skripsi'],
  };

  // 1. Data Akademik (Semester 1-4 Complete, S5 Current)
  late final List<Map<String, dynamic>> _akademikData = [
    {
      'semester': 1,
      'ip': 3.88,
      'matkul': _generateSemesterCourses(1, _allCourseData[1]!),
    },
    {
      'semester': 2,
      'ip': 3.75,
      'matkul': _generateSemesterCourses(2, _allCourseData[2]!),
    },
    {
      'semester': 3,
      'ip': 3.80,
      'matkul': _generateSemesterCourses(3, _allCourseData[3]!),
    },
    {
      'semester': 4,
      'ip': 3.72,
      'matkul': _generateSemesterCourses(4, _allCourseData[4]!),
    },
  ];

  // 2. Data Registrasi (Semester 1-5 Complete)
  final List<Map<String, dynamic>> _registrasiData = const [
    {
      'semester': 1,
      'jumlah': 'Rp 5.000.000',
      'tanggal_bayar': '20 Jan 2021',
      'metode': 'VA',
      'lunas': true
    },
    {
      'semester': 2,
      'jumlah': 'Rp 5.000.000',
      'tanggal_bayar': '25 Jul 2021',
      'metode': 'VA',
      'lunas': true
    },
    {
      'semester': 3,
      'jumlah': 'Rp 5.500.000',
      'tanggal_bayar': '21 Jan 2022',
      'metode': 'VA',
      'lunas': true
    },
    {
      'semester': 4,
      'jumlah': 'Rp 5.500.000',
      'tanggal_bayar': '23 Jul 2022',
      'metode': 'VA',
      'lunas': true
    },
    {
      'semester': 5,
      'jumlah': 'Rp 6.000.000',
      'tanggal_bayar': '22 Jan 2023',
      'metode': 'VA',
      'lunas': true
    },
  ];

  // 3. Data Kurikulum (Semester 1-8 Full)
  late final List<Map<String, dynamic>> _kurikulumData = [
    for (int s = 1; s <= 8; s++)
      {
        'semester': s,
        'matkul': [
          for (int i = 0; i < _allCourseData[s]!.length; i++)
            {
              'no': i + 1,
              'kode': 'MK${s}0${i + 1}',
              'nama': _allCourseData[s]![i],
              // Recalculate SKS here (simplified, to avoid calling _generateSemesterCourses multiple times)
              'sks': [6].contains(s)
                  ? 3
                  : (s == 8
                      ? 6
                      : (_allCourseData[s]![i]
                                  .toLowerCase()
                                  .contains('inggris') ||
                              _allCourseData[s]![i]
                                  .toLowerCase()
                                  .contains('pancasila') ||
                              _allCourseData[s]![i]
                                  .toLowerCase()
                                  .contains('kewarganegaraan') ||
                              _allCourseData[s]![i]
                                  .toLowerCase()
                                  .contains('agama') ||
                              _allCourseData[s]![i]
                                  .toLowerCase()
                                  .contains('etika') ||
                              _allCourseData[s]![i]
                                  .toLowerCase()
                                  .contains('hukum')
                          ? 2
                          : (_allCourseData[s]![i]
                                      .toLowerCase()
                                      .contains('pemrograman') ||
                                  _allCourseData[s]![i]
                                      .toLowerCase()
                                      .contains('basis data') ||
                                  _allCourseData[s]![i]
                                      .toLowerCase()
                                      .contains('struktur data') ||
                                  _allCourseData[s]![i]
                                      .toLowerCase()
                                      .contains('rekayasa') ||
                                  _allCourseData[s]![i]
                                      .toLowerCase()
                                      .contains('jaringan') ||
                                  _allCourseData[s]![i]
                                      .toLowerCase()
                                      .contains('testing')
                              ? 4
                              : 3))),
            },
        ],
      },
  ];

  // 4. Data KRS (Semester 5 Active)
  final List<Map<String, String>> _krsData = const [
    // Courses for Semester 5
    {
      'subject': 'Pemrograman perangkat bergerak',
      'time': '10:00 - 12:00',
      'room': 'Lab Komputer 2',
      'lecturer': 'Dr. Sarah Setiadi',
      'status': 'Disetujui'
    },
    {
      'subject': 'Perencanaan strategi sistem informasi',
      'time': '08:00 - 10:00',
      'room': 'Ruang C401',
      'lecturer': 'Ir. Budi Santoso, MBA',
      'status': 'Disetujui'
    },
    {
      'subject': 'Sistem enterprise resource planning',
      'time': '13:00 - 15:00',
      'room': 'Ruang B301',
      'lecturer': 'M. Rizki Pratama, S.Kom',
      'status': 'Disetujui'
    },
    {
      'subject': 'Metodologi penelitian',
      'time': '15:00 - 17:00',
      'room': 'Ruang A205',
      'lecturer': 'Prof. Dr. Andi Wijaya',
      'status': 'Disetujui'
    },
    {
      'subject': 'Testing dan implementasi sistem',
      'time': '09:00 - 11:00',
      'room': 'Lab Komputer 1',
      'lecturer': 'Dr. Rina Wati',
      'status': 'Disetujui'
    },
    {
      'subject': 'Riset operasi',
      'time': '12:00 - 14:00',
      'room': 'Ruang D203',
      'lecturer': 'Dr. Lina Marlina',
      'status': 'Disetujui'
    },
    {
      'subject': 'Etika profesi',
      'time': '10:30 - 12:30',
      'room': 'Ruang C201',
      'lecturer': 'Drs. Hadi Susanto',
      'status': 'Disetujui'
    },
    {
      'subject': 'Magang',
      'time': '08:00 - 16:00',
      'room': 'Kantor',
      'lecturer': 'Supervisor Magang',
      'status': 'Disetujui'
    },
  ];

  // Widget untuk menampilkan konten berdasarkan tombol yang dipilih
  Widget _buildContent() {
    switch (_selectedIndex) {
      case 0:
        return _buildBiodataSection();
      case 1:
        return _buildAkademikSection();
      case 2:
        return _buildRegistrasiSection();
      case 3:
        return _buildKurikulumSection();
      case 4:
        return _buildKrsSection();
      default:
        return Container();
    }
  }

  // --- Widget untuk masing-masing halaman ---

  Widget _buildBiodataSection() {
    // Data biodata yang dinamis berdasarkan input login
    final Map<String, dynamic> biodata = {
      'Nama': widget.userName,
      'NIM': widget.userNim,
      'Agama': 'Islam',
      'Status Kawin': 'Belum Kawin',
      'Jenis Kelamin': 'Laki-laki',
      'Tgl Lahir': '21 Mei 2005',
      'Alamat': 'Jl. Argasoka, Kuningan, Jawa Barat',
      'No HP': '085889336609',
    };

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Data Diri Mahasiswa',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C3E50),
            ),
          ),
          const SizedBox(height: 12),
          ...biodata.entries
              .map((entry) => _buildDetailRow(entry.key, entry.value))
              .toList(),
        ],
      ),
    );
  }

  Widget _buildAkademikSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Riwayat Akademik (s/d Semester 4)',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C3E50),
            ),
          ),
          const SizedBox(height: 12),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _akademikData.length,
            itemBuilder: (context, index) {
              final semesterData = _akademikData[index];
              return Card(
                elevation: 2,
                margin: const EdgeInsets.only(bottom: 16),
                child: ExpansionTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Semester ${semesterData['semester']}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3498DB),
                        ),
                      ),
                      Text(
                        'IP: ${semesterData['ip']}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF27AE60),
                        ),
                      ),
                    ],
                  ),
                  children: semesterData['matkul'].map<Widget>((matkul) {
                    return _buildCourseCard(
                      matkul['nama'],
                      matkul['kode'],
                      'SKS: ${matkul['sks']}',
                      'Nilai: ${matkul['nilai_huruf']} (${matkul['nilai_angka']})',
                    );
                  }).toList(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildRegistrasiSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Riwayat Registrasi (s/d Semester 5)',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C3E50),
            ),
          ),
          const SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              headingRowColor:
                  MaterialStateProperty.all(const Color(0xFFF0F4F7)),
              columns: const [
                DataColumn(label: Text('Semester')),
                DataColumn(label: Text('Jumlah')),
                DataColumn(label: Text('Tgl Bayar')),
                DataColumn(label: Text('Metode')),
                DataColumn(label: Text('Lunas?')),
              ],
              rows: _registrasiData.map<DataRow>((reg) {
                return DataRow(
                  cells: [
                    DataCell(Text(reg['semester'].toString())),
                    DataCell(Text(reg['jumlah'])),
                    DataCell(Text(reg['tanggal_bayar'])),
                    DataCell(Text(reg['metode'])),
                    DataCell(Icon(
                        reg['lunas'] ? Icons.check_circle : Icons.cancel,
                        color: reg['lunas'] ? Colors.green : Colors.red)),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKurikulumSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Daftar Kurikulum (Semester 1 s/d 8)',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C3E50),
            ),
          ),
          const SizedBox(height: 12),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _kurikulumData.length,
            itemBuilder: (context, index) {
              final semesterData = _kurikulumData[index];
              final bool isCurrentSemester = semesterData['semester'] == 5;
              final bool isFutureSemester = semesterData['semester'] > 5;

              return Card(
                elevation: 2,
                margin: const EdgeInsets.only(bottom: 16),
                child: ExpansionTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Semester ${semesterData['semester']}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3498DB),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: isCurrentSemester
                              ? const Color(0xFFE67E22).withOpacity(0.1)
                              : (isFutureSemester
                                  ? const Color(0xFFE74C3C).withOpacity(0.1)
                                  : const Color(0xFF27AE60).withOpacity(0.1)),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          isCurrentSemester
                              ? 'Saat Ini'
                              : (isFutureSemester ? 'Belum Ditempuh' : 'Sudah Ditempuh'),
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: isCurrentSemester
                                ? const Color(0xFFE67E22)
                                : (isFutureSemester
                                    ? const Color(0xFFE74C3C)
                                    : const Color(0xFF27AE60)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  children: semesterData['matkul'].map<Widget>((matkul) {
                    return _buildCourseCard(
                      matkul['nama'],
                      matkul['kode'],
                      'SKS: ${matkul['sks']}',
                      null, // No grade for kurikulum
                    );
                  }).toList(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  // Widget untuk menampilkan menu KRS
  Widget _buildKrsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Kartu Rencana Studi (KRS) Semester 5',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C3E50),
            ),
          ),
          const SizedBox(height: 16),
          // List mata kuliah di KRS
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _krsData.length,
            itemBuilder: (context, index) {
              final krs = _krsData[index];
              return _buildKrsCard(
                krs['subject']!,
                krs['time']!,
                krs['lecturer']!,
                krs['status']!,
              );
            },
          ),
          const SizedBox(height: 24),
          // Tombol Cetak KRS
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton.icon(
              onPressed: () {
                // Dummy function for "Cetak KRS"
              },
              icon: const Icon(Icons.picture_as_pdf, color: Colors.white),
              label: const Text(
                'Cetak KRS (PDF)',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE74C3C),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk kartu KRS
  Widget _buildKrsCard(
      String subject, String time, String lecturer, String status) {
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
          Text(
            subject,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C3E50),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.access_time, size: 16, color: Color(0xFF3498DB)),
              const SizedBox(width: 8),
              Text(
                time,
                style: const TextStyle(fontSize: 14, color: Color(0xFF2C3E50)),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.person, size: 16, color: Color(0xFF3498DB)),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  lecturer,
                  style:
                      const TextStyle(fontSize: 14, color: Color(0xFF2C3E50)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFF27AE60).withOpacity(0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              status,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Color(0xFF27AE60),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget pembantu untuk baris detail biodata
  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              '$label:',
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Color(0xFF2C3E50)),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(color: Color(0xFF2C3E50)),
            ),
          ),
        ],
      ),
    );
  }
  
  // Widget pembantu untuk membangun tombol profil
  Widget _buildProfileButton(int index, String label, IconData icon) {
    final bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF3498DB) : Colors.transparent,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : const Color(0xFF2C3E50),
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                color: isSelected ? Colors.white : const Color(0xFF2C3E50),
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget baru untuk menampilkan daftar mata kuliah dalam list yang rapi
  Widget _buildCourseCard(String courseName, String courseCode, String sks, String? grade) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0, left: 16.0, right: 16.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F4F7),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            courseName,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2C3E50),
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                courseCode,
                style: TextStyle(
                  fontSize: 12,
                  color: const Color(0xFF2C3E50).withOpacity(0.7),
                ),
              ),
              Text(
                sks,
                style: TextStyle(
                  fontSize: 12,
                  color: const Color(0xFF2C3E50).withOpacity(0.7),
                ),
              ),
            ],
          ),
          if (grade != null)
            const SizedBox(height: 4),
          if (grade != null)
            Text(
              grade,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Color(0xFF27AE60),
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECF0F1),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2C3E50),
        elevation: 0,
        title: const Text(
          'Profil',
          style: TextStyle(color: Color(0xFFECF0F1)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header dengan foto profil
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 40),
              decoration: const BoxDecoration(
                color: Color(0xFF2C3E50),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('lib/assets/images/profil.jpg'),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    widget.userName,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFECF0F1),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.userNim,
                    style: TextStyle(
                      fontSize: 16,
                      color: const Color(0xFFECF0F1).withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ),

            // Tombol navigasi untuk menu profil
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildProfileButton(0, 'Biodata', Icons.person),
                  _buildProfileButton(1, 'Akademik', Icons.school),
                  _buildProfileButton(2, 'Registrasi', Icons.payment),
                  _buildProfileButton(3, 'Kurikulum', Icons.menu_book),
                  _buildProfileButton(4, 'KRS', Icons.assignment),
                ],
              ),
            ),

            // Konten yang berubah
            _buildContent(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}