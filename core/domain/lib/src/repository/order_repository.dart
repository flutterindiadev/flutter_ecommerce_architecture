import 'dart:async';

import '../../domain.dart';

abstract class OrderRepository {
  Future<Either<NetworkError, List<OrderItem>>> getOrderList(
      {required String userId});

  Future<Either<NetworkError, OrderItem?>> getOrderDetail(
      {required String orderId});

  Future<Either<NetworkError, OrderRating>> getorderRating(
      {required OrderRatingRequest orderRatingRequest});

  Future<Either<NetworkError, OrderRepeat>> doOrderRepeat(
      {required String? orderId});

  Future<Either<NetworkError, OrderCancel>> orderCancel(
      {required String? orderId});

  Future<Either<NetworkError, List<OrderItem>>> getPendingOrder(
      {required String orderId});

  Future<Either<NetworkError, OrderStatus>> getOrderStatus(
      {required String orderIdorTrackingId});
}
