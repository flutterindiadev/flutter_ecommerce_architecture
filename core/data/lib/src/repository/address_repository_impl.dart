import 'package:data/data.dart';
import 'package:domain/domain.dart';

class AddressRepositoryImpl extends AddressRepository {
  final NetworkPort _networkPort;

  AddressRepositoryImpl(this._networkPort);

  @override
  Future<Either<NetworkError, Address>> addAddress(Address address) {
    return _networkPort.addAddress(address: address);
  }

  @override
  Future<Either<NetworkError, Address>> changeAddress(Address address) {
    return _networkPort.changeAddress(address: address);
  }

  @override
  Future<Either<NetworkError, List<Address>>> deleteAddress(String addressId) {
    return _networkPort.deleteAddress(addressId: addressId);
  }

  @override
  Future<Either<NetworkError, List<Address>>> getAddresses() {
    return _networkPort.getAddresses();
  }

  @override
  Future<Either<NetworkError, Address>> editAddress(Address address) {
    return _networkPort.addAddress(address: address);
  }
}
