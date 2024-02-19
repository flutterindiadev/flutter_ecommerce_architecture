import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class AddAddressUsecase
    extends BaseUseCase<BaseError, AddAddressParams, Address> {
  final AddressRepository _addressRepository;

  AddAddressUsecase(this._addressRepository);

  @override
  Future<Either<BaseError, Address>> execute({required params}) {
    return _addressRepository.addAddress(Address(
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

class AddAddressParams extends Params {
  final int id;
  final String streetName;
  final String country;
  final String city;
  final int pincode;
  final String floor;
  final String building;
  final String apartment;

  AddAddressParams(
      {required this.id,
      required this.streetName,
      required this.country,
      required this.city,
      required this.pincode,
      required this.floor,
      required this.building,
      required this.apartment});

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
