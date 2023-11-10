import 'package:flutter/material.dart';
//import 'satu.dart';



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
   return Scaffold(
         body: ListView(
            children: [
              
                    
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
                                    "https://1.bp.blogspot.com/-n1oFn1YmKZ4/YMcQtc-3HrI/AAAAAAAAKHo/vYvg2yiAyzgHI0seidujms3c95RtGU4WACLcBGAsYHQ/s1250/avoskin-your-skin-bae.png"),
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
     // ),
    );
  }
}
