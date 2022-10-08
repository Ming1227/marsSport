import 'package:flutter/material.dart';

extension BuildContentExt on BuildContext {
  /// 获取当前组件的 RenderBox
  RenderBox? renderBox() {
    if (findRenderObject() is RenderBox) {
      return findRenderObject() as RenderBox;
    }
    return null;
  }

  /// 获取当前组件的position
  Offset? position({Offset offset = Offset.zero}) {
    return renderBox()?.localToGlobal(offset);
  }
}

extension GlobalKeyExt on GlobalKey {
  /// 获取当前组件的RenderBox
  RenderBox? renderBox() => currentContext?.renderBox();

  /// 获取当前组件的position
  Offset? position({Offset offset = Offset.zero}) {
    return currentContext?.position(offset: offset);
  }

  /// 获取当前组件的size
  Size? get size => currentContext?.size;
}
