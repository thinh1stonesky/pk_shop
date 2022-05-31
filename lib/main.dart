import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pk_shop/auth/sign_in.dart';
import 'package:pk_shop/screens/home/home_screen.dart';
import 'package:pk_shop/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PK Shop App',
      theme: ThemeData(

        primarySwatch: Colors.grey,
      ),
      home: const HomeScreen(),
    );
  }
}
