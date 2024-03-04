import 'package:data/data.dart';
import 'package:domain/domain.dart';

class AddressRepositoryImpl extends AddressRepository {
  final NetworkPort networkPort;

  AddressRepositoryImpl(this.networkPort);

  @override
  Future<Either<NetworkError, Address>> addAddress(Address address) {
    return networkPort.addAddress(address: address);
  }

  @override
  Future<Either<NetworkError, Address>> changeAddress(Address address) {
    return networkPort.changeAddress(address: address);
  }

  @override
  Future<Either<NetworkError, List<Address>>> deleteAddress(String addressId) {
    return networkPort.deleteAddress(addressId: addressId);
  }

  @override
  Future<Either<NetworkError, List<Address>>> getAddresses() {
    return networkPort.getAddresses();
  }

  @override
  Future<Either<NetworkError, Address>> editAddress(Address address) {
    return networkPort.addAddress(address: address);
  }
}
