//tugas pertemuan 35 inherited widget
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main() {
  runApp(
      AppStateWidget(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Cat Store',
            home: MyStorePage(),
          )
      )
  );
}

class AppState {
  AppState({
    required this.productList,
    this.itemsInCart = const <String>{},
  });

  final List<String> productList;
  final Set<String> itemsInCart;

  AppState copyWith({
    List<String>? productList,
    Set<String>? itemsInCart,
  }) {
    return AppState(
      productList: productList ?? this.productList,
      itemsInCart: itemsInCart ?? this.itemsInCart,
    );
  }
}

class AppStateScope extends InheritedWidget {
  AppStateScope(this.data, {Key? key, required Widget child}) : super(key: key, child: child);

  final AppState data;

  static AppState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppStateScope>()!.data;
  }

  @override
  bool updateShouldNotify(AppStateScope oldWidget) {
    return data != oldWidget.data;
  }
}

class AppStateWidget extends StatefulWidget {
  AppStateWidget({required this.child});

  final Widget child;

  static AppStateWidgetState of(BuildContext context) {
    return context.findAncestorStateOfType<AppStateWidgetState>()!;
  }

  @override
  AppStateWidgetState createState() => AppStateWidgetState();
}

class AppStateWidgetState extends State<AppStateWidget> {
  AppState _data = AppState(
    productList: Server.getProductList(),
  );

  void setProductList(List<String> newProductList) {
    if (newProductList != _data.productList) {
      setState(() {
        _data = _data.copyWith(
          productList: newProductList,
        );
      });
    }
  }

  void addToCart(String id) {
    if (!_data.itemsInCart.contains(id)) {
      final Set<String> newItemsInCart = Set<String>.from(_data.itemsInCart);
      newItemsInCart.add(id);
      setState(() {
        _data = _data.copyWith(
          itemsInCart: newItemsInCart,
        );
      });
    }
  }

  void removeFromCart(String id) {
    if (_data.itemsInCart.contains(id)) {
      final Set<String> newItemsInCart = Set<String>.from(_data.itemsInCart);
      newItemsInCart.remove(id);
      setState(() {
        _data = _data.copyWith(
          itemsInCart: newItemsInCart,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppStateScope(
      _data,
      child: widget.child,
    );
  }
}

class MyStorePage extends StatefulWidget {
  MyStorePage({Key? key}) : super(key: key);
  @override
  MyStorePageState createState() => MyStorePageState();
}

class MyStorePageState extends State<MyStorePage> {

  bool _inSearch = false;
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  void _toggleSearch() {
    setState(() {
      _inSearch = !_inSearch;
    });
    _controller.clear();
   
  }

  void _handleSearch() {
    _focusNode.unfocus();
    final String filter = _controller.text;
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: Padding(
                padding: EdgeInsets.all(16.0),
                child: Image.network('https://www.telegraph.co.uk/content/dam/technology/2015/12/11/gmail-envelope_trans_NvBQzQNjv4BqqVzuuqpFlyLIwiB6NTmJwfSVWeZ_vEN7c6bHu2jJnT8.jpg?imwidth=960')
            ),
            title: _inSearch
                ? TextField(
                autofocus: true,
                focusNode: _focusNode,
                controller: _controller,
                onSubmitted: (_) => _handleSearch(),
                decoration: InputDecoration(
                  hintText: 'Search Google Store',
                  prefixIcon: IconButton(icon: Icon(Icons.search), onPressed: _handleSearch),
                  suffixIcon: IconButton(icon: Icon(Icons.close), onPressed: _toggleSearch),
                )
            )
                : null,
            actions: [
              if (!_inSearch) IconButton(onPressed: _toggleSearch, icon: Icon(Icons.search, color: Colors.black)),
              ShoppingCartIcon(),
            ],
            backgroundColor: Colors.purple,
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: ProductListWidget(),
          ),
        ],
      ),
    );
  }
}

class ShoppingCartIcon extends StatelessWidget {
  ShoppingCartIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Set<String> itemsInCart = AppStateScope.of(context).itemsInCart;
    final bool hasPurchase = itemsInCart.length > 0;
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(right: hasPurchase ? 17.0 : 10.0),
          child: Icon(
            Icons.shopping_cart,
            color: Colors.black,
          ),
        ),
        if (hasPurchase)
          Padding(
            padding: const EdgeInsets.only(left: 17.0),
            child: CircleAvatar(
              radius: 8.0,
              backgroundColor: Colors.lightBlue,
              foregroundColor: Colors.white,
              child: Text(
                itemsInCart.length.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class ProductListWidget extends StatelessWidget {
  ProductListWidget({Key? key}) : super(key: key);

  void _handleAddToCart(String id, BuildContext context) {
    AppStateWidget.of(context).addToCart(id);
  }

  void _handleRemoveFromCart(String id, BuildContext context) {
    AppStateWidget.of(context).removeFromCart(id);
  }

  Widget _buildProductTile(String id, BuildContext context) {
    return ProductTile(
      product: Server.getProductById(id),
      purchased: AppStateScope.of(context).itemsInCart.contains(id),
      onAddToCart: () => _handleAddToCart(id, context),
      onRemoveFromCart: () => _handleRemoveFromCart(id, context),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<String> productList = AppStateScope.of(context).productList;
    return Column(
      children: productList.map((String id) =>_buildProductTile(id, context)).toList(),
    );
  }
}

class ProductTile extends StatelessWidget {
  ProductTile({
    Key? key,
    required this.product,
    required this.purchased,
    required this.onAddToCart,
    required this.onRemoveFromCart,
  }) : super(key: key);
  final Product product;
  final bool purchased;
  final VoidCallback onAddToCart;
  final VoidCallback onRemoveFromCart;

  @override
  Widget build(BuildContext context) {
    Color getButtonColor(Set<MaterialState> states) {
      return purchased ? Colors.grey : Colors.black;
    }
    BorderSide getButtonSide(Set<MaterialState> states) {
      return BorderSide(
        color: purchased ? Colors.grey : Colors.black,
      );
    }
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 40,
      ),
      color: Color(0xfff8f8f8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(product.title),
          ),
          Text.rich(
            product.description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: OutlinedButton(
              child: purchased ? const Text("Remove from cart"): const Text("Add to cart"),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.resolveWith(getButtonColor),
                side: MaterialStateProperty.resolveWith(getButtonSide),
              ),
              onPressed: purchased ? onRemoveFromCart : onAddToCart,
            ),
          ),
          Image.network(product.image),
        ],
      ),
    );
  }
}



const Map<String, Product> kDummyData = {
  '0' : Product(
    id: '0',
    title: 'Kucing Scottish Fold',
    description: TextSpan(children: <TextSpan>[
      TextSpan(text: 'Rp25.000.000\n', style: TextStyle(color: Colors.purple)),
      TextSpan(text: 'Dikirim dari Jakarta Selatan.', style: TextStyle(color: Colors.black)),
    ]),
    image: 'https://www.ruparupa.com/blog/wp-content/uploads/2023/05/d-ng-ph-c-h-i-tri-u-hfDv8pW_uvs-unsplash.jpg',
  ),
  '1' : Product(
    id: '1',
    title: 'Kucing Ragdoll',
    description: TextSpan(children: <TextSpan>[
      TextSpan(text: 'Rp1.600.000\n', style: TextStyle(color: Colors.purple)),
      TextSpan(text: 'Dikirim Dari Kota Tangerang.', style: TextStyle(color: Colors.black)),
    ]),
    image: 'https://www.ruparupa.com/blog/wp-content/uploads/2021/03/kanashi-Cy-ISazKvV8-unsplash.jpg',
  ),
  '2' : Product(
    id: '2',
    title: 'Kucing Birman',
    description: TextSpan(children: <TextSpan>[
      TextSpan(text: 'Rp.4.000.000\n', style: TextStyle(color: Colors.purple)),
      TextSpan(text: 'Dikirim dari Kota Malang.', style: TextStyle(color: Colors.black)),
    ]),
    image: 'https://merahputih.com/media/08/b3/74/08b374a769fe310c67c58b3499463a83.jpg',
  ),
  '3' : Product(
    id: '3',
    title: 'Kucing Munchkin',
    description: TextSpan(children: <TextSpan>[
      TextSpan(text: 'RP3.000.000\n', style: TextStyle(color: Colors.purple)),
      TextSpan(text: 'Dikirim dari Kota Yogyakarta.', style: TextStyle(color: Colors.black)),
    ]),
    image: 'https://asset.kompas.com/crops/8pRbsuIDgNvaH0xvWsz1fqeeGfE=/0x64:1000x731/750x500/data/photo/2022/06/12/62a5ceb3e6c3f.jpg',
  ),
};

class Server {
  static Product getProductById(String id) {
    return kDummyData[id]!;
  }

  static List<String> getProductList({String? filter}) {
    if (filter == null)
      return kDummyData.keys.toList();
    final List<String> ids = <String>[];
    for (final Product product in kDummyData.values) {
      if (product.title.toLowerCase().contains(filter.toLowerCase())) {
        ids.add(product.id);
      }
    }
    return ids;
  }
}

class Product {
  const Product({
    required this.id,
    required this.image,
    required this.title,
    required this.description
  });

  final String id;
  final String image;
  final String title;
  final TextSpan description;
}