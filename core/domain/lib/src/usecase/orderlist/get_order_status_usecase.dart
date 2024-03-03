import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class GetOrderStatusUsecase
    extends BaseUseCase<BaseError, GetOrderStatusUsecaseParams, OrderStatus> {
  OrderRepository orderRepository;

  GetOrderStatusUsecase(this.orderRepository);

  @override
  Future<Either<BaseError, OrderStatus>> execute(
      {required GetOrderStatusUsecaseParams params}) {
    return orderRepository.getOrderStatus(
        orderIdorTrackingId: params.orderIdorTrackingId);
  }
}

class GetOrderStatusUsecaseParams extends Params {
  String orderIdorTrackingId;

  GetOrderStatusUsecaseParams(this.orderIdorTrackingId);

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
