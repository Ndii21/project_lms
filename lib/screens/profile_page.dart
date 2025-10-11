import 'package:flutter/material.dart';
import 'login_page.dart';

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

  // 1. Data Akademik (Semester 1-4 Complete, S5 Current)
  final List<Map<String, dynamic>> _akademikData = const [
    {
      'semester': 1,
      'ip': 3.88,
      'matkul': [
        {
          'no': 1,
          'kode': 'MK101',
          'nama': 'Kepemimpinan & keterampilan interpersonal',
          'sks': 3,
          'nilai_angka': 90,
          'nilai_huruf': 'A'
        },
        {
          'no': 2,
          'kode': 'MK102',
          'nama': 'Aljabar linear',
          'sks': 3,
          'nilai_angka': 88,
          'nilai_huruf': 'A-'
        },
        {
          'no': 3,
          'kode': 'MK103',
          'nama': 'Pengantar teknologi informasi',
          'sks': 3,
          'nilai_angka': 91,
          'nilai_huruf': 'A'
        },
        {
          'no': 4,
          'kode': 'MK104',
          'nama': 'Pancasila',
          'sks': 2,
          'nilai_angka': 87,
          'nilai_huruf': 'A-'
        },
        {
          'no': 5,
          'kode': 'MK105',
          'nama': 'Bahasa inggris umum',
          'sks': 2,
          'nilai_angka': 85,
          'nilai_huruf': 'A-'
        },
        {
          'no': 6,
          'kode': 'MK106',
          'nama': 'Pengenalan algoritma dan pemrograman',
          'sks': 4,
          'nilai_angka': 89,
          'nilai_huruf': 'A-'
        },
        {
          'no': 7,
          'kode': 'MK107',
          'nama': 'Pendidikan agama',
          'sks': 2,
          'nilai_angka': 92,
          'nilai_huruf': 'A'
        },
        {
          'no': 8,
          'kode': 'MK108',
          'nama': 'Budaya bangsa',
          'sks': 3,
          'nilai_angka': 86,
          'nilai_huruf': 'A-'
        },
      ],
    },
    {
      'semester': 2,
      'ip': 3.75,
      'matkul': [
        {
          'no': 1,
          'kode': 'MK201',
          'nama': 'E-business',
          'sks': 3,
          'nilai_angka': 85,
          'nilai_huruf': 'A-'
        },
        {
          'no': 2,
          'kode': 'MK202',
          'nama': 'Bahasa inggris untuk presentasi bisnis',
          'sks': 2,
          'nilai_angka': 83,
          'nilai_huruf': 'B+'
        },
        {
          'no': 3,
          'kode': 'MK203',
          'nama': 'Bahasa indonesia',
          'sks': 2,
          'nilai_angka': 86,
          'nilai_huruf': 'A-'
        },
        {
          'no': 4,
          'kode': 'MK204',
          'nama': 'Pengenalan basis data',
          'sks': 4,
          'nilai_angka': 89,
          'nilai_huruf': 'A-'
        },
        {
          'no': 5,
          'kode': 'MK205',
          'nama': 'Konsep sistem informasi',
          'sks': 3,
          'nilai_angka': 84,
          'nilai_huruf': 'B+'
        },
        {
          'no': 6,
          'kode': 'MK206',
          'nama': 'Kewarganegaraan',
          'sks': 2,
          'nilai_angka': 87,
          'nilai_huruf': 'A-'
        },
        {
          'no': 7,
          'kode': 'MK207',
          'nama': 'Algoritma dan struktur data',
          'sks': 4,
          'nilai_angka': 90,
          'nilai_huruf': 'A'
        },
      ],
    },
    {
      'semester': 3,
      'ip': 3.80,
      'matkul': [
        {
          'no': 1,
          'kode': 'MK301',
          'nama': 'Basis data lanjut',
          'sks': 4,
          'nilai_angka': 88,
          'nilai_huruf': 'A-'
        },
        {
          'no': 2,
          'kode': 'MK302',
          'nama': 'Sistem informasi akuntansi dan keuangan',
          'sks': 3,
          'nilai_angka': 85,
          'nilai_huruf': 'A-'
        },
        {
          'no': 3,
          'kode': 'MK303',
          'nama': 'Statistika & probabilitas',
          'sks': 3,
          'nilai_angka': 86,
          'nilai_huruf': 'A-'
        },
        {
          'no': 4,
          'kode': 'MK304',
          'nama': 'Sistem operasi',
          'sks': 4,
          'nilai_angka': 89,
          'nilai_huruf': 'A-'
        },
        {
          'no': 5,
          'kode': 'MK305',
          'nama': 'Fisika dasar',
          'sks': 3,
          'nilai_angka': 84,
          'nilai_huruf': 'B+'
        },
        {
          'no': 6,
          'kode': 'MK306',
          'nama': 'Organisasi dan arsitektur komputer',
          'sks': 3,
          'nilai_angka': 87,
          'nilai_huruf': 'A-'
        },
        {
          'no': 7,
          'kode': 'MK307',
          'nama': 'Analisis proses bisnis',
          'sks': 3,
          'nilai_angka': 90,
          'nilai_huruf': 'A'
        },
      ],
    },
    {
      'semester': 4,
      'ip': 3.72,
      'matkul': [
        {
          'no': 1,
          'kode': 'MK401',
          'nama': 'Rekayasa perangkat lunak',
          'sks': 4,
          'nilai_angka': 86,
          'nilai_huruf': 'A-'
        },
        {
          'no': 2,
          'kode': 'MK402',
          'nama': 'Data warehouse',
          'sks': 3,
          'nilai_angka': 83,
          'nilai_huruf': 'B+'
        },
        {
          'no': 3,
          'kode': 'MK403',
          'nama': 'Pemrograman berbasis web',
          'sks': 4,
          'nilai_angka': 88,
          'nilai_huruf': 'A-'
        },
        {
          'no': 4,
          'kode': 'MK404',
          'nama': 'Manajemen sistem informasi',
          'sks': 3,
          'nilai_angka': 84,
          'nilai_huruf': 'B+'
        },
        {
          'no': 5,
          'kode': 'MK405',
          'nama': 'Jaringan dan keamanan sistem',
          'sks': 4,
          'nilai_angka': 89,
          'nilai_huruf': 'A-'
        },
        {
          'no': 6,
          'kode': 'MK406',
          'nama': 'Pemrograman berorientasi objek',
          'sks': 4,
          'nilai_angka': 90,
          'nilai_huruf': 'A'
        },
        {
          'no': 7,
          'kode': 'MK407',
          'nama': 'Analisa dan perancangan sistem informasi',
          'sks': 3,
          'nilai_angka': 87,
          'nilai_huruf': 'A-'
        },
      ],
    },
  ];

  // 3. Data Kurikulum (Semester 1-8 Full)
  final List<Map<String, dynamic>> _kurikulumData = const [
    {
      'semester': 1,
      'matkul': [
        {
          'no': 1,
          'kode': 'MK101',
          'nama': 'Kepemimpinan & keterampilan interpersonal',
          'sks': 3
        },
        {'no': 2, 'kode': 'MK102', 'nama': 'Aljabar linear', 'sks': 3},
        {
          'no': 3,
          'kode': 'MK103',
          'nama': 'Pengantar teknologi informasi',
          'sks': 3
        },
        {'no': 4, 'kode': 'MK104', 'nama': 'Pancasila', 'sks': 2},
        {'no': 5, 'kode': 'MK105', 'nama': 'Bahasa inggris umum', 'sks': 2},
        {
          'no': 6,
          'kode': 'MK106',
          'nama': 'Pengenalan algoritma dan pemrograman',
          'sks': 4
        },
        {'no': 7, 'kode': 'MK107', 'nama': 'Pendidikan agama', 'sks': 2},
        {'no': 8, 'kode': 'MK108', 'nama': 'Budaya bangsa', 'sks': 3},
      ],
    },
    {
      'semester': 2,
      'matkul': [
        {'no': 1, 'kode': 'MK201', 'nama': 'E-business', 'sks': 3},
        {
          'no': 2,
          'kode': 'MK202',
          'nama': 'Bahasa inggris untuk presentasi bisnis',
          'sks': 2
        },
        {'no': 3, 'kode': 'MK203', 'nama': 'Bahasa indonesia', 'sks': 2},
        {'no': 4, 'kode': 'MK204', 'nama': 'Pengenalan basis data', 'sks': 4},
        {'no': 5, 'kode': 'MK205', 'nama': 'Konsep sistem informasi', 'sks': 3},
        {'no': 6, 'kode': 'MK206', 'nama': 'Kewarganegaraan', 'sks': 2},
        {
          'no': 7,
          'kode': 'MK207',
          'nama': 'Algoritma dan struktur data',
          'sks': 4
        },
      ],
    },
    {
      'semester': 3,
      'matkul': [
        {'no': 1, 'kode': 'MK301', 'nama': 'Basis data lanjut', 'sks': 4},
        {
          'no': 2,
          'kode': 'MK302',
          'nama': 'Sistem informasi akuntansi dan keuangan',
          'sks': 3
        },
        {
          'no': 3,
          'kode': 'MK303',
          'nama': 'Statistika & probabilitas',
          'sks': 3
        },
        {'no': 4, 'kode': 'MK304', 'nama': 'Sistem operasi', 'sks': 4},
        {'no': 5, 'kode': 'MK305', 'nama': 'Fisika dasar', 'sks': 3},
        {
          'no': 6,
          'kode': 'MK306',
          'nama': 'Organisasi dan arsitektur komputer',
          'sks': 3
        },
        {'no': 7, 'kode': 'MK307', 'nama': 'Analisis proses bisnis', 'sks': 3},
      ],
    },
    {
      'semester': 4,
      'matkul': [
        {
          'no': 1,
          'kode': 'MK401',
          'nama': 'Rekayasa perangkat lunak',
          'sks': 4
        },
        {'no': 2, 'kode': 'MK402', 'nama': 'Data warehouse', 'sks': 3},
        {
          'no': 3,
          'kode': 'MK403',
          'nama': 'Pemrograman berbasis web',
          'sks': 4
        },
        {
          'no': 4,
          'kode': 'MK404',
          'nama': 'Manajemen sistem informasi',
          'sks': 3
        },
        {
          'no': 5,
          'kode': 'MK405',
          'nama': 'Jaringan dan keamanan sistem',
          'sks': 4
        },
        {
          'no': 6,
          'kode': 'MK406',
          'nama': 'Pemrograman berorientasi objek',
          'sks': 4
        },
        {
          'no': 7,
          'kode': 'MK407',
          'nama': 'Analisa dan perancangan sistem informasi',
          'sks': 3
        },
      ],
    },
    {
      'semester': 5,
      'matkul': [
        {
          'no': 1,
          'kode': 'MK501',
          'nama': 'Pemrograman perangkat bergerak',
          'sks': 4
        },
        {
          'no': 2,
          'kode': 'MK502',
          'nama': 'Perencanaan strategi sistem informasi',
          'sks': 3
        },
        {
          'no': 3,
          'kode': 'MK503',
          'nama': 'Sistem enterprise resource planning',
          'sks': 3
        },
        {'no': 4, 'kode': 'MK504', 'nama': 'Metodologi penelitian', 'sks': 3},
        {
          'no': 5,
          'kode': 'MK505',
          'nama': 'Testing dan implementasi sistem',
          'sks': 4
        },
        {'no': 6, 'kode': 'MK506', 'nama': 'Riset operasi', 'sks': 3},
        {'no': 7, 'kode': 'MK507', 'nama': 'Etika profesi', 'sks': 2},
        {'no': 8, 'kode': 'MK508', 'nama': 'Magang', 'sks': 3},
      ],
    },
    {
      'semester': 6,
      'matkul': [
        {'no': 1, 'kode': 'MK601', 'nama': 'Sistem cerdas', 'sks': 3},
        {
          'no': 2,
          'kode': 'MK602',
          'nama': 'Interaksi manusia dan komputer',
          'sks': 3
        },
        {'no': 3, 'kode': 'MK603', 'nama': 'Technopreneurship', 'sks': 3},
        {'no': 4, 'kode': 'MK604', 'nama': 'Teknik data mining', 'sks': 3},
        {
          'no': 5,
          'kode': 'MK605',
          'nama': 'Sistem pendukung keputusan',
          'sks': 3
        },
        {
          'no': 6,
          'kode': 'MK606',
          'nama': 'Computing assisted audit tools & techniques',
          'sks': 3
        },
        {
          'no': 7,
          'kode': 'MK607',
          'nama': 'Information system audit',
          'sks': 3
        },
        {'no': 8, 'kode': 'MK608', 'nama': 'Digital and new media', 'sks': 3},
        {'no': 9, 'kode': 'MK609', 'nama': 'E-business design', 'sks': 3},
        {
          'no': 10,
          'kode': 'MK610',
          'nama': 'Developing business applications',
          'sks': 3
        },
        {
          'no': 11,
          'kode': 'MK611',
          'nama': 'Web services applications',
          'sks': 3
        },
        {
          'no': 12,
          'kode': 'MK612',
          'nama': 'Komputasi awan dan blockchain',
          'sks': 3
        },
        {'no': 13, 'kode': 'MK613', 'nama': 'Karya tulis ilmiah', 'sks': 3},
        {'no': 14, 'kode': 'MK614', 'nama': 'KKN', 'sks': 3},
      ],
    },
    {
      'semester': 7,
      'matkul': [
        {
          'no': 1,
          'kode': 'MK701',
          'nama': 'Pemrograman animasi dan multimedia',
          'sks': 3
        },
        {'no': 2, 'kode': 'MK702', 'nama': 'Hukum paten dan merk', 'sks': 2},
        {
          'no': 3,
          'kode': 'MK703',
          'nama': 'Kapita selekta ilmu komputer',
          'sks': 3
        },
        {'no': 4, 'kode': 'MK704', 'nama': 'Text mining', 'sks': 3},
        {'no': 5, 'kode': 'MK705', 'nama': 'Business web solution', 'sks': 3},
        {'no': 6, 'kode': 'MK706', 'nama': 'Analisis big data', 'sks': 3},
        {'no': 7, 'kode': 'MK707', 'nama': 'IT in financial market', 'sks': 3},
        {'no': 8, 'kode': 'MK708', 'nama': 'IT governance', 'sks': 3},
        {
          'no': 9,
          'kode': 'MK709',
          'nama': 'Integrasi aplikasi korporasi',
          'sks': 3
        },
        {
          'no': 10,
          'kode': 'MK710',
          'nama': 'Teknologi opensource dan terbaru',
          'sks': 3
        },
      ],
    },
    {
      'semester': 8,
      'matkul': [
        {'no': 1, 'kode': 'MK801', 'nama': 'Skripsi', 'sks': 6},
      ],
    },
  ];

  // 4. Data KRS (Semester 5 Active)
  final List<Map<String, String>> _krsData = const [
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

  // Data Registrasi (Semester 1-5 Complete)
  final List<Map<String, dynamic>> _registrasiData = const [
    {
      'semester': 1,
      'jumlah': 'Rp 5.000.000',
      'tanggal_bayar': '10 Juli 2023',
      'metode': 'VA',
      'lunas': true
    },
    {
      'semester': 2,
      'jumlah': 'Rp 5.000.000',
      'tanggal_bayar': '2 Februari 2024',
      'metode': 'VA',
      'lunas': true
    },
    {
      'semester': 3,
      'jumlah': 'Rp 5.000.000',
      'tanggal_bayar': '10 Agustus 2024',
      'metode': 'VA',
      'lunas': true
    },
    {
      'semester': 4,
      'jumlah': 'Rp 5.000.000',
      'tanggal_bayar': '10 Februari 2025',
      'metode': 'VA',
      'lunas': true
    },
    {
      'semester': 5,
      'jumlah': 'Rp 5.000.000',
      'tanggal_bayar': '30 Juni 2025',
      'metode': 'VA',
      'lunas': true
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
    // Data biodata
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
              headingRowColor: WidgetStateProperty.all(const Color(0xFFF0F4F7)),
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
                              ? const Color(0xFFE67E22)
                              : (isFutureSemester
                                  ? const Color(0xFFE74C3C)
                                  : const Color(0xFF27AE60)),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          isCurrentSemester
                              ? 'Saat Ini'
                              : (isFutureSemester
                                  ? 'Belum Ditempuh'
                                  : 'Sudah Ditempuh'),
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
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
                // Dummy action untuk cetak KRS
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
        boxShadow: const [
          BoxShadow(
            color: Color(0xFFE0E0E0),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 2),
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
              color: const Color(0xFF27AE60),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              status,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Colors.white,
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

  // Widget daftar mata kuliah dalam list
  Widget _buildCourseCard(
      String courseName, String courseCode, String sks, String? grade) {
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
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF2C3E50),
                ),
              ),
              Text(
                sks,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF2C3E50),
                ),
              ),
            ],
          ),
          if (grade != null) const SizedBox(height: 4),
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
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Color(0xFFECF0F1)),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
                (Route<dynamic> route) => false,
              );
            },
          ),
        ],
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
                    backgroundImage: AssetImage('lib/assets/images/bale.jpg'),
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
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFFECF0F1),
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
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFFE0E0E0),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 2),
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
