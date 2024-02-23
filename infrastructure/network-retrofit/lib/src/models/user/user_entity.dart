import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_entity.g.dart';

@JsonSerializable()
class UserEntity implements BaseLayerDataTransformer<UserEntity, User> {
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'mobile')
  final String mobile;
  @JsonKey(name: 'token')
  final String token;

  UserEntity(
      {required this.id,
      required this.email,
      required this.mobile,
      required this.token});

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserEntityToJson(this);

  @override
  UserEntity restore(data) {
    return UserEntity(
        id: data.id, email: data.email, mobile: data.mobile, token: data.token);
  }

  @override
  User transform() {
    return User(id: id, email: email, mobile: mobile, token: token);
  }
}
