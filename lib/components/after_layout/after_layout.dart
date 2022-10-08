import 'package:flutter/material.dart';
import '../../utils/global_key_ext.dart';

class RenderAfterLayout extends Object {
  final String? key;
  final Size? size;
  final Offset? offset;

  RenderAfterLayout(
    this.key,
    this.size,
    this.offset,
  );

  @override
  String toString() {
    return (key.toString() + '-' + size.toString() + '-' + offset.toString());
  }
}

// 回调函数中返回当下组件的位置信息
class AfterLayout extends StatefulWidget {
  const AfterLayout({
    Key? key,
    required this.callback,
    required this.child,
    this.tag,
  }) : super(key: key);

  final Function(RenderAfterLayout ral) callback;

  final Widget child;

  final String? tag;

  @override
  State<AfterLayout> createState() => _AfterLayoutState();
}

class _AfterLayoutState extends State<AfterLayout> {
  late String _globalKeyStr;
  late GlobalKey _globalKey;

  /// 初始化时调用
  @override
  void initState() {
    super.initState();
    _globalKeyStr = widget.tag ?? widget.child.toString();
    _globalKey = GlobalKey(debugLabel: _globalKeyStr);
    _callBack();
  }

  /// State对象依赖发生变化时调用；系统语言、主题修改，系统也会通知调用
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  /// 新旧Widget的key、runtimeType不变时调用,更新Widget时调用
  @override
  void didUpdateWidget(covariant AfterLayout oldWidget) {
    super.didUpdateWidget(oldWidget);
    debugPrint('didUpdateWidget:${oldWidget.toString()}');
    _callBack();
  }

  /// State在树中移除时调用
  @override
  void deactivate() {
    super.deactivate();
  }

  /// 当widget被销毁时，执行dispose函数释放资源
  @override
  void dispose() {
    super.dispose();
  }

  void _callBack() {
    WidgetsBinding.instance.endOfFrame.then((value) {
      if (mounted) {
        widget.callback(
          RenderAfterLayout(
            _globalKeyStr,
            _globalKey.size,
            _globalKey.position(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: _globalKey,
      child: widget.child,
    );
  }
}
