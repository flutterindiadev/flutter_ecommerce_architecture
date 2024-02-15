import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(explicitToJson: true)
class LogoutEntity extends BaseLayerDataTransformer<LogoutEntity, Logout> {
  @JsonKey(
    name: 'sessionId',
    defaultValue: "",
  )
  final String? sessionId;


  LogoutEntity({
    this.sessionId
  });


}