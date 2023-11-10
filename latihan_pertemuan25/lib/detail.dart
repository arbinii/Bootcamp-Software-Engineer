
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';
//mport 'your_skin.dart';




void main() => runApp(const DetailGalleryAccess());




class DetailGalleryAccess extends StatefulWidget {
  const DetailGalleryAccess({super.key});

  @override
  State createState() => _GalleryAccessState();
}

class HistorySkin extends StatelessWidget {
  final File selfieImage;

  HistorySkin({required this.selfieImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text("Selfie yang di-submit:"),
            SizedBox(height: 20),
            Image.file(selfieImage),
            // Di sini Anda dapat menambahkan widget lain untuk menampilkan informasi lainnya
          ],
        ),
      ),
    );
  }
}
class _GalleryAccessState extends State {
  TextEditingController prosesMenampilkanSubmit = TextEditingController();

  File? galleryFile;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
   return Scaffold(
         //body: ListView(
            body: Center(
        child: Text(
          'selfie log',
          style: GoogleFonts.yeonSung(
            fontSize: 18,
            color: Colors.black
          ),
        ),
      ),
                );
    //           ), 
    //       ],
    //     ),
    //  // ),
    // );
  }
}
