import 'package:flutter/material.dart';
import 'package:mars_sport/utils/consts.dart';

class MSAnimateMinutes extends StatefulWidget {
  const MSAnimateMinutes({Key? key}) : super(key: key);

  @override
  State<MSAnimateMinutes> createState() => _MSAnimateMinutesState();
}

class _MSAnimateMinutesState extends State<MSAnimateMinutes>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
      setState(() {});
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _controller.value,
      child: Text(
        '\'',
        style: smallRedTS,
      ),
    );
  }
}
