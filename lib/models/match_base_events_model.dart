import 'package:json_annotation/json_annotation.dart';

part 'match_base_events_model.g.dart';

@JsonSerializable()
class FTMatchBaseEventsModel extends Object {
  @JsonKey(name: 'areas')
  Map<String, FTAreaModel>? areas;

  @JsonKey(name: 'countrys')
  Map<String, FTCountryModel>? countrys;

  @JsonKey(name: 'matchevents')
  List<FTMatchEventModel>? matchEvents;

  FTMatchBaseEventsModel({this.areas, this.countrys, this.matchEvents});

  factory FTMatchBaseEventsModel.fromJson(Map<String, dynamic> json) =>
      _$FTMatchBaseEventsModelFromJson(json);
  Map<String, dynamic> toJson() => _$FTMatchBaseEventsModelToJson(this);
}

@JsonSerializable()
class FTAreaModel extends Object {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'name_zh')
  String? nameZh;

  @JsonKey(name: 'name_zht')
  String? nameZht;

  @JsonKey(name: 'name_en')
  String? nameEn;

  FTAreaModel({this.id, this.nameZh, this.nameZht, this.nameEn});
  factory FTAreaModel.fromJson(Map<String, dynamic> json) =>
      _$FTAreaModelFromJson(json);
  Map<String, dynamic> toJson() => _$FTAreaModelToJson(this);
}

@JsonSerializable()
class FTCountryModel extends Object {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'area_id')
  int? areaID;

  @JsonKey(name: 'name_zh')
  String? nameZh;

  @JsonKey(name: 'name_zht')
  String? nameZht;

  @JsonKey(name: 'name_en')
  String? nameEn;

  @JsonKey(name: 'logo')
  String? logo;

  FTCountryModel({
    this.id,
    this.areaID,
    this.nameZh,
    this.nameZht,
    this.nameEn,
    this.logo,
  });
  factory FTCountryModel.fromJson(Map<String, dynamic> json) =>
      _$FTCountryModelFromJson(json);
  Map<String, dynamic> toJson() => _$FTCountryModelToJson(this);
}

@JsonSerializable()
class FTMatchEventModel extends Object {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'area_id')
  int? areaId;

  @JsonKey(name: 'country_id')
  int? countryId;

  @JsonKey(name: 'type')
  int? type;

  @JsonKey(name: 'level')
  int? level;

  @JsonKey(name: 'name_zh')
  String? nameZh;

  @JsonKey(name: 'short_name_zh')
  String? shortNameZh;

  @JsonKey(name: 'name_zht')
  String? nameZht;

  @JsonKey(name: 'short_name_zht')
  String? shortNameZht;

  @JsonKey(name: 'name_en')
  String? nameEn;

  @JsonKey(name: 'short_name_en')
  String? shortNameEn;

  @JsonKey(name: 'logo')
  String? logo;

  FTMatchEventModel({
    this.id,
    this.type,
    this.level,
    this.areaId,
    this.countryId,
    this.nameZh,
    this.shortNameZh,
    this.nameZht,
    this.shortNameZht,
    this.nameEn,
    this.shortNameEn,
    this.logo,
  });

  factory FTMatchEventModel.fromJson(Map<String, dynamic> json) =>
      _$FTMatchEventModelFromJson(json);
  Map<String, dynamic> toJson() => _$FTMatchEventModelToJson(this);
}
