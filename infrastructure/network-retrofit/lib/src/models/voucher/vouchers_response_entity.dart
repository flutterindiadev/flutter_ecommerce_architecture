import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/models/voucher/voucher_entity.dart';

part 'vouchers_response_entity.g.dart';

@JsonSerializable()
class VouchersResponseEntity
    implements BaseLayerDataTransformer<VouchersResponseEntity, List<Voucher>> {
  @JsonKey(name: 'data')
  final List<VoucherEntity> voucherEntity;

  VouchersResponseEntity(this.voucherEntity);

  factory VouchersResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$VouchersResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$VouchersResponseEntityToJson(this);

  @override
  VouchersResponseEntity restore(List<Voucher> data) {
    return VouchersResponseEntity(data
        .map((e) => VoucherEntity(
            id: e.id,
            voucherCode: e.voucherCode,
            expiryDate: e.expiryDate,
            voucherValue: e.voucherValue))
        .toList());
  }

  @override
  List<Voucher> transform() {
    return voucherEntity
        .map((e) => Voucher(
            id: e.id,
            voucherCode: e.voucherCode,
            expiryDate: e.expiryDate,
            voucherValue: e.voucherValue))
        .toList();
  }
}
