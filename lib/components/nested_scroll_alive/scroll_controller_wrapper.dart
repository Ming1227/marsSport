import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mars_sport/customer/detail_page/detail_header.dart';

// 实现scrollController的类
class ScrollControllerWrapper implements ScrollController {
  static int index = 1;
  int code = index++;

  late ScrollController inner;

  ScrollPosition? interceptedAttachPosition; //拦截的position
  ScrollPosition? lastPosition;

  bool showing = true;

  @override
  void addListener(listener) {
    inner.addListener(listener);
  }

  @override
  Future<void> animateTo(double offset, {Duration? duration, Curve? curve}) =>
      inner.animateTo(offset,
          duration: duration ?? const Duration(milliseconds: 200),
          curve: curve ?? Curves.easeInOut);

  @override
  void attach(ScrollPosition position) {
    debugPrint('{$code}:attach start {$showing}');
    if (position == interceptedAttachPosition) debugPrint("attach by inner");
    position.hasListeners;
    debugPrint('{$code}:attach end {$showing}');
    if (inner.positions.contains(position)) return;
    if (showing) {
      final newPosition = position;
      if (newPosition.pixels > 0) {
        newPosition.setPixels(
          // 200 是nestedScroller头部的固定的最大值
          min(position.pixels + DetailHeader.headerMaxHeight,
              position.maxScrollExtent),
        );
      }
      // inner.attach(position);
      inner.attach(newPosition);
      lastPosition = position;
    } else {
      interceptedAttachPosition = position;
    }
  }

  @override
  void detach(ScrollPosition position, {bool fake = false}) {
    assert(() {
      debugPrint('{$code}:detach start {$showing}');
      return true;
    }.call());
    if (fake) debugPrint("detach is innner");
    if (inner.positions.contains(position)) {
      inner.detach(position);
    }
    if (position == interceptedAttachPosition && !fake) {
      debugPrint('{$code}:set null {$showing}');
      interceptedAttachPosition = null;
    }
    if (position == lastPosition && !fake) {
      debugPrint('{$code}:set null {$showing}');
      lastPosition = null;
    }
    if (fake) {
      interceptedAttachPosition = position;
    }
    assert(() {
      debugPrint('{$code}:detach end {$showing}');
      return true;
    }.call());
  }

  void onAttachChange(bool b) {
    debugPrint('{$code}:change{$b}');
    showing = b;
    if (!showing) {
      if (lastPosition != null) {
        detach(lastPosition!, fake: true);
      }
    } else {
      if (interceptedAttachPosition != null) {
        attach(interceptedAttachPosition!);
      }
    }
  }

  @override
  ScrollPosition createScrollPosition(ScrollPhysics physics,
          ScrollContext context, ScrollPosition? oldPosition) =>
      inner.createScrollPosition(physics, context, oldPosition);

  @override
  void debugFillDescription(List<String> description) =>
      inner.debugFillDescription(description);

  @override
  String? get debugLabel => inner.debugLabel;

  @override
  void dispose() => inner.dispose();

  @override
  bool get hasClients => inner.hasClients;

  @override
  bool get hasListeners => inner.hasListeners;

  @override
  double get initialScrollOffset => inner.initialScrollOffset;

  @override
  void jumpTo(double value) => inner.jumpTo(value);

  @override
  bool get keepScrollOffset => inner.keepScrollOffset;

  @override
  void notifyListeners() => inner.notifyListeners();

  @override
  double get offset => inner.offset;

  @override
  ScrollPosition get position => inner.position;

  @override
  Iterable<ScrollPosition> get positions => inner.positions;

  @override
  void removeListener(listener) => inner.removeListener(listener);

  @override
  int get hashCode => inner.hashCode;

  @override
  bool operator ==(other) {
    return hashCode == (other.hashCode);
  }
}
