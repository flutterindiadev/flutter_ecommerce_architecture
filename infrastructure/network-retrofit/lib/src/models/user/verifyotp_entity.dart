import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verifyotp_entity.g.dart';

@JsonSerializable()
class VerifyotpEntity
    implements BaseLayerDataTransformer<VerifyotpEntity, bool> {
  @JsonKey(name: "isVerified")
  final bool isVerified;

  VerifyotpEntity({required this.isVerified});

  factory VerifyotpEntity.fromJson(Map<String, dynamic> json) =>
      _$VerifyotpEntityFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyotpEntityToJson(this);

  @override
  VerifyotpEntity restore(bool data) {
    return VerifyotpEntity(isVerified: data);
  }

  @override
  bool transform() {
    return isVerified;
  }
}
