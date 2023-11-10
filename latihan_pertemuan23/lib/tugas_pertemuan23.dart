import 'package:flutter/material.dart';
import 'image_file_your_skin.dart';
import 'recommended.dart';
//import 'detail.dart';


List<String> titles = <String>[
  'Home',
  'My Skin',
  'Product For You',
];

void main() => runApp(const TabBarApp());

class TabBarApp extends StatelessWidget {
  const TabBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       theme: ThemeData(primaryColor: Color.fromARGB(243, 255, 77, 163)),
      home: const TabBarExample(),
      
     
    );
  }
}

class TabBarExample extends StatefulWidget {
  const TabBarExample({super.key});

  @override
  State<TabBarExample> createState() => _TabBarExampleState();
}


class _TabBarExampleState extends State<TabBarExample>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //     colorSchemeSeed: const Color(0xff6750a4), useMaterial3: true),
      home: const AppBarExample(),
    );
  }
}

class AppBarExample extends StatelessWidget {
  const AppBarExample({super.key});


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
          title: const Text('Skincare Daily'),
         
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
         body: TabBarView(
           //controller: _tabController,
        children: const <Widget>[
           Center(
            child: Text("It's Home Here"),
          ),
            MyApp(), // membuka page your skin
            AppBarApp(), // membuka page recommended
        ],
      ),
      ),
    );
  }
}
