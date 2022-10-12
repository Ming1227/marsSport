import 'package:flutter/material.dart';
import 'package:mars_sport/network/api.dart';
import 'package:mars_sport/network/base_ft_request.dart';
import 'package:mars_sport/page/tabbar/tabbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Api.initApi();
    baseFTReq.init();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mars Speed',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.white,
      ),
      home: const TabbarPage(),
    );
  }
}
