import 'package:flutter/material.dart';
import 'package:mars_sport/components/nested_scroll_alive/primary_scroll_container.dart';
import './sub_page/detail_sub_page.dart';

class DetailTabBarView extends StatefulWidget {
  const DetailTabBarView({
    Key? key,
    required this.tabValues,
    required this.scrollKeys,
    this.tabController,
  }) : super(key: key);

  final List<String> tabValues;
  final List<GlobalKey> scrollKeys;
  final TabController? tabController;

  @override
  State<DetailTabBarView> createState() => _DetailTabBarViewState();
}

class _DetailTabBarViewState extends State<DetailTabBarView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = widget.tabController ??
        TabController(
          length: widget.tabValues.length,
          vsync: this,
        );
  }

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: _tabController,
      children: widget.scrollKeys.map((e) {
        return PrimaryScrollContainer(
          key: e,
          child: const DetailSubPage(),
        );
      }).toList(),
    );
  }
}
