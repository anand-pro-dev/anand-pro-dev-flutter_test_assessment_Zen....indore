import 'package:flutter/material.dart';
import 'package:working_app/provider/home_provider.dart';
import 'package:working_app/provider/login_provider.dart';
import 'package:working_app/screens/home_screen.dart';
import 'package:working_app/screens/login_screen.dart';
import 'package:working_app/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DataProvider()),
        ChangeNotifierProvider(create: (_) => logInProvier()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Machine test',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
          // useMaterial3: true,
        ),
        home: SplashScreen(),
        // home: LoginScreen(),
        // home: HomeScreen(),
      ),
    );
  }
}
