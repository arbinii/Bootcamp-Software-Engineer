import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/services.dart';
import 'pages/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(LoginUiApp());
}

class LoginUiApp extends StatefulWidget {
  const LoginUiApp({super.key});

  @override
  State<LoginUiApp> createState() => _LoginUiAppState();
}


class _LoginUiAppState extends State<LoginUiApp>
with TickerProviderStateMixin {


  @override
  void initState() {
    super.initState();
     print('initstate()');
      SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,

  ]);
  }

  @override
  void dispose() {
    print ('disose()');
     SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
  ]);
    super.dispose();
  }


  Color _primaryColor = HexColor('#FFFFFF');
  Color _accentColor = HexColor('#FFFFFF');


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Skincare Daily',
      theme: ThemeData(
        primaryColor: _primaryColor,
        scaffoldBackgroundColor: Color.fromARGB(243, 202, 146, 236), 
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey).copyWith(secondary: _accentColor),
      ),
      home: SplashScreen(title: 'Skincare Daily'),
    );
  }
}


