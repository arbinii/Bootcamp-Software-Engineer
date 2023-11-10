import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


List<String> titles = <String>[
  'Home',
  'Your Skin',
  'Product For You',
];
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      
      theme: ThemeData(primaryColor: Color.fromARGB(243, 255, 77, 163)),
      home: const GalleryAccess(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class GalleryAccess extends StatefulWidget {
  const GalleryAccess({super.key});

  @override
  State createState() => _GalleryAccessState();
}

class _GalleryAccessState extends State {
  TextEditingController prosesMenampilkanSubmit = TextEditingController();

  File? galleryFile;
  final picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
     const int tabsCount = 3; //jumlah tab
  // untuk membuat tabcontroller pertama kita menggunakan defaultabcontroller
    return DefaultTabController(
      initialIndex: 1,
      length: tabsCount,
      child: Scaffold(
        appBar: AppBar(
        backgroundColor: Color.fromARGB(243, 255, 77, 163),
          title: const Text('Your Skin Report'),
         
          notificationPredicate: (ScrollNotification notification) {
            return notification.depth == 1;
          },
          
          shadowColor: Theme.of(context).shadowColor,
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: const Icon(Icons.home),
                text: titles[0],
              ),
              Tab(
                icon: const Icon(Icons.face_3),
                text: titles[1],
              ),
              Tab(
                icon: const Icon(Icons.auto_awesome),
                text: titles[2],
              ),
             
            ],
          ),
        ),
      body: Builder(
        builder: (BuildContext context) {
          return Center(
            child: SingleChildScrollView(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                      padding: const EdgeInsets.only(top: 15, left: 15),  //menentukan padding label sehingga memberikan jarak ke atas dan kiri sebesar 15
                      child: Text("Selfie Log"),
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
                //  SizedBox(
                //   height: 200.0,
                //   width: 300.0,
                //   child: galleryFile == null
                //       ? const Center(
                //           child: Text('your skin'))
                //       : Center(child: Image.file(galleryFile!)),
                // ),

          //  TextFormField(
          //     cursorColor: Theme.of(context).canvasColor,
          //     controller: prosesMenampilkanSubmit,
          //     maxLength: 100,
          //     decoration: const InputDecoration(
          //     border: OutlineInputBorder(),

          //       //errorText: isANumber? null : "Please enter a number"
          //       fillColor: Color.fromARGB(211, 104, 58, 183),
          //       //icon: Icon(Icons.favorite),
          //       hintText: 'please enter some text',
          //       //errorText: 'Please enter a number',
          //       suffixIcon: Icon(
          //     Icons.check_circle,
          //   ),
          //     ),
          //     validator: (String? value) {
          //       if (value == null || value.isEmpty) {
          //         return 'please enter some text';
          //       }
          //       return null;
          //     },
          //    ),
          //    Padding(
          //     padding: const EdgeInsets.only(top: 15, left: 15),
          //     child:  ElevatedButton(
          //       onPressed:  () {
          //         setState(() {
          //           prosesMenampilkanSubmit.text;
                    
          //         });
          //       },
          //       child:  const Text('Simpan'),
          //     ),
          //    ), 
          //     Text(prosesMenampilkanSubmit.text),
          

          Padding(   
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter a search term',
            ),
          ),
         ),
        //  Padding(
        //       padding: const EdgeInsets.only(top: 15, left: 15),
        //       child:  ElevatedButton(
                
        //         onPressed:  () {
        //           setState(() {
                    
        //           });
        //         },
        //         child:  const Text('Simpan'),
                
        //       ),
        //      ),
        //       Text(prosesMenampilkanSubmit.text),

        TextButton(
                      child: const Text(
                        "Simpan",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(const Color.fromARGB(243, 255, 77, 163)),
                      ),
                      onPressed: () {
                        setState(() {
                   prosesMenampilkanSubmit.text;
                       
                  });
                  
                      },
                    ),
            
        //  ElevatedButton(
        //           style: ButtonStyle(
        //               backgroundColor: MaterialStateProperty.all(Color.fromARGB(243, 255, 77, 163))),
        //           child: const Text('submit'),
        //           onPressed: () {
        //             setState(() {
        //            prosesMenampilkanSubmit.text;
                  
        //        });
           
        //           },
        //         ),
        //          Text(prosesMenampilkanSubmit.text),

              ],
            ),
            ),
          );
        },
      ),
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
              //mainAxisAlignment: MainAxisAlignment.center,

                //leading: const Icon(Icons.photo_library),
                title: const Text('Cancle'),
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
