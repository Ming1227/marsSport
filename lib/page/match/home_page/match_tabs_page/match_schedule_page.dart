import 'package:flutter/material.dart';

class MatchSchedulePage extends StatefulWidget {
  const MatchSchedulePage({Key? key}) : super(key: key);

  @override
  State<MatchSchedulePage> createState() => _MatchSchedulePageState();
}

class _MatchSchedulePageState extends State<MatchSchedulePage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('赛程'),
    );
  }
}
