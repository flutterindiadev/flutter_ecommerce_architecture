import '../../../domain.dart';
import '../base/base_usecase.dart';

class GetOrderListUsecase  extends BaseUseCase<NetworkError, GetOrderListUsecaseParams,
   List <OrderItem>> {
  UserRepository userRepository;


  GetOrderListUsecase({required this.userRepository});

  @override
  Future<Either<NetworkError, List<OrderItem>>> execute({required GetOrderListUsecaseParams params}) {
   return userRepository.getOrderList(params.userId);
  }
}

class GetOrderListUsecaseParams extends Params{
  String userId;


  GetOrderListUsecaseParams({required this.userId});

  @override
  Either<AppError, bool> verify() {
   return Right(true);
  }

}