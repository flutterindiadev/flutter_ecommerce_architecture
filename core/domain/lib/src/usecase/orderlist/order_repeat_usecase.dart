import 'package:domain/domain.dart';

import '../base/base_usecase.dart';

class OrderRepeatUsecase extends BaseUseCase<NetworkError, OrderRepeatUsecaseParam,OrderRepeat> {
  OrderRepository _orderRepository;
  OrderRepeatUsecase(this._orderRepository);

  @override
  Future<Either<NetworkError, OrderRepeat>> execute({required OrderRepeatUsecaseParam params}) {
    return _orderRepository.doOrderRepeat(orderId: params.orderId);
  }

}
class OrderRepeatUsecaseParam extends Params {
  String? orderId;
  OrderRepeatUsecaseParam({int? orderId});

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}