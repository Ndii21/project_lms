import 'package:flutter/material.dart';

// Ubah StatelessWidget menjadi StatefulWidget
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

  // Data dummy untuk masing-masing halaman
  final List<Map<String, dynamic>> _akademikData = [
    {
      'semester': 1,
      'ip': 3.85,
      'matkul': [
        {
          'no': 1,
          'kode': 'MK101',
          'nama': 'Pengantar Informatika',
          'sks': 3,
          'nilai_angka': 90,
          'nilai_huruf': 'A'
        },
        {
          'no': 2,
          'kode': 'MK102',
          'nama': 'Algoritma dan Pemrograman',
          'sks': 4,
          'nilai_angka': 85,
          'nilai_huruf': 'A-'
        },
        {
          'no': 3,
          'kode': 'MK103',
          'nama': 'Matematika Dasar',
          'sks': 3,
          'nilai_angka': 88,
          'nilai_huruf': 'A'
        },
      ]
    },
    {
      'semester': 2,
      'ip': 3.70,
      'matkul': [
        {
          'no': 1,
          'kode': 'MK201',
          'nama': 'Struktur Data',
          'sks': 4,
          'nilai_angka': 80,
          'nilai_huruf': 'B+'
        },
        {
          'no': 2,
          'kode': 'MK202',
          'nama': 'Basis Data',
          'sks': 4,
          'nilai_angka': 87,
          'nilai_huruf': 'A'
        },
        {
          'no': 3,
          'kode': 'MK203',
          'nama': 'Jaringan Komputer',
          'sks': 3,
          'nilai_angka': 82,
          'nilai_huruf': 'B+'
        },
      ]
    },
    {
      'semester': 3,
      'ip': 3.92,
      'matkul': [
        {
          'no': 1,
          'kode': 'MK301',
          'nama': 'Pemrograman Berorientasi Objek',
          'sks': 4,
          'nilai_angka': 95,
          'nilai_huruf': 'A'
        },
        {
          'no': 2,
          'kode': 'MK302',
          'nama': 'Sistem Operasi',
          'sks': 3,
          'nilai_angka': 89,
          'nilai_huruf': 'A-'
        },
        {
          'no': 3,
          'kode': 'MK303',
          'nama': 'Pemrograman Web',
          'sks': 4,
          'nilai_angka': 91,
          'nilai_huruf': 'A'
        },
      ]
    },
    {
      'semester': 4,
      'ip': 3.65,
      'matkul': [
        {
          'no': 1,
          'kode': 'MK401',
          'nama': 'Kecerdasan Buatan',
          'sks': 3,
          'nilai_angka': 80,
          'nilai_huruf': 'B+'
        },
        {
          'no': 2,
          'kode': 'MK402',
          'nama': 'Analisis dan Perancangan Sistem',
          'sks': 4,
          'nilai_angka': 85,
          'nilai_huruf': 'A-'
        },
        {
          'no': 3,
          'kode': 'MK403',
          'nama': 'Interaksi Manusia dan Komputer',
          'sks': 3,
          'nilai_angka': 78,
          'nilai_huruf': 'B'
        },
      ]
    },
    {
      'semester': 5,
      'ip': 3.80,
      'matkul': [
        {
          'no': 1,
          'kode': 'MK501',
          'nama': 'Pemrograman Mobile',
          'sks': 4,
          'nilai_angka': 88,
          'nilai_huruf': 'A'
        },
        {
          'no': 2,
          'kode': 'MK502',
          'nama': 'Data Mining',
          'sks': 3,
          'nilai_angka': 85,
          'nilai_huruf': 'A-'
        },
        {
          'no': 3,
          'kode': 'MK503',
          'nama': 'Manajemen Proyek TI',
          'sks': 3,
          'nilai_angka': 83,
          'nilai_huruf': 'B+'
        },
      ]
    },
  ];

  final List<Map<String, dynamic>> _registrasiData = [
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

  final List<Map<String, dynamic>> _kurikulumData = [
    {
      'semester': 1,
      'matkul': [
        {'no': 1, 'kode': 'MK101', 'nama': 'Pengantar Informatika', 'sks': 3},
        {
          'no': 2,
          'kode': 'MK102',
          'nama': 'Algoritma dan Pemrograman',
          'sks': 4
        },
        {'no': 3, 'kode': 'MK103', 'nama': 'Matematika Dasar', 'sks': 3},
      ]
    },
    {
      'semester': 2,
      'matkul': [
        {'no': 1, 'kode': 'MK201', 'nama': 'Struktur Data', 'sks': 4},
        {'no': 2, 'kode': 'MK202', 'nama': 'Basis Data', 'sks': 4},
        {'no': 3, 'kode': 'MK203', 'nama': 'Jaringan Komputer', 'sks': 3},
      ]
    },
    {
      'semester': 3,
      'matkul': [
        {
          'no': 1,
          'kode': 'MK301',
          'nama': 'Pemrograman Berorientasi Objek',
          'sks': 4
        },
        {'no': 2, 'kode': 'MK302', 'nama': 'Sistem Operasi', 'sks': 3},
        {'no': 3, 'kode': 'MK303', 'nama': 'Pemrograman Web', 'sks': 4},
      ]
    },
    {
      'semester': 4,
      'matkul': [
        {'no': 1, 'kode': 'MK401', 'nama': 'Kecerdasan Buatan', 'sks': 3},
        {
          'no': 2,
          'kode': 'MK402',
          'nama': 'Analisis dan Perancangan Sistem',
          'sks': 4
        },
        {
          'no': 3,
          'kode': 'MK403',
          'nama': 'Interaksi Manusia dan Komputer',
          'sks': 3
        },
      ]
    },
    {
      'semester': 5,
      'matkul': [
        {'no': 1, 'kode': 'MK501', 'nama': 'Pemrograman Mobile', 'sks': 4},
        {'no': 2, 'kode': 'MK502', 'nama': 'Data Mining', 'sks': 3},
        {'no': 3, 'kode': 'MK503', 'nama': 'Manajemen Proyek TI', 'sks': 3},
      ]
    },
    {
      'semester': 6,
      'matkul': [
        {'no': 1, 'kode': 'MK601', 'nama': 'Pengolahan Citra', 'sks': 3},
        {'no': 2, 'kode': 'MK602', 'nama': 'Kriptografi', 'sks': 3},
        {
          'no': 3,
          'kode': 'MK603',
          'nama': 'Sistem Informasi Geografis',
          'sks': 3
        },
      ]
    },
    {
      'semester': 7,
      'matkul': [
        {'no': 1, 'kode': 'MK701', 'nama': 'Kerja Praktek', 'sks': 2},
        {'no': 2, 'kode': 'MK702', 'nama': 'Skripsi', 'sks': 4},
        {'no': 3, 'kode': 'MK703', 'nama': 'Etika Profesi TI', 'sks': 2},
      ]
    },
    {
      'semester': 8,
      'matkul': [
        {'no': 1, 'kode': 'MK801', 'nama': 'Seminar Proposal', 'sks': 2},
        {'no': 2, 'kode': 'MK802', 'nama': 'Tugas Akhir', 'sks': 6},
        {'no': 3, 'kode': 'MK803', 'nama': 'Kewirausahaan', 'sks': 3},
      ]
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
      'Tgl Lahir': '20 Februari 2003',
      'Alamat': 'Jl. Kebahagiaan No. 123, Jakarta',
      'No HP': '081234567890',
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
            'Riwayat Akademik (s/d Semester 5)',
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
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
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
                      const SizedBox(height: 12),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          columnSpacing: 12,
                          headingRowColor: MaterialStateProperty.all(
                              const Color(0xFFF0F4F7)),
                          columns: const [
                            DataColumn(label: Text('No')),
                            DataColumn(label: Text('Kode MK')),
                            DataColumn(label: Text('Nama MK')),
                            DataColumn(label: Text('SKS')),
                            DataColumn(label: Text('Nilai Angka')),
                            DataColumn(label: Text('Nilai Huruf')),
                          ],
                          rows: semesterData['matkul'].map<DataRow>((matkul) {
                            return DataRow(
                              cells: [
                                DataCell(Text(matkul['no'].toString())),
                                DataCell(Text(matkul['kode'])),
                                DataCell(Text(matkul['nama'])),
                                DataCell(Text(matkul['sks'].toString())),
                                DataCell(
                                    Text(matkul['nilai_angka'].toString())),
                                DataCell(Text(matkul['nilai_huruf'])),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
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
            'Riwayat Registrasi',
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
            'Daftar Kurikulum',
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
              return Card(
                elevation: 2,
                margin: const EdgeInsets.only(bottom: 16),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Semester ${semesterData['semester']}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3498DB),
                        ),
                      ),
                      const SizedBox(height: 12),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          columnSpacing: 12,
                          headingRowColor: MaterialStateProperty.all(
                              const Color(0xFFF0F4F7)),
                          columns: const [
                            DataColumn(label: Text('No')),
                            DataColumn(label: Text('Kode MK')),
                            DataColumn(label: Text('Nama MK')),
                            DataColumn(label: Text('SKS')),
                          ],
                          rows: semesterData['matkul'].map<DataRow>((matkul) {
                            return DataRow(
                              cells: [
                                DataCell(Text(matkul['no'].toString())),
                                DataCell(Text(matkul['kode'])),
                                DataCell(Text(matkul['nama'])),
                                DataCell(Text(matkul['sks'].toString())),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
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
                    backgroundImage: NetworkImage(
                        'https://picsum.photos/200'), // Ganti dengan foto profil asli
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
}
