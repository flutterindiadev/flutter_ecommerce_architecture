import 'dart:convert';

import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'logout_entity.dart';
part 'logout_response_entity.g.dart';

@JsonSerializable()
class LogoutResponseEntity
    implements BaseLayerDataTransformer<LogoutResponseEntity, Logout> {

  @JsonKey(name: 'data')
  LogoutEntity logoutentity;

  LogoutResponseEntity({required this.logoutentity});

  factory LogoutResponseEntity.fromJson(Map<String, dynamic> json) {
    return _$LogoutResponseEntityFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LogoutResponseEntityToJson(this);

  @override
  Logout transform() {
     return Logout(sessionId: logoutentity.sessionId);

  }

  @override
  LogoutResponseEntity restore(Logout data) {
    return LogoutResponseEntity(logoutentity: LogoutEntity(sessionId: data.sessionId));
  }
}