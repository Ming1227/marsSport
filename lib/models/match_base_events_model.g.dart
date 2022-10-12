// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_base_events_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FTMatchBaseEventsModel _$FTMatchBaseEventsModelFromJson(
        Map<String, dynamic> json) =>
    FTMatchBaseEventsModel(
      areas: (json['areas'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, FTAreaModel.fromJson(e as Map<String, dynamic>)),
      ),
      countrys: (json['countrys'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, FTCountryModel.fromJson(e as Map<String, dynamic>)),
      ),
      matchEvents: (json['matchevents'] as List<dynamic>?)
          ?.map((e) => FTMatchEventModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FTMatchBaseEventsModelToJson(
        FTMatchBaseEventsModel instance) =>
    <String, dynamic>{
      'areas': instance.areas,
      'countrys': instance.countrys,
      'matchevents': instance.matchEvents,
    };

FTAreaModel _$FTAreaModelFromJson(Map<String, dynamic> json) => FTAreaModel(
      id: json['id'] as int?,
      nameZh: json['name_zh'] as String?,
      nameZht: json['name_zht'] as String?,
      nameEn: json['name_en'] as String?,
    );

Map<String, dynamic> _$FTAreaModelToJson(FTAreaModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_zh': instance.nameZh,
      'name_zht': instance.nameZht,
      'name_en': instance.nameEn,
    };

FTCountryModel _$FTCountryModelFromJson(Map<String, dynamic> json) =>
    FTCountryModel(
      id: json['id'] as int?,
      areaID: json['area_id'] as int?,
      nameZh: json['name_zh'] as String?,
      nameZht: json['name_zht'] as String?,
      nameEn: json['name_en'] as String?,
      logo: json['logo'] as String?,
    );

Map<String, dynamic> _$FTCountryModelToJson(FTCountryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'area_id': instance.areaID,
      'name_zh': instance.nameZh,
      'name_zht': instance.nameZht,
      'name_en': instance.nameEn,
      'logo': instance.logo,
    };

FTMatchEventModel _$FTMatchEventModelFromJson(Map<String, dynamic> json) =>
    FTMatchEventModel(
      id: json['id'] as int?,
      type: json['type'] as int?,
      level: json['level'] as int?,
      areaId: json['area_id'] as int?,
      countryId: json['country_id'] as int?,
      nameZh: json['name_zh'] as String?,
      shortNameZh: json['short_name_zh'] as String?,
      nameZht: json['name_zht'] as String?,
      shortNameZht: json['short_name_zht'] as String?,
      nameEn: json['name_en'] as String?,
      shortNameEn: json['short_name_en'] as String?,
      logo: json['logo'] as String?,
    );

Map<String, dynamic> _$FTMatchEventModelToJson(FTMatchEventModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'area_id': instance.areaId,
      'country_id': instance.countryId,
      'type': instance.type,
      'level': instance.level,
      'name_zh': instance.nameZh,
      'short_name_zh': instance.shortNameZh,
      'name_zht': instance.nameZht,
      'short_name_zht': instance.shortNameZht,
      'name_en': instance.nameEn,
      'short_name_en': instance.shortNameEn,
      'logo': instance.logo,
    };
