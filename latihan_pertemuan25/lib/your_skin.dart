import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:google_fonts/google_fonts.dart';
//import 'package:latihan_pertemuan25/detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color.fromARGB(243, 255, 77, 163)),
      home: const GalleryAccess(),
      
    );
  }
}

class GalleryAccess extends StatefulWidget {
  const GalleryAccess({super.key});

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
      
      body: Builder(
        builder: (BuildContext context) {
          return Center(
            child: SingleChildScrollView(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                      padding: const EdgeInsets.only(top: 15, left: 15),  //menentukan padding label sehingga memberikan jarak ke atas dan kiri sebesar 15
                      child: Text("Selfie Log",
                    //  style: GoogleFonts.epilogue(
                    //   fontSize: 15,
                    //   color: Colors.black
                   // ),
                      ),
                    ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color.fromARGB(243, 255, 77, 163))),
                  child: const Text('Please take at least one front selfie'),
                  onPressed: () {
                    _showPicker(context: context);
                  },
                ),
            
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 200,
                  width: 300.0,
                  child: galleryFile == null
                      ? const Center(
                          child: Text('Nothing is selected!!'))
                      : Center(child: Image.file(galleryFile!)),
                ),
              
          Padding(   
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Would you like to take some notes',
            ),
          ),
         ),
        
        TextButton(
                      child: const Text(
                        "Submit",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(const Color.fromARGB(243, 255, 77, 163)),
                      ),
                      onPressed: () {
                        if (galleryFile != null) {
                          Navigator.of(context).push(

                            MaterialPageRoute(
                              builder: (context) => HistorySkin(selfieImage: galleryFile!) 
                            ),
                          
                          );
                        
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Nothing is selected'),
                              
                      
                            ),
                            
                       
                            
                          );
                        }
                      },

                    ),
      
              ],
            ),
            ),
          );
        },
      ),
    );
  }

  void _showPicker({
    required BuildContext context,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Choose from camera roll'),
                onTap: () {
                  getImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Take a picture'),
                onTap: () {
                  getImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: const Text('Cancel'),
                onTap: () {
                 // getImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future getImage(
    ImageSource img,
  ) async {
    final pickedFile = await picker.pickImage(source: img);
    XFile? xfilePick = pickedFile;
    setState(
      () {
        if (xfilePick != null) {
          galleryFile = File(pickedFile!.path);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Nothing is selected'),
            ),
            
          );
        }
      },
    
    );
  }
}