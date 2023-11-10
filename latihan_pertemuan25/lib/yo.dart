import 'package:flutter/material.dart';

// main method
void main() => runApp(MaterialApp(home:A1Run()));

class A1Run extends StatefulWidget {
const A1Run({Key? key}) : super(key: key);

@override
State<A1Run> createState() => _A1RunState();
}

class _A1RunState extends State<A1Run> {
@override
Widget build(BuildContext context) {
	return MaterialApp(
	title: "Navigate Through Images",
	debugShowCheckedModeBanner: false,
	theme: ThemeData.light(),
	home: Scaffold(
		appBar: AppBar(
		title: Text('Navigate Through Images'),
		),
		body: Container(
		child: new ListView(
			scrollDirection: Axis.vertical,
			children: [
			Padding(
				padding: const EdgeInsets.all(12.0),
				child: Column(
				mainAxisAlignment: MainAxisAlignment.start,
				children: [
					Padding(
					padding: const EdgeInsets.all(8.0),
					child: Row(
						mainAxisAlignment: MainAxisAlignment.center,
						children: [
						Column(
							mainAxisAlignment: MainAxisAlignment.center,
							children: [
							GestureDetector(
								child: Image.asset(
								'lib/image/cat.jpeg',
								),
								onTap: () {
								Navigator.push(
									context,
									MaterialPageRoute(
										builder: (context) => GfGPage()));
								},
							),
							Text(
								'Geeks for Geeks',
								textDirection: TextDirection.ltr,
							)
							],
						),
						Column(
							mainAxisAlignment: MainAxisAlignment.center,
							children: [
							GestureDetector(
								child: Image.asset(
								'lib/image/totoro.jpg',
								),
								onTap: () {
								Navigator.push(
									context,
									MaterialPageRoute(
										builder: (context) => FlutterPage()));
								},
							),
							Text(
								'Flutter',
								textDirection: TextDirection.ltr,
							)
							],
						),
						],
					),
					),
				],
				),
			),
			],
		),
		),
	),
	);
}
}

// when user tab in flutter image it will
// come to flutter page screen,
class FlutterPage extends StatelessWidget {
Widget build(BuildContext context) {
	return MaterialApp(
	debugShowCheckedModeBanner: false,
	home: new Scaffold(
		appBar: AppBar(
		leading: IconButton(
			icon: new Icon(Icons.arrow_back),
			onPressed: () {
			Navigator.push(
				context, MaterialPageRoute(builder: (context) => A1Run()));
			},
		),
		title: Text("Flutter Page"),
		),
		body: Center(
		child: Image.asset("lib/image/totoro.jpg"),
		),
	),
	);
}
}

// when user tab in gfg image it
// will come to gfg page screen,
class GfGPage extends StatelessWidget {
Widget build(BuildContext context) {
	return MaterialApp(
	debugShowCheckedModeBanner: false,
	home: new Scaffold(
		appBar: AppBar(
		leading: IconButton(
			icon: new Icon(Icons.arrow_back),
			onPressed: () {
			Navigator.push(
				context, MaterialPageRoute(builder: (context) => A1Run()));
			},
		),
		title: Text("GFG Page"),
		),
		body: Center(
		child: Image.asset("lib/image/cat.jpeg"),
		),
	),
	);
}
}
