import 'package:flutter/material.dart';
import 'package:flutter_bloc_test/pages/home_route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:
        HomeRoute(title: 'Flutter Demo Home Page'),
      // routes: {
      //   '/': (context) => MyHomePage(),
      //   '/detail': (context) => MyDetailPage(),
      // },
    );
  }
}



