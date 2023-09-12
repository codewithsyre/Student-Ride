import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled001/Screens/booking.dart';
import 'package:untitled001/Screens/login.dart';
import 'package:untitled001/Screens/on_boarding_screen.dart';
import 'package:untitled001/Screens/register.dart';
import 'Providers/user_providers.dart';

late int initScreen;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = (preferences.getInt('initScreen') ??
      0); // Use a default value if not found
  await preferences.setInt('initScreen', 1);

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => UserProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: initScreen == 0 || initScreen == null ? 'onboard' : 'login',
      routes: {
        'register': (context) => Register(),
        'onboard': (context) => OnBoardingScreen(),
        'login': (context) => Login(),
        'booking': (context) => Booking()
      },
    );
  }
}
