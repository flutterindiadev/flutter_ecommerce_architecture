import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class DeleteAddressUsecase
    extends BaseUseCase<BaseError, DeleteAddressParams, List<Address>> {
  final AddressRepository _addressRepository;

  DeleteAddressUsecase(this._addressRepository);

  @override
  Future<Either<BaseError, List<Address>>> execute({required params}) {
    return _addressRepository.deleteAddress(params.addressId);
  }
}

class DeleteAddressParams extends Params {
  String addressId;

  DeleteAddressParams(this.addressId);

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
