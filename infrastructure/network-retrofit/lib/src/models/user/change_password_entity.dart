import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'change_password_entity.g.dart';

@JsonSerializable()
class ChangePasswordEntity
    implements BaseLayerDataTransformer<ChangePasswordEntity, bool> {
  bool status;

  ChangePasswordEntity(this.status);

  factory ChangePasswordEntity.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePasswordEntityToJson(this);

  @override
  ChangePasswordEntity restore(bool data) {
    return ChangePasswordEntity(data);
  }

  @override
  bool transform() {
    return status;
  }
}
