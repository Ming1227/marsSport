import 'package:flutter/material.dart';
import 'package:mars_sport/customer/home_page/match_cell.dart';
import 'package:mars_sport/middleware/match_list/match_middleware.dart';
import 'package:mars_sport/middleware/match_list/match_out_data.dart';
import 'package:mars_sport/utils/consts.dart';

class MatchResultPage extends StatefulWidget {
  const MatchResultPage({Key? key}) : super(key: key);

  @override
  State<MatchResultPage> createState() => _MatchResultPageState();
}

class _MatchResultPageState extends State<MatchResultPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  List<FTMatchOutData> datas = [];

  @override
  void initState() {
    super.initState();
    matchMiddle.addListener(() {
      datas = matchMiddle.matchs;
      final List<FTMatchOutData> temps = [];
      for (final e in matchMiddle.matchs) {
        if (e.status == 8) {
          temps.add(e);
        }
      }
      datas = [...temps];
      setState(() {});
    });
  }

  @override
  void dispose() {
    debugPrint('result dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      color: homeMacthInfoColor,
      child: ListView.separated(
        itemBuilder: ((context, index) {
          FTMatchOutData match = datas[index];
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            child: MSFTMatchCell(match: match),
            onTap: () {},
          );
        }),
        separatorBuilder: ((context, index) {
          return const SizedBox(height: 4);
        }),
        itemCount: datas.length,
      ),
    );
  }
}
