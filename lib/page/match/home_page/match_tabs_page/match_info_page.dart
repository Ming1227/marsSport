import 'package:flutter/material.dart';
import 'package:mars_sport/middleware/match_list/match_out_data.dart';
import 'package:mars_sport/middleware/match_list/match_middleware.dart';

import 'package:saturn/saturn.dart';

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

const redColor = Colors.red;
const whiteColor = Colors.white;
final grey400Color = Colors.grey.shade400;
final yellow700Color = Colors.yellow.shade700;
final homeMacthInfoColor = Colors.grey.shade200;
final smallRedTS = TextStyle(color: Colors.red.shade400, fontSize: 12);
final smallGreyTS = TextStyle(color: grey400Color, fontSize: 12);
const smallWhiteTS = TextStyle(color: whiteColor, fontSize: 12);

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
      if (widget.type == HomeMatchType.playing) {
        List<FTMatchOutData> temps = [];
        for (final e in matchMiddle.matchs) {
          if (e.status != null && e.status! >= 2 && e.status! <= 7) {
            debugPrint(e.status.toString());
            temps.add(e);
          }
        }
        datas = temps;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    matchMiddle.dispose();
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
          FTMatchOutData data = datas[index];
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            child: _matchInfoItem(data),
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

  Widget? _matchInfoItem(FTMatchOutData match) {
    return Container(
      color: whiteColor,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      height: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          firstRow(match),
          secondRow(match),
          Row(
            children: [
              const Spacer(flex: 9),
              Text(match.halfScore, style: smallGreyTS),
              const Spacer(flex: 1),
              Text(match.cornerScore, style: smallGreyTS),
              const Spacer(flex: 9),
            ],
          ),
        ],
      ),
    );
  }

  Widget firstRow(FTMatchOutData match) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Text(match.leagueName ?? '', style: smallRedTS),
              const Spacer(flex: 1),
              Text(match.beginTime ?? '', style: smallGreyTS),
              const Spacer(flex: 3)
            ],
          ),
        ),
        Text(match.time ?? '', style: smallRedTS),
        Expanded(
          child: Row(
            children: [
              const Spacer(flex: 3),
              Text(match.hasSquad ?? false ? '阵容' : '', style: smallRedTS),
              const Spacer(flex: 1),
              Text(match.hasInformation ?? false ? '情报' : '999+',
                  style: smallRedTS),
            ],
          ),
        )
      ],
    );
  }

  Widget secondRow(FTMatchOutData match) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              STButton.icon(
                icon: Icon(
                  Icons.star,
                  color: grey400Color,
                ),
                padding: EdgeInsets.zero,
                backgroundColor: Colors.transparent,
                onTap: () {
                  // 点击切换为关注
                },
              ),
              const Spacer(flex: 5),
              _homeAwayMatchInfo(true, match),
              const Spacer(flex: 1),
            ],
          ),
        ),
        Text(match.score, style: const TextStyle(color: redColor)),
        Expanded(
            child: Row(
          children: [
            const Spacer(flex: 1),
            _homeAwayMatchInfo(false, match),
            const Spacer(flex: 5),
            if (match.hasAnimation ?? false)
              const Icon(Icons.live_tv, color: redColor),
          ],
        )),
      ],
    );
  }

  Widget _homeAwayMatchInfo(bool isHome, FTMatchOutData match) {
    return Row(
      children: [
        if (isHome && match.homeRedCard != null) //主队红牌
          Container(
            decoration: BoxDecoration(
              color: redColor,
              borderRadius: BorderRadius.circular(2),
            ),
            padding: const EdgeInsets.all(2),
            child: Text(match.homeRedCard!, style: smallWhiteTS),
          ),
        if (isHome && match.homeYellowCard != null) // 主队黄牌
          Container(
            decoration: BoxDecoration(
              color: yellow700Color,
              borderRadius: BorderRadius.circular(2),
            ),
            padding: const EdgeInsets.all(2),
            child: Text(match.homeYellowCard!, style: smallWhiteTS),
          ),
        if (isHome && match.homeRank != null) // 主队排名
          Text(match.homeRank!, style: smallGreyTS),
        Text(isHome ? match.homeName ?? '' : match.awayName ?? ''),
        if (!isHome && match.awayRank != null) // 客队排名
          Text(match.awayRank!, style: smallGreyTS),
        if (!isHome && match.awayYellowCard != null) // 客队黄牌
          Container(
            decoration: BoxDecoration(
              color: yellow700Color,
              borderRadius: BorderRadius.circular(2),
            ),
            padding: const EdgeInsets.all(2),
            child: Text(match.awayYellowCard!, style: smallWhiteTS),
          ),
        if (!isHome && match.awayRedCard != null) //客队红牌
          Container(
            decoration: BoxDecoration(
              color: redColor,
              borderRadius: BorderRadius.circular(2),
            ),
            padding: const EdgeInsets.all(2),
            child: Text(match.awayRedCard!, style: smallWhiteTS),
          ),
      ],
    );
  }
}
