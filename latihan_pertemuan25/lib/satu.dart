import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// main method
void main() => runApp(MaterialApp(home:Kucing()));

class Kucing extends StatefulWidget {
const Kucing({Key? key}) : super(key: key);

@override
State<Kucing> createState() => _KucingState();
}

class _KucingState extends State<Kucing> {
@override
Widget build(BuildContext context) {
	return MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(primaryColor: Color.fromARGB(243, 255, 77, 163)),

	title: "KUCING",
	//theme: ThemeData.light(),
	home: Scaffold(
		appBar: AppBar(
    backgroundColor: Color.fromARGB(243, 255, 77, 163),


		title: Text('KUCING'),
		),
		body: Container(
		child: new ListView(
			scrollDirection: Axis.horizontal,
			children: [
			Padding(
				padding: const EdgeInsets.all(0.0),
        child: SingleChildScrollView(
				child: Column(
				mainAxisAlignment: MainAxisAlignment.start,
				children: [
					Padding(
					padding: const EdgeInsets.all(0.0),
					child: Column(
						mainAxisAlignment: MainAxisAlignment.center,
						children: [
						Column(
							mainAxisAlignment: MainAxisAlignment.center,
							children: [
							GestureDetector(
								child: Image.asset(
								'lib/image/cat.jpeg',
                width: 420,
                height: 300,
                fit: BoxFit.cover,
								),
								onTap: () {
								Navigator.push(
									context,
									MaterialPageRoute(
										builder: (context) => KucingPage()));
								},
							),
               Padding(
              padding: EdgeInsets.only(top: 20, left: 15),
						child:	Text(
								'Kucing hilang',
                style: GoogleFonts.epilogue(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                  ), 
								textDirection: TextDirection.ltr,
							)
               ),
							],
						),
						],
					),
					),
				],
        ),
				),
			),
			],
		),
		),
	),
	);
}
}


//page selanjutnyaa
class KucingPage extends StatelessWidget {
//const KucingPage({Key? key}) : super(key: key);
  

Widget build(BuildContext context) {
	return MaterialApp(
	debugShowCheckedModeBanner: false,
  theme: ThemeData(primaryColor: Color.fromARGB(243, 255, 77, 163)),
 
	home: new Scaffold(
		appBar: AppBar(
    backgroundColor: Color.fromARGB(243, 255, 77, 163),
		leading: IconButton(
			icon: new Icon(Icons.arrow_back),
			onPressed: () {
			Navigator.push(
				context, MaterialPageRoute(builder: (context) => Kucing()));
			},
		),
		title: Text("Page Kucing"),
		),
		body: Center(
      child: Column(
      children:  <Widget>[
            Padding(
            padding: EdgeInsets.only(top: 20, left: 15),
            child: Text(
                'DICARI',
                style: GoogleFonts.epilogue(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
                ), 
              ),
             ),

              Padding(
            padding: EdgeInsets.only(top: 20, left: 0),
            child: Text(
             'Dicari kucing dengan ciri-ciri sedikit ngereog, agak gila, memakai topi berwarna hijau, kecil mungil, jelek.',
             style: GoogleFonts.epilogue(
            fontSize: 16,
            color: Colors.black,
               ), 
             ),
           ),

          Padding(
            padding: const EdgeInsets.only(top: 20, left: 0),
        child: Container(
           width: 420,
          height: 300,
        child: Image.asset(
								'lib/image/cat.jpeg',
                fit: BoxFit.cover,
                    ),
        ),
                )
              ],
            ),
          ),
        ),
      );
    }
  }
