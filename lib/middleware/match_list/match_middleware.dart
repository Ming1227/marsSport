import 'package:flutter/material.dart';
import 'package:mars_sport/cache/cache_manager.dart';
import 'package:mars_sport/middleware/match_list/match_out_data.dart';
import 'package:mars_sport/models/match_base_events_model.dart';
import 'package:mars_sport/models/match_base_teams_model.dart';
import 'package:mars_sport/models/match_list_model.dart';
import 'package:mars_sport/network/api.dart';
import 'package:mars_sport/utils/match_status_code.dart';
import 'package:mars_sport/utils/ms_date.dart';
import 'package:mars_sport/utils/ms_string.dart';

FTMatchMiddleWare matchMiddle = FTMatchMiddleWare();

class FTMatchMiddleWare extends ChangeNotifier {
  List<FTMatchOutData> _matchs = [];

  List<FTMatchOutData> get matchs => _matchs;

  late FTMatchListModel? model;

  // 请求当日赛事信息
  reqSaveCurDateMatchList() async {
    /// 临时使用本地数据调试
    final obj = await MSCacheManager.getData(MSCacheManager.ftMatchList);
    if (obj != Null && obj != null) {
      model = FTMatchListModel.fromJson(obj);
      transfromAndNotify();
      return;
    }
    final result = await Api.matchList(date: msGetCurrentDay());
    if (result.code == 200) {
      /// 存当次请求成功时间
      final curTimeMillis = DateTime.now().millisecondsSinceEpoch;
      MSCacheManager.saveData(
          MSCacheManager.ftMatchListLastTime, curTimeMillis);
      MSCacheManager.saveData(MSCacheManager.ftMatchList, result.data);
      model = FTMatchListModel.fromJson(result.data);
      transfromAndNotify();
    }
  }

  transfromAndNotify() {
    _matchs = model?.matches?.map((e) => transform(e)).toList() ?? [];
    debugPrint('发送match MiddleWare Notify');
    notifyListeners();
  }

  FTMatchOutData transform(List<dynamic> match) {
    return FTMatchOutData(
      id: safeGetDataInMatch(0, match),
      leagueName: getLeagueName(match),
      status: safeGetDataInMatch(2, match),
      beginTime: getBeginTime(match),
      time: getStartTime(match),
      homeID: getHomeAwayID(match),
      homeName: getHomeAwayName(match),
      homeRank: getHomeAwayRank(match),
      homeScore: getHomeAwayScore(match),
      homeHalfScore: getHomeAwayHalfScore(match),
      homeRedCard: getHomeAwayRedCard(match),
      homeYellowCard: getHomeAwayYellowCard(match),
      homeCorner: getHomeAwayCorner(match),
      homeExtraScore: getHomeAwayExtraScore(match),
      homePenalty: getHomeAwayPenalty(match),
      awayID: getHomeAwayID(match, isHome: false),
      awayName: getHomeAwayName(match, isHome: false),
      awayRank: getHomeAwayRank(match, isHome: false),
      awayScore: getHomeAwayScore(match, isHome: false),
      awayHalfScore: getHomeAwayHalfScore(match, isHome: false),
      awayRedCard: getHomeAwayRedCard(match, isHome: false),
      awayYellowCard: getHomeAwayYellowCard(match, isHome: false),
      awayCorner: getHomeAwayCorner(match, isHome: false),
      awayExtraScore: getHomeAwayExtraScore(match, isHome: false),
      awayPenalty: getHomeAwayPenalty(match, isHome: false),
      detail: getDetail(match),
      isNeutral: getIsNeutral(match),
      matchRound: getMatchRound(match),
      hasAnimation: getHasAnimation(match),
      hasInformation: getHasInformation(match),
      hasSquad: getHasSquad(match),
      group: getGroup(match),
      round: getRound(match),
      isFav: false,
    );
  }

  dynamic safeGetDataInMatch(int index, List<dynamic>? list) {
    if (list == null || list.isEmpty) return null;
    if (index < list.length) return list[index];
    return null;
  }

  String? getLeagueName(List<dynamic> match) {
    final id = safeGetDataInMatch(1, match) as int?;
    if ((model?.events?.isNotEmpty ?? false) && id != null) {
      final idStr = id.toString();
      bool hasID = model!.events!.containsKey(idStr);
      if (hasID) {
        FTMatchEventModel? baseEvent = model?.events?[idStr];
        return baseEvent?.shortNameZh;
      }
    }
    return null;
  }

  String? getBeginTime(List<dynamic> match) {
    final time = safeGetDataInMatch(3, match) as int?;
    if (time == null) return null;
    final date = DateTime.fromMillisecondsSinceEpoch(time * 1000);
    return date.hour.toString().padLeft(2, '0') +
        ':' +
        date.minute.toString().padLeft(2, '0');
  }

  String getStartTime(List<dynamic> match) {
    final status = safeGetDataInMatch(2, match) as int?;
    if (status == null) return '';
    if (status <= 1) {
      return '未';
    } else if (status >= 8) {
      return MatchStatusCode.ftMatchStatus[status] ?? '';
    } else {
      final start = safeGetDataInMatch(4, match) as int?;
      if (start == null) return '';
      final startDate = DateTime.fromMillisecondsSinceEpoch(start * 1000);
      var difMin = DateTime.now().difference(startDate).inMinutes;
      if (status == 4) {
        // 下半场
        difMin += 45;
      } else if (status == 5) {
        // 加时赛
        difMin += 90;
      }
      if (difMin == 0) {
        return '';
      } else if (difMin > 90) {
        return '90+';
      }
      return difMin.toString();
    }
  }

  int? getHomeAwayID(List<dynamic> match, {isHome = true}) {
    final list = safeGetDataInMatch(isHome ? 5 : 6, match) as List?;
    final id = safeGetDataInMatch(0, list) as int?;
    return id;
  }

  String? getHomeAwayName(List<dynamic> match, {isHome = true}) {
    final id = getHomeAwayID(match, isHome: isHome);
    if ((model?.teams?.isNotEmpty ?? false) && id != null) {
      final idStr = id.toString();
      bool hasID = model!.teams!.containsKey(idStr);
      if (hasID) {
        FTMatchBaseTeamsModel? team = model?.teams?[idStr];
        return team?.nameZh;
      }
    }
    return null;
  }

  String? getHomeAwayRank(List<dynamic> match, {isHome = true}) {
    final list = safeGetDataInMatch(isHome ? 5 : 6, match) as List?;
    final rank = safeGetDataInMatch(1, list) as String?;
    if (rank == null || rank.isEmpty) return rank;
    return '[$rank]';
  }

  int? getHomeAwayScore(List<dynamic> match, {isHome = true}) {
    final list = safeGetDataInMatch(isHome ? 5 : 6, match) as List?;
    final score = safeGetDataInMatch(2, list) as int?;
    return score;
  }

  int? getHomeAwayHalfScore(List<dynamic> match, {isHome = true}) {
    final list = safeGetDataInMatch(isHome ? 5 : 6, match) as List?;
    final halfScore = safeGetDataInMatch(3, list) as int?;
    return halfScore;
  }

  String? getHomeAwayRedCard(List<dynamic> match, {isHome = true}) {
    final list = safeGetDataInMatch(isHome ? 5 : 6, match) as List?;
    final redCard = safeGetDataInMatch(4, list) as int?;
    if (redCard == null || redCard == 0) return null;
    return redCard.toString();
  }

  String? getHomeAwayYellowCard(List<dynamic> match, {isHome = true}) {
    final list = safeGetDataInMatch(isHome ? 5 : 6, match) as List?;
    final yellowCard = safeGetDataInMatch(5, list) as int?;
    if (yellowCard == null || yellowCard == 0) return null;
    return yellowCard.toString();
  }

  int? getHomeAwayCorner(List<dynamic> match, {isHome = true}) {
    final list = safeGetDataInMatch(isHome ? 5 : 6, match) as List?;
    final corner = safeGetDataInMatch(6, list) as int?;
    return corner;
  }

  int? getHomeAwayExtraScore(List<dynamic> match, {isHome = true}) {
    final status = safeGetDataInMatch(2, match) as int?;
    if (status == 5) {
      final list = safeGetDataInMatch(isHome ? 5 : 6, match) as List?;
      final extraScore = safeGetDataInMatch(7, list) as int?;
      return extraScore;
    }
    return null;
  }

  int? getHomeAwayPenalty(List<dynamic> match, {isHome = true}) {
    final status = safeGetDataInMatch(2, match) as int?;
    if (status == 7) {
      final list = safeGetDataInMatch(isHome ? 5 : 6, match) as List?;
      final penalty = safeGetDataInMatch(8, list) as int?;
      return penalty;
    }
    return null;
  }

  bool? getHasAnimation(List<dynamic> match) {
    final list = safeGetDataInMatch(8, match) as List?;
    final animate = safeGetDataInMatch(2, list) as int?;
    if (animate == 1) return true;
    return false;
  }

  bool? getHasInformation(List<dynamic> match) {
    final list = safeGetDataInMatch(8, match) as List?;
    final info = safeGetDataInMatch(3, list) as int?;
    if (info == 1) return true;
    return false;
  }

  bool? getHasSquad(List<dynamic> match) {
    final list = safeGetDataInMatch(8, match) as List?;
    final squad = safeGetDataInMatch(4, list) as int?;
    if (squad == 1) return true;
    return false;
  }

  String? getDetail(List<dynamic> match) {
    final list = safeGetDataInMatch(7, match) as List?;
    final detail = safeGetDataInMatch(0, list) as String?;
    return detail;
  }

  bool getIsNeutral(List<dynamic> match) {
    final list = safeGetDataInMatch(7, match) as List?;
    final neutral = safeGetDataInMatch(1, list) as int?;
    if (neutral == 1) return true;
    return false;
  }

  int? getMatchRound(List<dynamic> match) {
    final list = safeGetDataInMatch(7, match) as List?;
    final matchRound = safeGetDataInMatch(2, list) as int?;
    return matchRound;
  }

  String? getGroup(List<dynamic> match) {
    final list = safeGetDataInMatch(9, match) as List?;
    final group = safeGetDataInMatch(1, list) as int?;
    if (group == null) return null;
    return transIntToChar(group);
  }

  int? getRound(List<dynamic> match) {
    final list = safeGetDataInMatch(9, match) as List?;
    final round = safeGetDataInMatch(2, list) as int?;
    return round;
  }
}
