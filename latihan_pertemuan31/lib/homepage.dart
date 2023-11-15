import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'your_skin.dart';
//import 'recommended.dart';
import 'tes.dart';
import 'skintype.dart';


List<String> titles = <String>[
  'Home',
  'My Skin',
  'Skin Type',
  'Product For You',
];

class TabBarApp extends StatelessWidget {
  const TabBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,    
      theme: ThemeData(primaryColor: Color.fromARGB(243, 202, 146, 236)),
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
     print('initstate()');
    _tabController = TabController(length: 4, vsync: this);
      SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,

  ]);
  }

  @override
  void dispose() {
    print ('disose()');
    _tabController.dispose();
     SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      home: const AppBarExample(),
    );
  }
}

class AppBarExample extends StatelessWidget {
  const AppBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    const int tabsCount = 4; // Jumlah tab
    // Untuk membuat tabcontroller pertama kita menggunakan defaultabcontroller
    return DefaultTabController(
      initialIndex: 0,
      length: tabsCount,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(243, 202, 146, 236),
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
                icon: const Icon(CupertinoIcons.heart_circle),
                text: titles[2],
              ),
              Tab(
                icon: const Icon(Icons.auto_awesome),
                text: titles[3],
              ),
            ],
          ),
        ),
        body: TabBarView(
          
          // controller: _tabController,
          children: <Widget>[
            ArticleList(), // Menampilkan daftar artikel pada halaman "Home"
            MyApp(), // Membuka page your skin
           // AppBarApp(), // Membuka page recommended
           SkinTypeQuizScreen(),
           FirstScreen(),
           
          ],
        ),
      ),
    );
  }
}

class ArticleList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     
    // Daftar artikel
    final List<Article> articles = [
      Article(
        image: 'https://jessicaalicia.com/wp-content/uploads/2021/01/Best_Anti_Aging_Eye_Cream_Brands_large.jpg',
        title: 'Rekomendasi Skincare untuk Kulit Kombinasi',
        description: 'Kulit kombinasi ini gampang-gampang-susah ya, karena ada bagian wajah yang kering, dan ada yang berminyak.',
      ),
      Article(
        image: 'https://jessicaalicia.com/wp-content/uploads/2021/01/oily.jpg',
        title: 'Rekomendasi Skincare untuk Kulit Berminyak, Komedo, dan Jerawat',
        description: 'Kalau memang berminyak saja tidak berjerawat, skip saja untuk obat jerawatnya, sisanya kurang lebih sama.',
      ),
      Article(
        image: 'https://ella-staging.storage.googleapis.com/blogs/65166ea25b50e_flek-hitam-di-wajah-susah-hilang-penyebab-ellaskincare.jpg',
        title: 'Flek Hitam di Wajah Susah Hilang?',
        description: 'Kenali penyebabnya dan cari solusinya di sini, biar wajah makin oke!',
      ),
    ];

    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: articles.length,
            itemBuilder: (context, index) {
              return ArticleItem(article: articles[index]);
            },
          ),
        ],
      ),
    );
  }
}

class Article {
  final String image;
  final String title;
  final String description;

  Article({required this.image, required this.title, required this.description});
}

class ArticleItem extends StatelessWidget {
  final Article article;

  ArticleItem({required this.article});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.network(
          article.image,
          width: 4000,
          height: 250,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 20),
        Text(
          article.title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10),
        Text(
          article.description,
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
      ],
    );
  }
}