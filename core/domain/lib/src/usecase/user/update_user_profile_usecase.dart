import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class UpdateUserprofileUsecase extends BaseUseCase<BaseError,
    UpdateUserprofileUsecaseParams, UserProfile> {
  UserRepository _userRepository;

  UpdateUserprofileUsecase(this._userRepository);

  @override
  Future<Either<BaseError, UserProfile>> execute(
      {required UpdateUserprofileUsecaseParams params}) {
    return _userRepository.updateUserProfile(
        userProfile: UserProfile(
            userId: params.userId,
            address: Address(
                id: params.addressId,
                streetName: params.streetName,
                country: params.country,
                city: params.city,
                pincode: params.pincode,
                floor: params.floor,
                building: params.building,
                apartment: params.apartment),
            email: params.email,
            favoriteProducts: params.favoriteProducts,
            mobile: params.mobile,
            orderHistory: params.orderHistory));
  }
}

class UpdateUserprofileUsecaseParams extends Params {
  final int userId;
  final String email;
  final String mobile;

  final int addressId;
  final String streetName;
  final String country;
  final String city;
  final int pincode;
  final String floor;
  final String building;
  final String apartment;

  final List<OrderItem> orderHistory;
  final List<Product> favoriteProducts;

  UpdateUserprofileUsecaseParams(
      {super.reloading,
      required this.userId,
      required this.email,
      required this.mobile,
      required this.addressId,
      required this.streetName,
      required this.country,
      required this.city,
      required this.pincode,
      required this.floor,
      required this.building,
      required this.apartment,
      required this.orderHistory,
      required this.favoriteProducts});

  @override
  Either<AppError, bool> verify() {
    if (Validator.isUserIdValid(userId)) {
      return Right(true);
    } else {
      return Left(AppError(
          throwable: Exception(),
          error: ErrorInfo(message: ''),
          type: ErrorType.userIdNotFound));
    }
  }
}
