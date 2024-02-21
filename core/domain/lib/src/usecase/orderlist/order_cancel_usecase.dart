import 'package:domain/domain.dart';

import '../base/base_usecase.dart';

class OrderCancelUsecase extends BaseUseCase<NetworkError, OrderCancelUsecaseParam,OrderCancel> {
  OrderRepository _orderRepository;
  OrderCancelUsecase(this._orderRepository);

  @override
  Future<Either<NetworkError, OrderCancel>> execute({required OrderCancelUsecaseParam params}) {
    return _orderRepository.orderCancel(orderId: params.orderId);
  }

}
class OrderCancelUsecaseParam extends Params {
  String? orderId;
  OrderCancelUsecaseParam({int? orderId});

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}