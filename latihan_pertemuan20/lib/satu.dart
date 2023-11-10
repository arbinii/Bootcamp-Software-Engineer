import 'package:flutter/material.dart';
    
    void main() {
      runApp(MaterialApp(
        //menghilangkan label debug di kanan atas
        debugShowCheckedModeBanner: false,
        title: "Latihan List View",
        home: MyApp(),
      ));
    }
    
    class MyApp extends StatefulWidget {
      const MyApp({Key? key}) : super(key: key);
    
      @override
      _MyAppState createState() => _MyAppState();
    }
    
    class _MyAppState extends State<MyApp> {
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            // membuat title app bar berada di tengah atas
            title: Center(child: Text("News App")),
          ),
          //bungkus semua widget di dengan listview terlebih dahulu
          //widget di dalam listview seperti padding, singlechildscrollview, dan listview
          body: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20, left: 15),
                child: Text("Headline News"),
              ),
              //singlechildscrollview berfungsi untuk membuat widget dapat discroll
              //fungsinya hampir sama dengan listview
              SingleChildScrollView(
                //untuk merubah arah scroll menjadi ke kanan
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15, left: 15),
                      child: Container(
                        width: 200,
                        height: 150,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://cdn.pixabay.com/photo/2016/10/19/08/57/mountains-1752433__340.jpg"),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, left: 15),
                      child: Container(
                        width: 200,
                        height: 150,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://cdn.pixabay.com/photo/2016/08/27/14/38/mountains-1624284__340.jpg"),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 15),
                child: Text("List All News"),
              ),
    
              //membuat listview di dalam listview
              //perhatikan beberapa properti di dalamnya untuk menghidnari error
              ListView(
                //Jika tidak menyetel properti shrinkWrap, ListView akan sebesar induknya.
                //Jika menyetelnya ke true, maka besarnya akan menyesuaikan dengan ukuran content di dalamnya
                shrinkWrap: true,
    
                //membuat widget tidak dapat discroll sendiri
                //scrolling mengikuti parent
                physics: NeverScrollableScrollPhysics(),
    
                children: [
                  ListTile(
                      leading: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            image: DecorationImage(
                                image: NetworkImage("https://cdn.pixabay.com/photo/2016/11/23/18/29/cloudy-1854241__340.jpg"),
                                fit: BoxFit.cover)),
                      ),
                      title: Text("judul pertama"),
                      subtitle: Text("deskripsi pertama"),
                      trailing: Icon(Icons.bookmark)
                  ), 
                  ListTile(
                      leading: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            image: DecorationImage(
                                image: NetworkImage("https://cdn.pixabay.com/photo/2016/11/23/18/29/cloudy-1854241__340.jpg"),
                                fit: BoxFit.cover)),
                      ),
                      title: Text("judul kedua"),
                      subtitle: Text("deskripsi kedua"),
                      trailing: Icon(Icons.bookmark)
                  )
                ],
              ),
            ],
          ),
        );
      }
    }