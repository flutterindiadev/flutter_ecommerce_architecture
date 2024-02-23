import 'package:data/data.dart';
import 'package:domain/domain.dart';

class OrderRepositoryImpl extends OrderRepository {
  NetworkPort networkPort;

  OrderRepositoryImpl({required this.networkPort});

  @override
  Future<Either<NetworkError, List<OrderItem>>> getOrderList(
      {required String userId}) {
    return networkPort.getOrderList(userId: userId);
  }

  @override
  Future<Either<NetworkError, OrderItem?>> getOrderDetail(
      {required String? orderId}) {
    return networkPort.getOrderDetail(orderId: orderId);
  }

  @override
  Future<Either<NetworkError, OrderRating>> getorderRating(
      {required OrderRatingRequest orderRatingRequest}) {
    return networkPort.getOrderRating(orderRatingRequest: orderRatingRequest);
  }

  @override
  Future<Either<NetworkError, OrderRepeat>> doOrderRepeat(
      {required String? orderId}) {
    return networkPort.doOrderRepeat(orderId: orderId);
  }

  @override
  Future<Either<NetworkError, OrderCancel>> orderCancel(
      {required String? orderId}) {
    return networkPort.orderCancel(orderId: orderId);
  }

  @override
  Future<Either<NetworkError, List<OrderItem>>> getPendingOrder({required String orderId}) {
   return networkPort.getPending(orderId: orderId);
  }
}
