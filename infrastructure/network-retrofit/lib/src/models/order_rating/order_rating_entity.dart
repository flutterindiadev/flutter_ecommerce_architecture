import 'dart:convert';

import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
part 'order_rating_entity.g.dart';

@JsonSerializable()
class OrderRatingEntity implements BaseLayerDataTransformer<OrderRatingEntity , OrderRating > {
  
@JsonKey(name:'status')
  bool status;

  OrderRatingEntity({required this.status});


factory OrderRatingEntity.fromJson(Map<String, dynamic> json) =>
    _$OrderRatingEntityFromJson(json);

Map<String, dynamic> toJson() => _$OrderRatingEntityToJson(this);

@override
  OrderRatingEntity restore(OrderRating data) {
    return OrderRatingEntity(status: status);
  }

  @override
  OrderRating transform() {
   return OrderRating(status: status);
  }
}