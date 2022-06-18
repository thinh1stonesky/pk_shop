import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pk_shop/provider/order_provider.dart';
import 'package:pk_shop/provider/review_cart_provider.dart';
import 'package:pk_shop/provider/sanpham_provider.dart';
import 'package:pk_shop/provider/user_provider.dart';
import 'package:pk_shop/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SanPhamProvider(),),
        ChangeNotifierProvider(
          create: (context) => UserProvider(),),
        ChangeNotifierProvider(
          create: (context) => ReviewCartProvider(),),
        ChangeNotifierProvider(
          create: (context) => OrderProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PK Shop App',
        theme: ThemeData(

          primarySwatch: Colors.grey,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
