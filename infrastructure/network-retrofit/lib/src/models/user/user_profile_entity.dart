import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/models/orderItem_entity/order_item_entity.dart';
import 'package:network_retrofit/src/models/product/product_entity.dart';

import '../address/address_entity.dart';

@JsonSerializable()
class UserProfileEntity
    implements BaseLayerDataTransformer<UserProfileEntity, UserProfile> {
  @JsonKey(name: 'id')
  final int userId;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'mobile')
  final String mobile;

  @JsonKey(name: 'address')
  AddressEntity address;
  @JsonKey(name: 'orderHistory')
  List<OrderItemEntity> orderHistory;
  @JsonKey(name: 'favoriteProducts')
  List<ProductEntity> favoriteProducts;

  UserProfileEntity(
      {required this.address,
      required this.email,
      required this.favoriteProducts,
      required this.mobile,
      required this.orderHistory,
      required this.userId});

  @override
  UserProfileEntity restore(UserProfile data) {
    return UserProfileEntity(
        address: AddressEntity(
            id: data.address.id,
            streetName: data.address.streetName,
            country: data.address.city,
            city: data.address.city,
            pincode: data.address.pincode,
            floor: data.address.floor,
            building: data.address.building,
            apartment: data.address.apartment),
        email: data.email,
        favoriteProducts: data.favoriteProducts
            .map((e) => ProductEntity(
                id: e.id,
                currencyId: e.currencyId,
                name: e.name,
                description: e.description,
                imageUrl: e.imageUrl,
                category: e.category,
                price: e.price))
            .toList(),
        mobile: data.mobile,
        orderHistory: data.orderHistory
            .map((e) => OrderItemEntity(
                orderId: e.orderId,
                paymentMode: e.paymentMode,
                deliveryDate: e.deliveryDate,
                address: AddressEntity(
                    id: e.address.id,
                    streetName: e.address.streetName,
                    country: e.address.country,
                    city: e.address.city,
                    pincode: e.address.pincode,
                    floor: e.address.floor,
                    building: e.address.building,
                    apartment: e.address.apartment),
                product: ProductEntity(
                    id: e.product.id,
                    currencyId: e.product.currencyId,
                    name: e.product.name,
                    description: e.product.description,
                    imageUrl: e.product.imageUrl,
                    category: e.product.category,
                    price: e.product.price)))
            .toList(),
        userId: data.userId);
  }

  @override
  UserProfile transform() {
    return UserProfile(
        userId: userId,
        address: Address(
            id: address.id,
            streetName: address.streetName,
            country: address.country,
            city: address.city,
            pincode: address.pincode,
            floor: address.floor,
            building: address.building,
            apartment: address.apartment),
        email: email,
        favoriteProducts: favoriteProducts
            .map((e) => Product(
                id: e.id,
                name: e.name,
                description: e.description,
                imageUrl: e.imageUrl,
                price: e.price,
                category: e.category,
                currencyId: e.currencyId))
            .toList(),
        mobile: mobile,
        orderHistory: orderHistory
            .map((e) => OrderItem(
                orderId: e.orderId,
                product: Product(
                    id: e.product.id,
                    name: e.product.name,
                    description: e.product.description,
                    imageUrl: e.product.imageUrl,
                    price: e.product.price,
                    category: e.product.category,
                    currencyId: e.product.currencyId),
                paymentMode: e.paymentMode,
                deliveryDate: e.deliveryDate,
                address: Address(
                    id: e.address.id,
                    streetName: e.address.streetName,
                    country: e.address.country,
                    city: e.address.city,
                    pincode: e.address.pincode,
                    floor: e.address.floor,
                    building: e.address.building,
                    apartment: e.address.apartment)))
            .toList());
  }
}
