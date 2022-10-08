import 'package:flutter/material.dart';
import 'package:mars_sport/components/nested_scroll_alive/primary_scroll_container.dart';
import 'package:mars_sport/customer/detail_page/detail_header.dart';
import 'package:mars_sport/customer/detail_page/scroll_delegate_header.dart';
import '../detail_page/detail_tabbar_view.dart';

const List<String> _tabValues = [
  '直播',
  '聊天',
  '阵容',
  '指数',
  '预测',
  '动态',
  '数据',
  '会员',
];

class DetailHomePage extends StatefulWidget {
  const DetailHomePage({Key? key}) : super(key: key);

  @override
  State<DetailHomePage> createState() => _DetailHomePageState();
}

class _DetailHomePageState extends State<DetailHomePage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late List<GlobalKey> _scrollKeys;
  late GlobalKey _nestedKey;

  /// 某些tab时固定头部
  late ValueNotifier<int> _currentTabNotifier;
  @override
  void initState() {
    super.initState();
    _currentTabNotifier = ValueNotifier(0);
    _tabController = TabController(length: _tabValues.length, vsync: this);
    _scrollKeys = _tabValues.map((e) => GlobalKey(debugLabel: e)).toList();
    _nestedKey = GlobalKey(debugLabel: 'nested');
    _tabController.addListener(() {
      /// 解决点击的时候两次打印的问题
      if (_tabController.index.toDouble() == _tabController.animation?.value) {
        /// nestedScrollView body内滑动问题
        for (var i = 0; i < _scrollKeys.length; i++) {
          GlobalKey _key = _scrollKeys[i];
          if (_key.currentState != null) {
            if (_key.currentState is PrimaryScrollContainerState) {
              (_key.currentState as PrimaryScrollContainerState)
                  .onPageChange(_tabController.index == i);
            }
          }
        }

        if (_tabController.index != _currentTabNotifier.value) {
          _currentTabNotifier.value = _tabController.index;

          /// nestedScrollView header滑动问题
          if (_nestedKey.currentState is NestedScrollViewState) {
            final nestedScroViewState =
                _nestedKey.currentState as NestedScrollViewState;
            nestedScroViewState.outerController.position.setPixels(0);
          }
        }
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
    return Material(
      child: NestedScrollView(
        key: _nestedKey,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            ValueListenableBuilder(
                valueListenable: _currentTabNotifier,
                builder: (cnt, int _current, _) {
                  return ScrollDelegateHeader(
                    minExtent: _current == 1
                        ? DetailHeader.headerMaxHeight
                        : DetailHeader.headerMinHeight,
                    maxExtent: DetailHeader.headerMaxHeight,
                    builder: (cnt, offset, _) {
                      return DetailHeader(
                        offset: offset,
                        tabValues: _tabValues,
                        tabController: _tabController,
                      );
                    },
                  );
                })
          ];
        },
        body: DetailTabBarView(
          tabValues: _tabValues,
          scrollKeys: _scrollKeys,
          tabController: _tabController,
        ),
      ),
    );

    // return Scaffold(
    //   appBar: AppBar(
    //     bottom: TabBar(
    //       tabs: _tabValues.map((e) => Text(e)).toList(),
    //       controller: _tabController,
    //     ),
    //   ),
    //   body: DetailTabBarView(
    //     tabValues: _tabValues,
    //     tabController: _tabController,
    //   ),
    // );
  }
}
