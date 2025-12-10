// File: lib/config/api_config.dart

class ApiConfig {
  // --- ATUR IP DI SINI SAJA ---
  // Ganti angka ini sesuai IP Laptop kamu yang baru
  static const String ipAddress = "192.168.0.8";
  // ---------------------------

  // Ini URL dasar yang otomatis menggabungkan IP di atas
  static const String baseUrl = "http://$ipAddress/studymate_api";
}