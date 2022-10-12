import 'package:flutter/material.dart';

class MatchResultPage extends StatefulWidget {
  const MatchResultPage({Key? key}) : super(key: key);

  @override
  State<MatchResultPage> createState() => _MatchResultPageState();
}

class _MatchResultPageState extends State<MatchResultPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('赛果'),
    );
  }
}
