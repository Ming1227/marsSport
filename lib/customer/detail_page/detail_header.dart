import 'package:flutter/material.dart';
import 'package:saturn/saturn.dart';

class DetailHeader extends StatefulWidget {
  static const headerMaxHeight = 200.0;
  static const headerMinHeight = 120.0;

  const DetailHeader({
    Key? key,
    required this.offset,
    required this.tabValues,
    this.tabController,
  }) : super(key: key);

  final double offset;
  final List<String> tabValues;
  final TabController? tabController;

  @override
  _DetailHeaderState createState() => _DetailHeaderState();
}

class _DetailHeaderState extends State<DetailHeader>
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
    return Container(
      color: Colors.green,
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          Positioned(
            top: MediaQuery.of(context).padding.top,
            left: 0,
            child: STButton.icon(
              icon: const Icon(STIcons.direction_arrowleft),
              backgroundColor: Colors.transparent,
              onTap: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Material(
              color: Colors.yellow,
              child: TabBar(
                tabs: widget.tabValues.map((e) => Text(e)).toList(),
                controller: _tabController,
                indicatorColor: Colors.red,
                indicatorSize: TabBarIndicatorSize.tab,
                isScrollable: true,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                indicatorWeight: 2.0,
                indicatorPadding: const EdgeInsets.symmetric(horizontal: 16),
                labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                unselectedLabelStyle:
                    const TextStyle(fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
