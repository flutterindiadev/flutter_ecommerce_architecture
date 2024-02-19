import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
part 'change_cart_Address_entity.g.dart';

@JsonSerializable()
class ChangeCartAddressEntity
    implements
        BaseLayerDataTransformer<ChangeCartAddressEntity, ChangeCartAddress> {
  @JsonKey(name: 'status')
  bool status;

  ChangeCartAddressEntity({required this.status});
  factory ChangeCartAddressEntity.fromJson(Map<String, dynamic> json) =>
      _$ChangeCartAddressEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ChangeCartAddressEntityToJson(this);
  @override
  ChangeCartAddressEntity restore(ChangeCartAddress data) {
    return ChangeCartAddressEntity(status: status);
  }

  @override
  ChangeCartAddress transform() {
    return ChangeCartAddress(status: status);
  }
}
