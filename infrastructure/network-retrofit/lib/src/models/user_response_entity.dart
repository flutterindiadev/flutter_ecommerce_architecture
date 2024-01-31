import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/models/user_entity.dart';

part 'user_response_entity.g.dart';

@JsonSerializable()
class UserResponseEntity
    implements BaseLayerDataTransformer<UserResponseEntity, User> {
  @JsonKey(name: 'data')
  final UserEntity userEntity;

  UserResponseEntity(this.userEntity);

  factory UserResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$UserResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseEntityToJson(this);

  @override
  UserResponseEntity restore(User data) {
    return UserResponseEntity(UserEntity(
        id: data.id,
        email: data.email,
        mobile: data.mobile,
        token: data.token));
  }

  @override
  User transform() {
    return userEntity.transform();
  }
}
