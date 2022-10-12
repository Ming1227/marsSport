import 'package:json_annotation/json_annotation.dart';
import 'package:mars_sport/models/match_base_events_model.dart';
import 'package:mars_sport/models/match_base_teams_model.dart';

part 'match_list_model.g.dart';

@JsonSerializable()
class FTMatchListModel extends Object {
  @JsonKey(name: 'teams')
  Map<String, FTMatchBaseTeamsModel>? teams;

  @JsonKey(name: 'events')
  Map<String, FTMatchEventModel>? events;

  @JsonKey(name: 'matches')
  List<List<dynamic>>? matches;

  @JsonKey(name: 'stages')
  Map<String, FTStageModel>? stages;

  @JsonKey(name: 'odds')
  Map<String, dynamic>? odds;

  FTMatchListModel({
    this.teams,
    this.events,
    this.matches,
    this.stages,
    this.odds,
  });

  factory FTMatchListModel.fromJson(Map<String, dynamic> srcJson) =>
      _$FTMatchListModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$FTMatchListModelToJson(this);
}

@JsonSerializable()
class FTStageModel extends Object {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'name_zh')
  String? nameZh;

  @JsonKey(name: 'name_zht')
  String? nameZht;

  @JsonKey(name: 'name_en')
  String? nameEn;

  @JsonKey(name: 'mode')
  int? mode;

  @JsonKey(name: 'group_count')
  int? groupCount;

  @JsonKey(name: 'round_count')
  int? roundCount;

  FTStageModel({
    this.id,
    this.nameZh,
    this.nameZht,
    this.nameEn,
    this.mode,
    this.groupCount,
    this.roundCount,
  });

  factory FTStageModel.fromJson(Map<String, dynamic> srcJson) =>
      _$FTStageModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$FTStageModelToJson(this);
}
