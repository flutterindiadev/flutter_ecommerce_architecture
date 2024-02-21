import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_settings_entity.g.dart';

@JsonSerializable()
class UserSettingsEntity
    implements BaseLayerDataTransformer<UserSettingsEntity, UserSettings> {
  @JsonKey(name: 'languagePreference')
  String language;

  @JsonKey(name: 'themePreference')
  String theme;

  UserSettingsEntity({required this.language, required this.theme});

  factory UserSettingsEntity.fromJson(Map<String, dynamic> json) =>
      _$UserSettingsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserSettingsEntityToJson(this);

  @override
  UserSettingsEntity restore(UserSettings data) {
    return UserSettingsEntity(language: data.language, theme: data.theme);
  }

  @override
  UserSettings transform() {
    return UserSettings(language: language, theme: theme);
  }
}
