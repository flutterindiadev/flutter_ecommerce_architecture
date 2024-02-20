import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class EditAddressUsecase
    extends BaseUseCase<BaseError, EditAddressUsecaseParams, Address> {
  final AddressRepository _addressRepository;

  EditAddressUsecase(this._addressRepository);
  @override
  Future<Either<BaseError, Address>> execute({required params}) {
    return _addressRepository.editAddress(Address(
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

class EditAddressUsecaseParams extends Params {
  final int id;
  final String streetName;
  final String country;
  final String city;
  final int pincode;
  final String floor;
  final String building;
  final String apartment;

  EditAddressUsecaseParams(
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
