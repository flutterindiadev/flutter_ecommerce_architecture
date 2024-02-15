import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'address_entity.g.dart';

@JsonSerializable()
class AddressEntity
    implements BaseLayerDataTransformer<AddressEntity, Address> {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'streetName')
  final String streetName;

  @JsonKey(name: 'country')
  final String country;
  @JsonKey(name: 'city')
  final String city;
  @JsonKey(name: 'pincode')
  final int pincode;
  @JsonKey(name: 'floor')
  final String floor;
  @JsonKey(name: 'building')
  final String building;
  @JsonKey(name: 'apartment')
  final String apartment;

  factory AddressEntity.fromJson(Map<String, dynamic> json) =>
      _$AddressEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AddressEntityToJson(this);

  AddressEntity(
      {required this.id,
      required this.streetName,
      required this.country,
      required this.city,
      required this.pincode,
      required this.floor,
      required this.building,
      required this.apartment});

  @override
  AddressEntity restore(Address data) {
    return AddressEntity(
        id: data.id,
        streetName: data.streetName,
        country: data.city,
        city: data.city,
        pincode: data.pincode,
        floor: data.floor,
        building: data.building,
        apartment: data.apartment);
  }

  @override
  Address transform() {
    return Address(
        id: id,
        streetName: streetName,
        country: country,
        city: city,
        pincode: pincode,
        floor: floor,
        building: building,
        apartment: apartment);
  }
}
