import 'package:flutter/material.dart';
import 'package:mars_sport/cache/cache_manager.dart';
import 'package:mars_sport/models/match_base_events_model.dart';
import 'package:mars_sport/models/match_base_teams_model.dart';

import 'package:mars_sport/network/api.dart';
import 'package:mars_sport/utils/ms_date.dart';

BaseFTRequest baseFTReq = BaseFTRequest();

class BaseFTRequest {
  List<FTMatchBaseTeamsModel>? baseTeams;
  FTMatchBaseEventsModel? baseEvents;

  BaseFTRequest({
    Key? key,
    this.baseTeams,
    this.baseEvents,
  });

  void init() async {
    isExistTeamsList();
    isExistMatchEvents();
  }

  // 判断本地是否存在teamsList
  isExistTeamsList() async {
    final obj = await MSCacheManager.getData(MSCacheManager.ftTeamList);
    if (obj != Null && obj != null) {
      // 存在先赋值
      if (obj is List<dynamic>) {
        baseTeams = getMatchBaseTeams(obj);
      }
      // 获取上一次请求的时间
      var lastTime =
          await MSCacheManager.getData(MSCacheManager.ftTeamListLastTime);
      if (lastTime == Null || lastTime == null) {
        lastTime = DateTime.now()
            .subtract(const Duration(hours: 25))
            .millisecondsSinceEpoch;
      }
      // 如果上一次请求的时间大于1天重新请求
      if (timeDiffDays(lastTime)) reqSaveTeamList();
    } else {
      reqSaveTeamList();
    }
  }

  reqSaveTeamList() async {
    final result = await Api.teamList();
    if (result.code == 200) {
      debugPrint(result.data.toString());
      // 存当次请求成功时间
      final curTimeMillis = DateTime.now().millisecondsSinceEpoch;
      MSCacheManager.saveData(MSCacheManager.ftTeamListLastTime, curTimeMillis);
      // 存数据
      MSCacheManager.saveData(MSCacheManager.ftTeamList, result.data);
      if (result.data is List<dynamic>) {
        baseTeams = getMatchBaseTeams(result.data);
      }
    }
  }

  // 判断本地是否存在matchEvents
  isExistMatchEvents() async {
    final obj = await MSCacheManager.getData(MSCacheManager.ftMatchEventList);
    if (obj != Null && obj != null) {
      baseEvents = FTMatchBaseEventsModel.fromJson(obj);
      // 获取上一次请求的时间
      var lastTime =
          await MSCacheManager.getData(MSCacheManager.ftMatchEventListLastTime);
      if (lastTime == Null || lastTime == null) {
        lastTime = DateTime.now()
            .subtract(const Duration(hours: 25))
            .millisecondsSinceEpoch;
      }
      // 如果上一次请求的时间大于1天重新请求
      if (timeDiffDays(lastTime)) reqSaveMatchEventList();
    } else {
      reqSaveMatchEventList();
    }
  }

  reqSaveMatchEventList() async {
    final result = await Api.matchEventList();
    if (result.code == 200) {
      debugPrint(result.data.toString());
      // 存当次请求成功时间
      final curTimeMillis = DateTime.now().millisecondsSinceEpoch;
      MSCacheManager.saveData(
          MSCacheManager.ftMatchEventListLastTime, curTimeMillis);
      // 存数据
      MSCacheManager.saveData(MSCacheManager.ftMatchEventList, result.data);
      baseEvents = FTMatchBaseEventsModel.fromJson(result.data);
    }
  }
}
