import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'voucher_entity.g.dart';

@JsonSerializable()
class VoucherEntity
    implements BaseLayerDataTransformer<VoucherEntity, Voucher> {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'voucherCode')
  final String voucherCode;
  @JsonKey(name: 'expiryDate')
  final DateTime expiryDate;
  @JsonKey(name: 'voucherValue')
  final double voucherValue;

  VoucherEntity(
      {required this.id,
      required this.voucherCode,
      required this.expiryDate,
      required this.voucherValue});

  factory VoucherEntity.fromJson(Map<String, dynamic> json) =>
      _$VoucherEntityFromJson(json);

  Map<String, dynamic> toJson() => _$VoucherEntityToJson(this);

  @override
  VoucherEntity restore(Voucher data) {
    return VoucherEntity(
        id: data.id,
        voucherCode: data.voucherCode,
        expiryDate: data.expiryDate,
        voucherValue: data.voucherValue);
  }

  @override
  Voucher transform() {
    return Voucher(
        id: id,
        voucherCode: voucherCode,
        expiryDate: expiryDate,
        voucherValue: voucherValue);
  }
}
