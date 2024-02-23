import 'package:data/data.dart';
import 'package:network_retrofit/src/models/changeCartAddress/change_cart_Address_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'change_cart_address_response.g.dart';

@JsonSerializable()
class ChangeCartAddressResponseEntity
    implements
        BaseLayerDataTransformer<ChangeCartAddressEntity, ChangeCartAddress> {
  @JsonKey(name: 'data')
  final ChangeCartAddressEntity changeCartAddressEntity;

  ChangeCartAddressResponseEntity({required this.changeCartAddressEntity});
  factory ChangeCartAddressResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$ChangeCartAddressResponseEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ChangeCartAddressResponseEntityToJson(this);

  @override
  ChangeCartAddressEntity restore(ChangeCartAddress data) {
    return ChangeCartAddressEntity(status: data.status);
  }

  @override
  ChangeCartAddress transform() {
    return ChangeCartAddress(status: changeCartAddressEntity.status);
  }
}
