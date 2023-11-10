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
      title: 'Latihan Membuat Tombol',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor:  Color.fromARGB(255, 243, 33, 191)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Latihan Membbuat Tombol'),
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
  //membuat controller untuk text input
  TextEditingController prosesMenampilkanText = TextEditingController();
  TextEditingController prosesMenampilkanSubmitText = TextEditingController();
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Latihan membuat tombol yang terdiri dari: '
          ),
          Text(
            'Tombol Button',
          ),
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Text Button')));

            },
            child: const Text('Text Button')),
            Text('Tombol ElevatedButton'),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('ini dari tombol Elevated button')));
              },
              child: const Text('ElevatedButton'),
            ),
            Text('Tombol OutLinedButton'),
            OutlinedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('ini dari tombol Outlined button')));
              },
              child: const Text('Tombol OutLinedButton')),
              Text('Input Widget'),
             TextField(
              onChanged: (value) {
                setState(()  {});
              },
              controller: prosesMenampilkanText,
             ),
             Text(prosesMenampilkanText.text),
             Text('Input Form'),
             TextFormField(
              controller: prosesMenampilkanSubmitText,
              decoration: const InputDecoration(
                hintText: 'Enter your email',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'please enter some text';
                }
                return null;
              },
             ),
             Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0),
              child:  ElevatedButton(
                onPressed:  () {
                  setState(() {
                    prosesMenampilkanSubmitText.text;
                  });
                },
                child:  const Text('Simpan'),
              ),
              ),
              Text(prosesMenampilkanSubmitText.text),
        ],
      ),
      ),
    );
  }
}