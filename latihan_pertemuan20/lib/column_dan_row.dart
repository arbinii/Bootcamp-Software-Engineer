import 'package:flutter/material.dart';

void main() {
  runApp(Pertemuan20());
}

class Pertemuan20 extends StatelessWidget {
  const Pertemuan20({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text ("Row and Column"),
        ),
        body: Column(
          children: <Widget>[
            Text('data column satu'),
            Text('data column dua'),
            Text('data column tiga'),
            Row(children: <Widget>[
              Text('data row satu'),
              Text('data row dua'),
              Text('data row tiga'),
              ],
            )
          ],
        )),
       );
     }
  }