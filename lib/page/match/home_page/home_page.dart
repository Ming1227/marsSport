import 'package:flutter/material.dart';
import 'package:mars_sport/middleware/match_list/match_middleware.dart';

import 'package:mars_sport/page/match/home_page/match_tabs_page/match_attention_page.dart';
import 'package:mars_sport/page/match/home_page/match_tabs_page/match_info_page.dart';
import 'package:mars_sport/page/match/home_page/match_tabs_page/match_result_page.dart';
import 'package:mars_sport/page/match/home_page/match_tabs_page/match_schedule_page.dart';

import 'package:saturn/saturn.dart';

const homeTabs = ['全部', '进行中', '赛程', '赛果', '关注'];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    matchMiddle.reqSaveCurDateMatchList();
    _tabController = TabController(length: homeTabs.length, vsync: this);
    _tabController.addListener(() {
      // 解决点击的时候两次打印的问题
      if (_tabController.index.toDouble() == _tabController.animation?.value) {
        matchMiddle.transfromAndNotify();
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: STButton.icon(
          icon: const Icon(Icons.filter_alt),
          backgroundColor: Colors.transparent,
          onTap: () {},
        ),
        title: const Text('足球'),
        actions: [
          STButton.icon(
            icon: const Icon(Icons.settings_sharp),
            backgroundColor: Colors.transparent,
            onTap: () {},
          )
        ],
        bottom: TabBar(
          tabs: homeTabs.map((e) => Text(e)).toList(),
          controller: _tabController,
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return TabBarView(
      controller: _tabController,
      children: const [
        MatchInfoPage(),
        MatchInfoPage(type: HomeMatchType.playing),
        MatchSchedulePage(),
        MatchResultPage(),
        MatchAttentionPage(),
      ],
    );
  }
}
