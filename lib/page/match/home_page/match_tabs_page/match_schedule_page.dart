import 'package:flutter/material.dart';
import 'package:mars_sport/customer/home_page/match_cell.dart';
import 'package:mars_sport/middleware/match_list/match_middleware.dart';
import 'package:mars_sport/middleware/match_list/match_out_data.dart';
import 'package:mars_sport/utils/consts.dart';

import 'package:saturn/saturn.dart';

class MatchSchedulePage extends StatefulWidget {
  const MatchSchedulePage({Key? key}) : super(key: key);

  @override
  State<MatchSchedulePage> createState() => _MatchSchedulePageState();
}

class _MatchSchedulePageState extends State<MatchSchedulePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  List<FTMatchOutData> datas = [];

  final weekDays = ['今天', '星期二', '星期三', '星期四', '星期五', '星期六', '星期日'];

  @override
  void initState() {
    super.initState();
    matchMiddle.addListener(() {
      datas = matchMiddle.matchs;
      final List<FTMatchOutData> futureMs = [];
      final List<FTMatchOutData> delayMs = [];
      final List<FTMatchOutData> cancelMs = [];
      final List<FTMatchOutData> determinedMs = [];
      for (final e in matchMiddle.matchs) {
        if (e.status == 1) {
          futureMs.add(e);
        } else if (e.status == 9) {
          delayMs.add(e);
        } else if (e.status == 12) {
          cancelMs.add(e);
        } else if (e.status == 13) {
          determinedMs.add(e);
        }
      }
      datas = [...futureMs, ...delayMs, ...cancelMs, ...determinedMs];
      setState(() {});
    });
  }

  @override
  void dispose() {
    debugPrint('schedule dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: STMenu(
                initIndex: 1,
                items: weekDays.map((e) => STMenuDataItem(title: e)).toList(),
              ),
            ),
            STDatePicker(
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(Icons.calendar_month_outlined),
              ),
              minimumYear: 2020,
              onDateTimeChanged: (date) {},
            ),
          ],
        ),
        Expanded(
            child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          children: weekDays.map((_) => buildContent()).toList(),
        ))
      ],
    );
  }

  Widget buildContent() {
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
