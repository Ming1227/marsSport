import 'package:flutter/material.dart';
import './after_layout.dart';

// afterlayout的使用Demo
class AfterLayoutPage extends StatefulWidget {
  const AfterLayoutPage({Key? key}) : super(key: key);

  @override
  State<AfterLayoutPage> createState() => _AfterLayoutPageState();
}

class _AfterLayoutPageState extends State<AfterLayoutPage> {
  late ValueNotifier<int> _valueNotifier;

  @override
  void initState() {
    super.initState();
    _valueNotifier = ValueNotifier(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('afterLayout Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder(
              valueListenable: _valueNotifier,
              builder: (ctx, int value, _) {
                return AfterLayout(
                  callback: (RenderAfterLayout ral) {
                    debugPrint(ral.toString());
                  },
                  child: Text(value.toString()),
                );
              },
            ),
            TextButton(
              onPressed: () {
                _valueNotifier.value += 1;
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text('+1'),
              ),
            ),
            TextButton(
              onPressed: () {
                _valueNotifier.value -= 1;
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text('-1'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
