import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/models/address/address_entity.dart';

part 'addresses_response_entity.g.dart';

@JsonSerializable()
class AddressesResponseEntity
    implements
        BaseLayerDataTransformer<AddressesResponseEntity, List<Address>> {
  final List<AddressEntity> addressEntity;

  AddressesResponseEntity({required this.addressEntity});

  @override
  AddressesResponseEntity restore(List<Address> data) {
    data
        .map((e) => AddressEntity(
            id: e.id,
            streetName: e.streetName,
            country: e.country,
            city: e.city,
            pincode: e.pincode,
            floor: e.floor,
            building: e.building,
            apartment: e.apartment))
        .toList();

    return AddressesResponseEntity(addressEntity: addressEntity);
  }

  factory AddressesResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$AddressesResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AddressesResponseEntityToJson(this);

  @override
  List<Address> transform() {
    final List<Address> addressList = [];
    for (var i = 0; i < addressEntity.length; i++) {
      addressList.add(Address(
          id: addressEntity[i].id,
          streetName: addressEntity[i].streetName,
          country: addressEntity[i].country,
          city: addressEntity[i].city,
          pincode: addressEntity[i].pincode,
          floor: addressEntity[i].floor,
          building: addressEntity[i].building,
          apartment: addressEntity[i].apartment));
    }
    return addressList;
  }
}
