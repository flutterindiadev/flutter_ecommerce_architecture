import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/models/address/address_entity.dart';

part 'address_response_entity.g.dart';

@JsonSerializable()
class AddressResponseEntity
    implements BaseLayerDataTransformer<AddressEntity, Address> {
  @JsonKey(name: 'data')
  final AddressEntity addressEntity;

  AddressResponseEntity(this.addressEntity);

  factory AddressResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$AddressResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AddressResponseEntityToJson(this);

  @override
  AddressEntity restore(Address data) {
    return AddressEntity(
        id: data.id,
        streetName: data.streetName,
        country: data.country,
        city: data.city,
        pincode: data.pincode,
        floor: data.floor,
        building: data.building,
        apartment: data.apartment);
  }

  @override
  Address transform() {
    return Address(
        id: addressEntity.id,
        streetName: addressEntity.streetName,
        country: addressEntity.country,
        city: addressEntity.city,
        pincode: addressEntity.pincode,
        floor: addressEntity.floor,
        building: addressEntity.building,
        apartment: addressEntity.apartment);
  }
}
