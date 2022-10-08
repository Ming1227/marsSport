import 'package:flutter/material.dart';
import 'package:mars_sport/page/tabbar/tabbar.dart';

import 'package:saturn_login/saturn_login.dart';

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
    _configLoginModule();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mars Speed',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.white,
      ),
      // home: const SCLoginPage(),
      home: const TabbarPage(),
    );
  }

  void _configLoginModule() {
    final config = SCConfig.instance();
    config.api.login = ((p0) => SCResult.success());
  }
}
