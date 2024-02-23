import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_exists_entity.g.dart';

@JsonSerializable()
class UserExistsEntity
    implements BaseLayerDataTransformer<UserExistsEntity, bool> {
  final bool userexists;

  UserExistsEntity(this.userexists);

  factory UserExistsEntity.fromJson(Map<String, dynamic> json) =>
      _$UserExistsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserExistsEntityToJson(this);

  @override
  UserExistsEntity restore(bool data) {
    return UserExistsEntity(data);
  }

  @override
  bool transform() {
    return userexists;
  }
}
