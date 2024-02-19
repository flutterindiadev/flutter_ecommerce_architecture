import 'package:domain/domain.dart';
import 'package:domain/src/repository/address_repository.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class GetAddressesUsecase
    extends BaseUseCase<BaseError, GetAddressParams, List<Address>> {
  final AddressRepository _addressRepository;

  GetAddressesUsecase(this._addressRepository);

  @override
  Future<Either<BaseError, List<Address>>> execute({required params}) {
    return _addressRepository.getAddresses();
  }
}

class GetAddressParams extends Params {
  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
