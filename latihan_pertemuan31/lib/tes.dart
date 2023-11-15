import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


List<String> description =
   ['Avoskin Glow Up Set! Vitamin C Series.The Your Skin Bae Series series contains vitamin C which works to inhibit the production and accumulation of melanin in the skin, so it effectively brightens facial skin. Apart from brightening, these two products can treat acne scars, increase anti-oxidants, and minimize the bad effects of sun exposure. Using this Vitamin C Toner can help maximize the absorption of Vitamin C Serum, so that the results will be more optimal.','COSRX Low pH Good Morning Cleanser is a product from South Korea that uses natural ingredients.Facial cleanser with a gentle formula that is good for use in the morning and evening. Able to clean even sensitive skin gently thanks to its content which has an acid level that is similar to the skin pH level. This gel cleanser is able to soothe, exfoliate, moisturize and clean facial skin. This facial cleanser is also able to remove dead skin cells and excess oil that appear during sleep so that the face becomes clean and fresh.','SKINTIFIC 5X Ceramide Barrier Moisturizer Gel-30g - Rainbow.Moisturizer that combines 3 active ingredients of Ceramide, Hyaluronic Acid and Centella Asiatica, to solve damaged skin barrier problems such as acne, redness, textured skin and also dry skin quickly but still safe for skin barriers. Enriched with 5X Ceramide technology, which is a combination of 5 types of Ceramide to deeply moisturize and strengthen skin layers. This 5X Ceramide helps to repair and protect the skin barrier by maintaining moisture and protecting the skin from external factors.', 'SOMETHINC SKIN GOALS Moisture Silk Cremè 50ml.Super light vegan gel-cream moisturizer with 5X Brightening POWER to brighten skin & disguise black spots in 28 days. Equipped with 3D Aqua Seal Technology which provides moisture, strengthens the skin barrier, makes skin smoother, supple and radiant.'];
List<String> url = [
  'https://1.bp.blogspot.com/-n1oFn1YmKZ4/YMcQtc-3HrI/AAAAAAAAKHo/vYvg2yiAyzgHI0seidujms3c95RtGU4WACLcBGAsYHQ/s1250/avoskin-your-skin-bae.png',
  'https://www.soco.id/cdn-cgi/image/w=360,format=auto,dpr=1.25/https://images.soco.id/42118300810-1594108279064.png',
  'https://ingredio.id/wp-content/uploads/2022/06/Skintific-5X-Ceramide-Barrier-Repair-Moisturize-Gel.png',
  'https://nihonmart.id/pub/media/catalog/product/cache/8a3fa81d90974d9a7299f2eff309979f/s/k/skin_goals_moisture_silk_crem_-_var-min.png'
];
int ind=0;
class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SingleChildScrollView(
         scrollDirection: Axis.vertical,
        child: 
          Column(
          
          children: [
             Padding(
                  padding: const EdgeInsets.all(20.10),
                  child: Text("Get Product Recommendations For Your Skin Type"),
                ),
                  for (int i = 0; i < url.length; i++)
                    GestureDetector(
                        onTap: () {
                          ind = i;
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SecondScreen()),
                          );
                        },
                  child: Image(
                    
                    image: NetworkImage(url[i]),
                    
                  )),
                ],
              ),
             ),
          );
        }
      }

class Article {
  final String url;
  Article({required this.url});
}
class ArticleItem extends StatelessWidget {
  final Article article;

  ArticleItem({required this.article});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.network(
          article.url,
          width: 60,
          height: 50,
          fit: BoxFit.cover,
        ),  
      ],
    );
  }
}
class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // floatingActionButton: FloatingActionButton(
        //     child: Icon(CupertinoIcons.arrow_left),
        //     onPressed: () {
        //       Navigator.pop(context);
        //     }),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(243, 202, 146, 236),
          title: Text("Product details"),
        ),
        body: ListView(children: [
          Image(image: NetworkImage(url[ind])),
          Center(
              child: Text('Product details',
                  style: TextStyle(color: Colors.black), textScaleFactor: 2)),
          Card(child: Text(description[ind]), margin: EdgeInsets.all(50)),
        ]));
  }
}