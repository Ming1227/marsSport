import 'package:flutter/material.dart';

import 'package:saturn/saturn.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: STButton.icon(
          icon: const Icon(Icons.filter_alt),
          backgroundColor: Colors.transparent,
          onTap: () {},
        ),
        title: const Text('足球'),
        actions: [
          STButton.icon(
            icon: const Icon(Icons.settings_sharp),
            backgroundColor: Colors.transparent,
            onTap: () {},
          )
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container();
  }
}

//  ListView.separated(
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             behavior: HitTestBehavior.translucent,
//             onTap: () {
//               debugPrint('点击进入详情页');
//             },
//             child: Container(
//               height: 50,
//               padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text('$index'),
//                   const Text('赛事信息'),
//                   index % 2 == 0 ? const Text('直播中') : const Text('已结束'),
//                 ],
//               ),
//             ),
//           );
//         },
//         itemCount: 8,
//         separatorBuilder: (context, index) {
//           return Container(
//             height: 1,
//             color: Colors.grey,
//           );
//         },
//       )