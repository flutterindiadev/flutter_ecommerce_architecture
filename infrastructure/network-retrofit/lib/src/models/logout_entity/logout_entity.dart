import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'logout_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class LogoutEntity extends BaseLayerDataTransformer<LogoutEntity, Logout> {
  @JsonKey(
    name: 'sessionId',
    defaultValue: "",
  )
  final String? sessionId;

  factory LogoutEntity.fromJson(Map<String, dynamic> json) {
    return _$LogoutEntityFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LogoutEntityToJson(this);

  LogoutEntity({required this.sessionId});
}
