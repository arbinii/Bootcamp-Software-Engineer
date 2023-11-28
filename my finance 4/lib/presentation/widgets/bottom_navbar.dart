import 'package:MyFinance/presentation/screens/home.dart';
import 'package:MyFinance/presentation/screens/search_screen.dart';
import 'package:MyFinance/presentation/screens/setting_screen.dart';
import 'package:MyFinance/presentation/screens/statistic.dart';
import 'package:flutter/material.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';

class Bottom extends StatefulWidget {
  const Bottom({Key? key}) : super(key: key);

  @override
  _BottomState createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int indexColor = 0;
  final List<Widget> screens = const [
    Home(),
    Statistics(),
    SearchScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MoltenBottomNavigationBar(
        barColor: Color.fromRGBO(24, 165, 167, 1),
        domeCircleColor: Colors.white,
        selectedIndex: indexColor,
        onTabChange: (clickedIndex) {
          setState(() {
            indexColor = clickedIndex;
          });
        },
        tabs: [
          MoltenTab(
            icon: Icon(
              Icons.home_filled,
              color: Colors.black,
            ),
          ),
          MoltenTab(
            icon: Icon(Icons.stacked_bar_chart_rounded, color: Colors.black),
          ),
          MoltenTab(
            icon: Icon(Icons.search, color: Colors.black),
          ),
          MoltenTab(
              icon: Icon(Icons.account_circle_rounded, color: Colors.black))
        ],
      ),
      body: screens[indexColor],
    );
  }
}
