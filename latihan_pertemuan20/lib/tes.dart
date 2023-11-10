import 'package:flutter/material.dart';

List<String> titles = <String>[
  'Skin Scores',
  'Your Results',
  'Product For You',
];

void main() => runApp(const AppBarApp());

class AppBarApp extends StatelessWidget {
  const AppBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorSchemeSeed: const Color(0xff6750a4), useMaterial3: true),
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
          //backgroundColor: Colors.purple,
          title: const Text('Your Skin Report'),
         
          notificationPredicate: (ScrollNotification notification) {
            return notification.depth == 1;
          },
          
          shadowColor: Theme.of(context).shadowColor,
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: titles[0],
              ),
              Tab(
                text: titles[1],
              ),
              Tab(
                text: titles[2],
              ),
             
            ],
          ),
        ),
         body: ListView(
            children: [
              Padding(
                      padding: const EdgeInsets.only(top: 15, left: 15),  //menentukan padding label sehingga memberikan jarak ke atas dan kiri sebesar 15
                      child: Text("Skin Healt Score : 80 out 100"),
                    ),
                  
                     Padding(
                      padding: const EdgeInsets.only(top: 15, left: 0),
                      child: Container(
                        width: 180,
                        height: 150,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://blog.reneerouleau.com/wp-content/uploads/2014/04/RR-Blog-STChange-03-403x260@2x.jpg"),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    
              Padding(
                padding: EdgeInsets.only(top: 20, left: 15),
                child: Text("Your Skin Type : Sensitive"),
              ),
              //singlechildscrollview berfungsi untuk membuat widget dapat discroll
              //fungsinya hampir sama dengan listview
              SingleChildScrollView(
                //untuk merubah arah scroll menjadi ke kanan
                scrollDirection: Axis.horizontal,
                
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15, left: 0),
                      child: Container(
                        width: 205,
                        height: 150,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://personalstyle4you.ie/wp-content/uploads/cera-mieszana.jpg"),
                                fit: BoxFit.cover)),
                      ),
                    ),
                   Padding(
                      padding: const EdgeInsets.only(top: 15, left: 0),
                      child: Container(
                        width: 205,
                        height: 150,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://www.clearskin.in/wp-content/uploads/2022/04/Skin-Pigmentation-Causes-Symptoms-Solutions.jpg"),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  ],
                ),
              ),
              
              Padding(
                padding: EdgeInsets.only(top: 20, left: 15),
                child: Text("Get Product Recommendations For You"),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15, left: 0),
                      child: Container(
                        width: 205,
                        height: 150,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://www.avoskinbeauty.com/wp-content/uploads/2021/05/LA_AVO_JUL_PDP_Web-New_Your-Skin-Bae-Vitamin-C-3_-Niacinamide-2_-Mandarin-Orange-Fruit-Extract-Serum.jpg"),
                                fit: BoxFit.cover)),
                      ),
                    ),
                   Padding(
                      padding: const EdgeInsets.only(top: 15, left: 0),
                      child: Container(
                        width: 205,
                        height: 150,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://www.soco.id/cdn-cgi/image/w=360,format=auto,dpr=1.25/https://images.soco.id/42118300810-1594108279064.png"),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  ],
                ),
              ),
            
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15, left: 0),
                      child: Container(
                        width: 205,
                        height: 150,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://ingredio.id/wp-content/uploads/2022/06/Skintific-5X-Ceramide-Barrier-Repair-Moisturize-Gel.png"),
                                fit: BoxFit.cover)),
                      ),
                    ),
                   Padding(
                      padding: const EdgeInsets.only(top: 15, left: 0),
                      child: Container(
                        width: 205,
                        height: 150,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://nihonmart.id/pub/media/catalog/product/cache/8a3fa81d90974d9a7299f2eff309979f/s/k/skin_goals_moisture_silk_crem_-_var-min.png"),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  ],
                ),
              ), 
          ],
        ),
      ),
    );
  }
}
