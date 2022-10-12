import 'package:json_annotation/json_annotation.dart';

part 'match_base_teams_model.g.dart';

List<FTMatchBaseTeamsModel> getMatchBaseTeams(List<dynamic> list) {
  List<FTMatchBaseTeamsModel> result = [];
  for (final item in list) {
    result.add(FTMatchBaseTeamsModel.fromJson(item));
  }
  return result;
}

@JsonSerializable()
class FTMatchBaseTeamsModel extends Object {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'matchevent_id')
  int? matcheventId;

  @JsonKey(name: 'name_zh')
  String? nameZh;

  @JsonKey(name: 'name_zht')
  String? nameZht;

  @JsonKey(name: 'name_en')
  String? nameEn;

  @JsonKey(name: 'short_name_zh')
  String? shortNameZh;

  @JsonKey(name: 'short_name_zht')
  String? shortNameZht;

  @JsonKey(name: 'short_name_en')
  String? shortNameEn;

  @JsonKey(name: 'logo')
  String? logo;

  @JsonKey(name: 'found')
  String? found;

  @JsonKey(name: 'website')
  String? website;

  FTMatchBaseTeamsModel({
    this.id,
    this.matcheventId,
    this.nameZh,
    this.nameZht,
    this.nameEn,
    this.shortNameZh,
    this.shortNameZht,
    this.shortNameEn,
    this.logo,
    this.found,
    this.website,
  });

  factory FTMatchBaseTeamsModel.fromJson(Map<String, dynamic> srcJson) =>
      _$FTMatchBaseTeamsModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$FTMatchBaseTeamsModelToJson(this);
}
