import 'package:flutter/material.dart';
import 'package:mars_sport/customer/home_page/match_cell.dart';
import 'package:mars_sport/middleware/match_list/match_out_data.dart';
import 'package:mars_sport/middleware/match_list/match_middleware.dart';
import 'package:mars_sport/utils/consts.dart';

enum HomeMatchType { all, playing }

class MatchInfoPage extends StatefulWidget {
  const MatchInfoPage({
    Key? key,
    this.type = HomeMatchType.all,
  }) : super(key: key);

  final HomeMatchType type;

  @override
  State<MatchInfoPage> createState() => _MatchInfoPageState();
}

class _MatchInfoPageState extends State<MatchInfoPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  List<FTMatchOutData> datas = [];

  @override
  void initState() {
    super.initState();
    matchMiddle.addListener(() {
      datas = matchMiddle.matchs;
      List<FTMatchOutData> temps = [];
      if (widget.type == HomeMatchType.playing) {
        for (final e in matchMiddle.matchs) {
          if (e.status != null && e.status! >= 2 && e.status! <= 7) {
            temps.add(e);
          }
        }
      } else {
        final List<FTMatchOutData> futureMs = [];
        final List<FTMatchOutData> playingMs = [];
        final List<FTMatchOutData> otherMs = [];
        for (final e in matchMiddle.matchs) {
          if (e.status == 1) {
            futureMs.add(e);
          } else if (e.status! >= 2 && e.status! <= 7) {
            playingMs.add(e);
          } else if (e.status == 8) {
            continue;
          } else {
            otherMs.add(e);
          }
        }
        temps = [...playingMs, ...futureMs, ...otherMs];
      }
      datas = temps;
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    debugPrint('info dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    debugPrint('matchInfoPage Build' +
        (widget.type == HomeMatchType.playing ? 'playing' : 'all'));
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
