import 'package:flutter/material.dart';

typedef HeaderBuilder = Widget Function(
    BuildContext context, double shrinkOffset, bool overlapsContent);

class ScrollDelegateHeader extends StatelessWidget {
  final double maxExtent;
  final double minExtent;
  final HeaderBuilder builder;

  const ScrollDelegateHeader(
      {Key? key,
      this.maxExtent = 80,
      this.minExtent = 80,
      required this.builder})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: _ScrollNavHeaderDelegate(maxExtent, minExtent, builder),
      pinned: true,
    );
  }
}

class _ScrollNavHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double maxE;
  final double minE;
  final HeaderBuilder builder;

  _ScrollNavHeaderDelegate(this.maxE, this.minE, this.builder);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return builder(context, shrinkOffset, overlapsContent);
  }

  @override
  double get maxExtent => maxE;

  @override
  double get minExtent => minE;

  @override
  bool shouldRebuild(covariant _ScrollNavHeaderDelegate oldDelegate) {
    return maxE != oldDelegate.maxE ||
        minE != oldDelegate.minE ||
        builder != oldDelegate.builder;
  }
}
