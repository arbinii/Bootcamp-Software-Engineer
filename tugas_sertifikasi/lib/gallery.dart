import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tugas_sertifikasi/login.dart';

class GalleryPage extends StatefulWidget {
  @override
  _GalleryPageState createState() => _GalleryPageState();
}


// class _GalleryPageState extends State<GalleryPage> {
//   List<String> imageAssets = [
//     'assets/image1.jpg',
//     'assets/image2.jpg',
//     'assets/image3.jpg',
//   ];

class _GalleryPageState extends State<GalleryPage> {
  List<String> imageUrls = [];

  @override
  void initState() {
    super.initState();
    // Panggil fungsi untuk mengambil data dari API saat halaman dimuat
    fetchImages();
  }

  Future<void> fetchImages() async {
    // Gantilah URL API sesuai dengan API yang Anda gunakan
    const apiUrl = 'https://api.unsplash.com/photos/random?count=12&client_id=3skFEVHvSZI-P6uqxi9_qB8d4xNEC_qNkUspD3UeWMA';
    
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // Ubah data JSON menjadi List<String> imageUrls
        final List<dynamic> data = json.decode(response.body);
        final List<String> urls = data.map((json) => json['urls']['small']).cast<String>().toList();       
        setState(() {
          imageUrls = urls;
        });
      } else {
        // Handle kesalahan jika status code bukan 200
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      // Handle kesalahan jaringan atau parsing data
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.push(context,
              MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
        ],
      ),
      body: Center(
        child: imageUrls.isEmpty
          ? CircularProgressIndicator() // untuk memberikan indikasi visual kepada pengguna bahwa aplikasi sedang melakukan suatu tindakan atau proses yang memerlukan waktu
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( //untuk mengontrol tata letak dari elemen-elemen yang ditampilkan dalam grid.
                crossAxisCount: 3, // mengatur jumlah gambar pada row
                crossAxisSpacing: 8.0, // mengatur spasi antar images
                mainAxisSpacing: 8.0, // mengatur spasi antar rows
              ),
              itemCount: imageUrls.length,
              itemBuilder: (context, index) {
                return Image.network(
                  imageUrls[index],
                  fit: BoxFit.cover, 
                );
              },
            ),
      ),
    );
  }
}
