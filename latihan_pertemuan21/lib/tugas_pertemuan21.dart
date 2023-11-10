import 'package:flutter/material.dart';

void main() {

 runApp(const MyApp());
}
//menggunakan stateless dan statefull
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Data Diri',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Data Diri'),
      );
  }
}
 class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
 }

 class _MyHomePageState extends State<MyHomePage> {
  TextEditingController prosesMenampilkanSubmitNama = TextEditingController();
  TextEditingController prosesMenampilkanSubmitAlamat = TextEditingController();
  TextEditingController prosesMenampilkanSubmitJenisKelamin= TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       backgroundColor : Theme.of(context).colorScheme.inversePrimary,
        title: Center(
          child: Text(widget.title),
        ),
      ),
      body: SingleChildScrollView(
      child: Column(
       
        children: <Widget>[
             TextFormField(
              cursorColor: Theme.of(context).canvasColor,
              maxLength: 100,
              controller: prosesMenampilkanSubmitNama,
              decoration: const InputDecoration(
               // icon: Icon(Icons.favorite),
                hintText: 'Nama',
               //  errorText: 'Error message',
                suffixIcon: Icon(
              Icons.check_circle,
            ),
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'please enter some text';
                }
                return null;
              },
             ),
             
              TextFormField(
              keyboardType: TextInputType.number,
              cursorColor: Theme.of(context).canvasColor,
              controller: prosesMenampilkanSubmitAlamat,
              maxLength: 3,
              decoration: const InputDecoration(
                 //icon: Icon(Icons.favorite),
                hintText: 'Umur',
                //errorText: 'Error message',
                suffixIcon: Icon(
              Icons.check_circle,
            ),
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'please enter some text';
                }
                return null;
              },
             ),
      
              TextFormField(
              cursorColor: Theme.of(context).canvasColor,
              controller: prosesMenampilkanSubmitJenisKelamin,
              maxLength: 100,
              decoration: const InputDecoration(
                //errorText: isANumber? null : "Please enter a number"
                fillColor: Color.fromARGB(211, 104, 58, 183),
                //icon: Icon(Icons.favorite),
                hintText: 'Jenis Kelamin',
                //errorText: 'Please enter a number',
                suffixIcon: Icon(
              Icons.check_circle,
            ),
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'please enter some text';
                }
                return null;
              },
             ),
             Padding(
              padding: const EdgeInsets.only(top: 15, left: 15),
              child:  ElevatedButton(
                onPressed:  () {
                  setState(() {
                    prosesMenampilkanSubmitNama.text;
                    prosesMenampilkanSubmitAlamat.text;
                    prosesMenampilkanSubmitJenisKelamin.text;
                  });
                },
                child:  const Text('Simpan'),
              ),
             ),
              Text("Nama: " + prosesMenampilkanSubmitNama.text),
              Text("Alamat : " + prosesMenampilkanSubmitAlamat.text),
              Text("Jenis Kelamin : " +prosesMenampilkanSubmitJenisKelamin.text),
        
        ],
      ),
      ),
    );
  }
}