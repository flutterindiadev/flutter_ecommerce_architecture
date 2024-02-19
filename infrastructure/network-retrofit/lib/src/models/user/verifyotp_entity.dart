import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class VerifyotpEntity
    implements BaseLayerDataTransformer<VerifyotpEntity, bool> {
  @JsonKey(name: "isVerified")
  final bool isVerified;

  VerifyotpEntity({required this.isVerified});

  @override
  VerifyotpEntity restore(bool data) {
    return VerifyotpEntity(isVerified: data);
  }

  @override
  bool transform() {
    return isVerified;
  }
}
