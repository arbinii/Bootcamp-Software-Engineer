import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController nameController =
      TextEditingController(text: 'Masukkan Nama');
  TextEditingController emailController =
      TextEditingController(text: 'Masukkan Email');
  TextEditingController addressController =
      TextEditingController(text: 'Masukkan Alamat');
  TextEditingController phoneController =
      TextEditingController(text: 'Masukkan Nomor Telepon');
  TextEditingController professionController =
      TextEditingController(text: 'Masukkan Pekerjaan');

  late ImagePicker _imagePicker;
  late XFile _imageFile;
  CircleAvatar? _avatar;

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
    _avatar = CircleAvatar(
      radius: 50,
      backgroundImage: AssetImage('images/cat.jpeg'),
    );

    // Load user information and profile image from SharedPreferences
    _loadUserData();
  }

  // Method to load user data and profile image from SharedPreferences
  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      nameController.text = prefs.getString('Nama') ?? 'Masukkan Nama';
      emailController.text = prefs.getString('Email') ?? 'Masukkan Email';
      //addressController.text = prefs.getString('Alamat') ?? 'Masukkan Alamat';
      phoneController.text =
          prefs.getString('Nomor Telepon') ?? 'Masukkan Nomor Telepon';
      professionController.text =
          prefs.getString('Pekerjaan') ?? 'Masukkan Pekerjaan';

      String? imagePath = prefs.getString('UserImage');
      if (imagePath != null) {
        _imageFile = XFile(imagePath);
        _avatar = CircleAvatar(
          radius: 50,
          backgroundImage: FileImage(File(_imageFile.path)),
        );
      }
    });
  }

  // Method to save user data and profile image to SharedPreferences
  Future<void> _saveUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('Nama', nameController.text);
    prefs.setString('Email', emailController.text);
    //prefs.setString('Alamat', addressController.text);
    prefs.setString('Nomor Telepon', phoneController.text);
    prefs.setString('Pekerjaan', professionController.text);
  }

  Future<void> _saveUserProfileImage(String imagePath) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('UserImage', imagePath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 2000,
        decoration: BoxDecoration(color: Colors.white),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: _editProfilePicture,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Color.fromRGBO(0, 151, 205, 1),
                              width: 5,
                            ),
                          ),
                          child: _avatar,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromRGBO(0, 151, 205, 1),
                            ),
                            child: const Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  buildEditableTile("Nama", Icons.person, nameController),
                  const SizedBox(height: 5),
                  buildEditableTile("Email", Icons.email, emailController),
                  const SizedBox(height: 5),
                  // buildEditableTile("Alamat", Icons.home, addressController),
                  // const SizedBox(height: 10),
                  buildEditableTile(
                      "Nomor Telepon", Icons.phone, phoneController),
                  const SizedBox(height: 5),
                  buildEditableTile(
                      "Pekerjaan", Icons.work, professionController),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildEditableTile(
      String title, IconData icon, TextEditingController controller) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromRGBO(0, 151, 205, 1),
          Color.fromRGBO(24, 165, 167, 1),
        ]),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            color: const Color.fromARGB(255, 0, 0, 0).withOpacity(.2),
            spreadRadius: 2,
            blurRadius: 10,
          ),
        ],
      ),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                enabled: false,
                style: TextStyle(color: Colors.white),
              ),
            ),
            GestureDetector(
              onTap: () => _showEditDialog(context, title, controller),
              child: const Icon(
                Icons.edit,
                color: Colors.white,
              ),
            ),
          ],
        ),
        leading: Icon(
          icon,
          color: Colors.white,
        ),
        tileColor: Colors.transparent,
      ),
    );
  }

  Future<void> _showEditDialog(
    BuildContext context,
    String title,
    TextEditingController controller,
  ) async {
    String? newValue = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit $title'),
          content: TextField(
            controller: controller,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(controller.text);
                _saveUserData(); // Save user data when the "Save" button is pressed
              },
              child: const Text('Simpan'),
            ),
          ],
        );
      },
    );

    if (newValue != null) {
      setState(() {
        controller.text = newValue;
      });
    }
  }

  Future<void> _editProfilePicture() async {
    final pickedFile = await showDialog<XFile?>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Photo Profil'),
          content: Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                  final pickedImage =
                      await _imagePicker.pickImage(source: ImageSource.gallery);
                  Navigator.of(context).pop(pickedImage);
                },
                child: const Text('Pilih Dari Galeri'),
              ),
              ElevatedButton(
                onPressed: () async {
                  final pickedImage =
                      await _imagePicker.pickImage(source: ImageSource.camera);
                  Navigator.of(context).pop(pickedImage);
                },
                child: const Text('Ambil Gambar'),
              ),
            ],
          ),
        );
      },
    );

    if (pickedFile != null) {
      setState(() {
        _imageFile = pickedFile;
        _avatar = CircleAvatar(
          radius: 50,
          backgroundImage: FileImage(File(_imageFile.path)),
        );
      });

      // Save the new image file path to SharedPreferences
      _saveUserProfileImage(_imageFile.path);
    }
  }
}
