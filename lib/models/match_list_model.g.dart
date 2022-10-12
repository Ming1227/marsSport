// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FTMatchListModel _$FTMatchListModelFromJson(Map<String, dynamic> json) =>
    FTMatchListModel(
      teams: (json['teams'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k, FTMatchBaseTeamsModel.fromJson(e as Map<String, dynamic>)),
      ),
      events: (json['events'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, FTMatchEventModel.fromJson(e as Map<String, dynamic>)),
      ),
      matches: (json['matches'] as List<dynamic>?)
          ?.map((e) => e as List<dynamic>)
          .toList(),
      stages: (json['stages'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, FTStageModel.fromJson(e as Map<String, dynamic>)),
      ),
      odds: json['odds'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$FTMatchListModelToJson(FTMatchListModel instance) =>
    <String, dynamic>{
      'teams': instance.teams,
      'events': instance.events,
      'matches': instance.matches,
      'stages': instance.stages,
      'odds': instance.odds,
    };

FTStageModel _$FTStageModelFromJson(Map<String, dynamic> json) => FTStageModel(
      id: json['id'] as int?,
      nameZh: json['name_zh'] as String?,
      nameZht: json['name_zht'] as String?,
      nameEn: json['name_en'] as String?,
      mode: json['mode'] as int?,
      groupCount: json['group_count'] as int?,
      roundCount: json['round_count'] as int?,
    );

Map<String, dynamic> _$FTStageModelToJson(FTStageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_zh': instance.nameZh,
      'name_zht': instance.nameZht,
      'name_en': instance.nameEn,
      'mode': instance.mode,
      'group_count': instance.groupCount,
      'round_count': instance.roundCount,
    };
