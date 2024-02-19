import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class ChangeAddressUsecase
    extends BaseUseCase<BaseError, ChangeAddressParams, Address> {
  final AddressRepository _addressRepository;

  ChangeAddressUsecase(this._addressRepository);

  @override
  Future<Either<BaseError, Address>> execute({required params}) {
    return _addressRepository.changeAddress(Address(
        id: params.id,
        streetName: params.streetName,
        country: params.country,
        city: params.city,
        pincode: params.pincode,
        floor: params.floor,
        building: params.building,
        apartment: params.apartment));
  }
}

class ChangeAddressParams extends Params {
  final int id;
  final String streetName;
  final String country;
  final String city;
  final int pincode;
  final String floor;
  final String building;
  final String apartment;

  ChangeAddressParams({
    required this.id,
    required this.streetName,
    required this.country,
    required this.city,
    required this.pincode,
    required this.floor,
    required this.building,
    required this.apartment,
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
