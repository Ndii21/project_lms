import 'package:flutter/material.dart';

class MaterialDetailPage extends StatelessWidget {
  final String courseName;
  final List<String> materials;
  final Color color;

  const MaterialDetailPage({
    Key? key,
    required this.courseName,
    required this.materials,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECF0F1),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2C3E50),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFECF0F1)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          courseName,
          style: const TextStyle(color: Color(0xFFECF0F1)),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: materials.length,
        itemBuilder: (context, index) {
          String fileName = materials[index];
          String fileExtension = fileName.split('.').last.toUpperCase();

          return _buildMaterialCard(fileName, fileExtension);
        },
      ),
    );
  }

  // Widget untuk kartu file materi
  Widget _buildMaterialCard(String fileName, String fileExtension) {
    // Menentukan icon berdasarkan ekstensi file
    IconData fileIcon;
    Color iconColor;

    switch (fileExtension) {
      case 'PDF':
        fileIcon = Icons.picture_as_pdf;
        iconColor = const Color(0xFFE74C3C);
        break;
      case 'PPTX':
      case 'PPT':
        fileIcon = Icons.slideshow;
        iconColor = const Color(0xFFE67E22);
        break;
      case 'DOCX':
      case 'DOC':
        fileIcon = Icons.description;
        iconColor = const Color(0xFF3498DB);
        break;
      case 'ZIP':
        fileIcon = Icons.folder_zip;
        iconColor = const Color(0xFF95A5A6);
        break;
      default:
        fileIcon = Icons.insert_drive_file;
        iconColor = const Color(0xFF7F8C8D);
    }

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
          // Icon file
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              fileIcon,
              color: iconColor,
              size: 28,
            ),
          ),
          const SizedBox(width: 16),

          // Nama file
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fileName,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2C3E50),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  fileExtension,
                  style: TextStyle(
                    fontSize: 12,
                    color: const Color(0xFF2C3E50).withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),

          // Icon download (hanya visual, tidak ada fungsi)
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.download,
              color: color,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
