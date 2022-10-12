import 'package:flutter/material.dart';

class FTMatchOutData {
  final int? id; // 赛事id
  final String? leagueName; // 联赛名称
  final int? status; // 比赛状态
  final String? beginTime; // 开始时间
  final String? time; // 如已开场 显示开场时间
  final int? homeID; // 主队ID
  final String? homeName; // 主队名称
  final String? homeRank; // 主队联赛排名
  final int? homeScore; // 主队比分 常规时间
  final int? homeHalfScore; // 主队半场比分
  final String? homeRedCard; // 主队红牌数
  final String? homeYellowCard; // 主队黄牌数
  final int? homeCorner; // 主队角球数 -1表示没有角球数据
  final int? homeExtraScore; // 主队加时比分(含常规时间) 加时赛才有
  final int? homePenalty; // 主队点球比分(不含常规时间) 点球大战才有
  final int? awayID;
  final String? awayName;
  final String? awayRank;
  final int? awayScore;
  final int? awayHalfScore;
  final String? awayRedCard;
  final String? awayYellowCard;
  final int? awayCorner;
  final int? awayExtraScore;
  final int? awayPenalty;
  final String? detail; // 比赛详细说明
  final bool? isNeutral; // 是否中立场
  final int? matchRound; // 比赛轮次
  final bool? hasAnimation; // 是否有动画
  final bool? hasInformation; // 是否有情报
  final bool? hasSquad; // 是否有阵容
  final String? group; // 第几组 分的小组
  final int? round; // 第几轮
  final bool? isFav; // 是否关注

  get score {
    if (homeExtraScore != null &&
        homeExtraScore != 0 &&
        awayExtraScore != null &&
        awayExtraScore != 0) {
      return homeExtraScore!.toString() + '-' + awayExtraScore!.toString();
    }
    return homeScore.toString() + '-' + awayScore.toString();
  }

  get halfScore {
    return '半:' + homeHalfScore.toString() + '-' + awayHalfScore.toString();
  }

  get cornerScore {
    return '角:' + homeCorner.toString() + '-' + awayCorner.toString();
  }

  const FTMatchOutData({
    Key? key,
    this.id,
    this.leagueName,
    this.status,
    this.beginTime,
    this.time,
    this.homeID,
    this.homeName,
    this.homeRank,
    this.homeScore,
    this.homeHalfScore,
    this.homeRedCard,
    this.homeYellowCard,
    this.homeCorner,
    this.homeExtraScore,
    this.homePenalty,
    this.awayID,
    this.awayName,
    this.awayRank,
    this.awayScore,
    this.awayHalfScore,
    this.awayRedCard,
    this.awayYellowCard,
    this.awayCorner,
    this.awayExtraScore,
    this.awayPenalty,
    this.detail,
    this.isNeutral,
    this.matchRound,
    this.hasAnimation,
    this.hasInformation,
    this.hasSquad,
    this.group,
    this.round,
    this.isFav,
  });

  FTMatchOutData.mock({
    this.id,
    this.leagueName = '世界杯',
    this.status,
    this.beginTime = '10:00',
    this.time = '82\'',
    this.homeID,
    this.homeName = '阿根廷',
    this.homeRank = '[5]',
    this.homeScore = 2,
    this.homeHalfScore = 1,
    this.homeRedCard,
    this.homeYellowCard,
    this.homeCorner = 5,
    this.homeExtraScore,
    this.homePenalty,
    this.awayID,
    this.awayName = '巴西',
    this.awayRank = '[3]',
    this.awayScore = 1,
    this.awayHalfScore = 0,
    this.awayRedCard,
    this.awayYellowCard = '1',
    this.awayCorner = 9,
    this.awayExtraScore,
    this.awayPenalty,
    this.detail = '热度9999+',
    this.isNeutral,
    this.matchRound,
    this.hasAnimation,
    this.hasInformation = true,
    this.hasSquad,
    this.group,
    this.round,
    this.isFav,
  });
}
