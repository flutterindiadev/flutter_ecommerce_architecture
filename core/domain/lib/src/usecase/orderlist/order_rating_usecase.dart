import 'package:domain/domain.dart';

import '../base/base_usecase.dart';

class SubmitOrderRatingUseCase
    extends BaseUseCase<NetworkError, OrderRatingUseCaseParam, OrderRating> {
  final OrderRepository orderRepository;

  SubmitOrderRatingUseCase({required this.orderRepository});

  @override
  Future<Either<NetworkError, OrderRating>> execute(
      {required OrderRatingUseCaseParam params}) {
    return orderRepository.getorderRating(
        orderRatingRequest: OrderRatingRequest(
            orderId: params.orderId,
            rating: params.rating,
            review: params.review));
  }
}

class OrderRatingUseCaseParam extends Params {
  String orderId;
  int rating;
  String? review;

  OrderRatingUseCaseParam(
      {required this.orderId, required this.rating, this.review});

  @override
  Either<AppError, bool> verify() {
    if (Validator.isnotRated(rating)) {
      return Left(
        AppError(
            throwable: Exception(),
            error: ErrorInfo(message: ''),
            type: ErrorType.notRated),
      );
    } else {
      return right(true);
    }
  }
}
