import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../config/api_config.dart'; // Pastikan path ini benar
import '../models/schedule_model.dart'; // Pastikan path ini benar

class SchedulePage extends StatefulWidget {
  final String userId; // Kita butuh ID untuk ambil data

  // Tambahkan 'required this.userId' di constructor
  const SchedulePage({Key? key, required this.userId}) : super(key: key);

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  late Future<Map<String, List<ScheduleItem>>> _futureSchedule;

  @override
  void initState() {
    super.initState();
    _futureSchedule = fetchSchedules();
  }

  Future<Map<String, List<ScheduleItem>>> fetchSchedules() async {
    final url = Uri.parse('${ApiConfig.baseUrl}/schedule.php');
    final response = await http.post(url, body: {'user_id': widget.userId});

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      
      if (jsonResponse['success'] == true) {
        final List<dynamic> data = jsonResponse['data'];
        List<ScheduleItem> allSchedules = data.map((e) => ScheduleItem.fromJson(e)).toList();

        // Mengelompokkan List Jadwal berdasarkan Hari
        Map<String, List<ScheduleItem>> grouped = {
          'Senin': [],
          'Selasa': [],
          'Rabu': [],
          'Kamis': [],
          'Jumat': [],
          'Sabtu': [],
          // 'Minggu': [], // Tambahkan jika perlu
        };

        for (var item in allSchedules) {
          if (grouped.containsKey(item.day)) {
            grouped[item.day]!.add(item);
          }
        }
        return grouped;
      }
    }
    throw Exception('Gagal memuat jadwal');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECF0F1),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2C3E50),
        elevation: 0,
        title: const Text('Jadwal Kuliah', style: TextStyle(color: Color(0xFFECF0F1))),
      ),
      body: FutureBuilder<Map<String, List<ScheduleItem>>>(
        future: _futureSchedule,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final scheduleData = snapshot.data!;
            
            // Cek apakah semua hari kosong
            bool isEmpty = scheduleData.values.every((list) => list.isEmpty);
            if (isEmpty) {
              return const Center(child: Text("Belum ada jadwal kuliah yang diambil."));
            }

            return ListView.builder(
              padding: const EdgeInsets.all(16),
              // Kita hanya loop hari yang ada di Map (Senin-Sabtu)
              itemCount: scheduleData.length,
              itemBuilder: (context, index) {
                String day = scheduleData.keys.elementAt(index);
                List<ScheduleItem> classes = scheduleData[day]!;

                // Jika hari itu tidak ada kelas, kita skip tampilannya (return container kosong)
                // Atau biarkan tampil nama hari tapi list kosong. 
                // Di sini saya pilih: Tampilkan hari HANYA jika ada kelasnya.
                if (classes.isEmpty) return const SizedBox.shrink();

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header Hari
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        children: [
                          Container(
                            width: 4, height: 24,
                            decoration: BoxDecoration(color: const Color(0xFF3498DB), borderRadius: BorderRadius.circular(2)),
                          ),
                          const SizedBox(width: 12),
                          Text(day, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF2C3E50))),
                        ],
                      ),
                    ),
                    // List Kartu Jadwal
                    ...classes.map((item) => _buildScheduleCard(item)),
                    const SizedBox(height: 8),
                  ],
                );
              },
            );
          }
          return const Center(child: Text("Tidak ada data."));
        },
      ),
    );
  }

  Widget _buildScheduleCard(ScheduleItem item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), spreadRadius: 1, blurRadius: 5, offset: const Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item.subject, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF2C3E50))),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.access_time, size: 16, color: Color(0xFF3498DB)),
              const SizedBox(width: 8),
              Text(item.time, style: TextStyle(fontSize: 14, color: const Color(0xFF2C3E50).withOpacity(0.7))),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.room, size: 16, color: Color(0xFF3498DB)),
              const SizedBox(width: 8),
              Text(item.room, style: TextStyle(fontSize: 14, color: const Color(0xFF2C3E50).withOpacity(0.7))),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.person, size: 16, color: Color(0xFF3498DB)),
              const SizedBox(width: 8),
              Expanded(child: Text(item.lecturer, style: TextStyle(fontSize: 14, color: const Color(0xFF2C3E50).withOpacity(0.7)))),
            ],
          ),
        ],
      ),
    );
  }
}