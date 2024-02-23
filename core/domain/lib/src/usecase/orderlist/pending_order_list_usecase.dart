import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class PendingOrderListUsecase
    extends BaseUseCase<NetworkError, PendingOrderListParams, List<OrderItem>> {
  OrderRepository orderRepository;

  PendingOrderListUsecase({required this.orderRepository});

  @override
  Future<Either<NetworkError, List<OrderItem>>> execute(
      {required PendingOrderListParams params}) {
    return orderRepository.getPendingOrder(orderId: params.userId);
  }
}

class PendingOrderListParams extends Params {
  String userId;

  PendingOrderListParams({required this.userId});

  @override
  Either<AppError, bool> verify() {
    // TODO: implement verify
    throw UnimplementedError();
  }
}
