import 'package:flutter/material.dart';
import 'package:mars_sport/components/nested_scroll_alive/scroll_controller_wrapper.dart';

class PrimaryScrollContainer extends StatefulWidget {
  const PrimaryScrollContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  State<PrimaryScrollContainer> createState() => PrimaryScrollContainerState();
}

class PrimaryScrollContainerState extends State<PrimaryScrollContainer> {
  late ScrollControllerWrapper _scrollController;

  get scrollController {
    final PrimaryScrollController? primaryScrollController =
        context.dependOnInheritedWidgetOfExactType<PrimaryScrollController>();
    if (primaryScrollController != null) {
      _scrollController.inner = primaryScrollController.controller!;
    }
    return _scrollController;
  }

  @override
  void initState() {
    _scrollController = ScrollControllerWrapper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PrimaryScrollControllerWrapper(
      child: widget.child,
      scrollController: scrollController,
    );
  }

  void onPageChange(bool show) {
    _scrollController.onAttachChange(show);
  }
}

class PrimaryScrollControllerWrapper extends InheritedWidget
    implements PrimaryScrollController {
  final ScrollController scrollController;

  const PrimaryScrollControllerWrapper({
    Key? key,
    required Widget child,
    required this.scrollController,
  }) : super(key: key, child: child);

  @override
  get runtimeType => PrimaryScrollController;

  @override
  get controller => scrollController;

  @override
  bool updateShouldNotify(PrimaryScrollControllerWrapper oldWidget) =>
      controller != oldWidget.controller;
}
