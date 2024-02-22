import 'package:domain/src/repository/order_repository.dart';

import '../../../domain.dart';
import '../base/base_usecase.dart';

class GetOrderListUsecase extends BaseUseCase<NetworkError,
    GetOrderListUsecaseParams, List<OrderItem>> {
  OrderRepository orderRepository;

  GetOrderListUsecase({required this.orderRepository});

  @override
  Future<Either<NetworkError, List<OrderItem>>> execute(
      {required GetOrderListUsecaseParams params}) {
    return orderRepository.getOrderList(userId: params.userId);
  }
}

class GetOrderListUsecaseParams extends Params {
  String userId;

  GetOrderListUsecaseParams({required this.userId});

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
