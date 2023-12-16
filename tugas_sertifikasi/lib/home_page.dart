import 'package:flutter/material.dart';
import 'package:tugas_sertifikasi/login.dart';
import 'gallery.dart';
import 'kontak.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
        appBar: AppBar(
        title: Text('Home Page'),
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
      body: Padding(
         padding: const EdgeInsets.all(30.0),
        //padding: EdgeInsets.only(top: 200),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: [
            buildButton(
              icon: Icons.photo,
              label: 'Gallery',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GalleryPage()),
                );
              },
            ),
            buildButton(
              icon: Icons.contacts,
              label: 'Contacts',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContactPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton({required IconData icon, required String label, required VoidCallback onPressed}) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 176, 91, 188),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 3, //menentukan sejauh mana suatu elemen akan dinaikkan dari permukaan tampilan lainnya
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50.0,
              color: Colors.white,
            ),
            SizedBox(height: 8.0),
            Text(
              label,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
