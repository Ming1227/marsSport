import 'package:dio/dio.dart';
import 'package:mars_sport/network/ms_dio.dart';

import 'package:saturn_login/saturn_login.dart';

const baseUrl = 'http://120.78.145.47:7011/';
const timeoutConnect = 5000;
const timeoutReceive = 0;
const timeoutSend = 5000;

class Api {
  static initApi() {
    msDio.options.baseUrl = baseUrl;
    msDio.options.sendTimeout = timeoutSend;
    msDio.options.receiveTimeout = timeoutReceive;
    msDio.options.connectTimeout = timeoutConnect;
    msDio.options.contentType = Headers.jsonContentType;
  }

  // 足球赛事列表 全量更新，更新频率
  // 建议一天同步一次 logo建议保存到本地使用
  static Future<SCResult> matchEventList() =>
      get('api/sports/football/matchevent/list');

  // 足球球队列表 全量更新，更新频率
  // 建议一天同步一次 logo建议保存到本地使用
  static Future<SCResult> teamList() => get('api/sports/football/team/list');

  // 足球即时比分
  /*
  该接口返回实时变动的即时数据信息,无即时数据变动的比赛不返回
  建议请求频次：1秒

  数据结构完全相同
  最近60秒内变化的比分数据
  open.sportnanoapi.com/api/sports/football/match/live
  最近180秒内变化的比分数据
  open.sportnanoapi.com/api/sports/football/match/live2

  比赛进行分钟数获取公式
  上半场：比赛进行分钟数=(当前时间戳-开球时间戳) / 60 + 1
  下半场: 比赛进行分钟数=(当前时间戳-开球时间戳) / 60 + 45 + 1
  */
  static matchLive() => get('api/sports/football/match/live');

  // 实时比赛事件和技术统计
  /*
  该接口返回最近120min内的比赛事件和技术统计数据（全量更新）
  ps：非120min内的比赛数据有更新，也会同步返回
  建议请求频次：2秒/次
  score 即时比分字段说明，详见即时数据-＞足球即时比分接口
  incidents 比赛事件字段说明
  包含：黄牌、两黄变红、红牌、进球(助攻)、换人、点球、点球未进、乌龙球、VAR、中场、伤停补时、结束、加时结束、点球大战结束
  */
  static Future<SCResult> matchDetailLive() =>
      get('api/sports/football/match/detail_live');

  // 足球赛程赛果
  /*
  该接口返回所请求日期（限制：前后30天）的全量赛程赛果数据，及赛程中比赛涉及到的球队及赛事信息（全量更新）；
  注：实时数据的获取通过即时比分接口，不要通过此接口；
  当天赛程建议请求频次：10分钟/次；
  明日及以后赛程建议请求频次 30分钟/次

  比赛状态说明
  详细定义见状态码->足球比赛状态
  其中[1] 对应[未开赛]，[2-7] 对应[进行中]，[8] 对应[已结束]，[9-13] 对应 [延迟]

  teams 球队列表字段说明
  teams->球队id
  */
  static Future<SCResult> matchList({String? date}) {
    var url = 'api/sports/football/match/list';
    Map<String, String>? params;
    if (date != null) params = {'date': date};
    return get(url, data: params);
  }
}
