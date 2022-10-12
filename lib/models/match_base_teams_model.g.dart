// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_base_teams_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FTMatchBaseTeamsModel _$FTMatchBaseTeamsModelFromJson(
        Map<String, dynamic> json) =>
    FTMatchBaseTeamsModel(
      id: json['id'] as int?,
      matcheventId: json['matchevent_id'] as int?,
      nameZh: json['name_zh'] as String?,
      nameZht: json['name_zht'] as String?,
      nameEn: json['name_en'] as String?,
      shortNameZh: json['short_name_zh'] as String?,
      shortNameZht: json['short_name_zht'] as String?,
      shortNameEn: json['short_name_en'] as String?,
      logo: json['logo'] as String?,
      found: json['found'] as String?,
      website: json['website'] as String?,
    );

Map<String, dynamic> _$FTMatchBaseTeamsModelToJson(
        FTMatchBaseTeamsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'matchevent_id': instance.matcheventId,
      'name_zh': instance.nameZh,
      'name_zht': instance.nameZht,
      'name_en': instance.nameEn,
      'short_name_zh': instance.shortNameZh,
      'short_name_zht': instance.shortNameZht,
      'short_name_en': instance.shortNameEn,
      'logo': instance.logo,
      'found': instance.found,
      'website': instance.website,
    };
