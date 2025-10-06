import 'package:flutter/material.dart';
import 'buku_data.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDetailPage extends StatelessWidget {
  final Book buku;
  const BookDetailPage({super.key, required this.buku});

  // Fungsi untuk membuka URL
  Future<void> _launchURL(BuildContext context) async {
    final Uri url = Uri.parse(buku.officialUrl);

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Gagal membuka link: ${buku.officialUrl}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(buku.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16), // 🔹 kasih padding biar rapi
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              // 🔹 bikin gambar rounded
              borderRadius: BorderRadius.circular(12),
              child: Image.network(buku.imageUrls.first),
            ),
            const SizedBox(height: 16),

            Text(
              buku.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Text(buku.author, style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 10),

            Text(
              buku.price,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),

            Text(
              "Deskripsi",
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),

            Text(buku.description, style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 92, 167, 196),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text("Beli Sekarang"),
            ),

            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: () => _launchURL(context),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text("Kunjungi Website Resmi"),
            ),
          ],
        ),
      ),
    );
  }
}
