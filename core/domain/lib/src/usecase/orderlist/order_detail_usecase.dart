import '../../../domain.dart';
import '../base/base_usecase.dart';

class OrderDetailsUseCase
    extends BaseUseCase<NetworkError, OrderDetailsUseCaseParam, OrderItem?> {
  final OrderRepository orderRepository;

  OrderDetailsUseCase(this.orderRepository);

  @override
  Future<Either<NetworkError, OrderItem?>> execute(
      {required OrderDetailsUseCaseParam params}) {
    return orderRepository.getOrderDetail(orderId: params.orderId);
  }
}

class OrderDetailsUseCaseParam extends Params {
  String orderId;
  OrderDetailsUseCaseParam({required this.orderId});

  @override
  Either<AppError, bool> verify() {
    return right(true);
  }
}
