import 'package:flutter/material.dart';

import 'package:mars_sport/page/match/home_page/home_page.dart';
import 'package:mars_sport/page/news/news_page.dart';
import 'package:mars_sport/page/person/person_page.dart';

import 'package:saturn/saturn.dart';

class TabbarPage extends StatefulWidget {
  static const routeName = '/tabbar';

  const TabbarPage({Key? key}) : super(key: key);

  @override
  State<TabbarPage> createState() => _TabbarPageState();
}

class _TabbarPageState extends State<TabbarPage> {
  @override
  Widget build(BuildContext context) {
    return const STTabbar(
      pages: [
        HomePage(),
        NewsPage(),
        PersonPage(),
      ],
      items: [
        STBottomNavigationBarItem(
          icon: Icon(STIcons.commonly_home_outline),
          label: '比赛',
        ),
        STBottomNavigationBarItem(
          icon: Icon(STIcons.label_fire_outline),
          label: '资讯',
        ),
        STBottomNavigationBarItem(
          icon: Icon(STIcons.commonly_user_outline),
          label: '我的',
        ),
      ],
    );
  }
}
