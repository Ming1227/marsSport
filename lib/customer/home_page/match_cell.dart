import 'package:flutter/material.dart';
import 'package:mars_sport/customer/home_page/animate_minutes.dart';
import 'package:mars_sport/middleware/match_list/match_out_data.dart';
import 'package:mars_sport/utils/consts.dart';

import 'package:saturn/saturn.dart';

class MSFTMatchCell extends StatelessWidget {
  const MSFTMatchCell({Key? key, this.match}) : super(key: key);

  final FTMatchOutData? match;

  @override
  Widget build(BuildContext context) {
    if (match == null) return const SizedBox();
    return Container(
      color: whiteColor,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      height: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          firstRow(),
          secondRow(),
          Row(
            children: [
              const Spacer(flex: 9),
              Text(match!.halfScore, style: smallGreyTS),
              const Spacer(flex: 1),
              Text(match!.cornerScore, style: smallGreyTS),
              const Spacer(flex: 9),
            ],
          ),
        ],
      ),
    );
  }

  Widget firstRow() {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Text(match?.leagueName ?? '', style: smallRedTS),
              const Spacer(flex: 1),
              Text(match?.beginTime ?? '', style: smallGreyTS),
              const Spacer(flex: 3)
            ],
          ),
        ),
        Text(match!.time ?? '', style: smallRedTS),
        if (match!.status == 2 || match!.status == 4 || match!.status == 5)
          const MSAnimateMinutes(),
        Expanded(
          child: Row(
            children: [
              const Spacer(flex: 3),
              Text(match?.hasSquad ?? false ? '阵容' : '', style: smallRedTS),
              const Spacer(flex: 1),
              Text(match?.hasInformation ?? false ? '情报' : '999+',
                  style: smallRedTS),
            ],
          ),
        )
      ],
    );
  }

  Widget secondRow() {
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
              _homeAwayMatchInfo(true),
              const Spacer(flex: 1),
            ],
          ),
        ),
        Text(match?.score, style: const TextStyle(color: redColor)),
        Expanded(
            child: Row(
          children: [
            const Spacer(flex: 1),
            _homeAwayMatchInfo(false),
            const Spacer(flex: 5),
            if (match?.hasAnimation ?? false)
              const Icon(Icons.live_tv, color: redColor),
          ],
        )),
      ],
    );
  }

  Widget _homeAwayMatchInfo(bool isHome) {
    return Row(
      children: [
        if (isHome && match!.homeRedCard != null) //主队红牌
          Container(
            decoration: BoxDecoration(
              color: redColor,
              borderRadius: BorderRadius.circular(2),
            ),
            padding: const EdgeInsets.all(2),
            child: Text(match!.homeRedCard!, style: smallWhiteTS),
          ),
        if (isHome && match!.homeYellowCard != null) // 主队黄牌
          Container(
            decoration: BoxDecoration(
              color: yellow700Color,
              borderRadius: BorderRadius.circular(2),
            ),
            padding: const EdgeInsets.all(2),
            child: Text(match!.homeYellowCard!, style: smallWhiteTS),
          ),
        if (isHome && match!.homeRank != null) // 主队排名
          Text(match!.homeRank!, style: smallGreyTS),
        Text(isHome ? match!.homeName ?? '' : match!.awayName ?? ''),
        if (!isHome && match!.awayRank != null) // 客队排名
          Text(match!.awayRank!, style: smallGreyTS),
        if (!isHome && match!.awayYellowCard != null) // 客队黄牌
          Container(
            decoration: BoxDecoration(
              color: yellow700Color,
              borderRadius: BorderRadius.circular(2),
            ),
            padding: const EdgeInsets.all(2),
            child: Text(match!.awayYellowCard!, style: smallWhiteTS),
          ),
        if (!isHome && match!.awayRedCard != null) //客队红牌
          Container(
            decoration: BoxDecoration(
              color: redColor,
              borderRadius: BorderRadius.circular(2),
            ),
            padding: const EdgeInsets.all(2),
            child: Text(match!.awayRedCard!, style: smallWhiteTS),
          ),
      ],
    );
  }
}
