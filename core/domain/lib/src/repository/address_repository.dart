import 'package:domain/domain.dart';

abstract class AddressRepository {
  Future<Either<NetworkError, Address>> addAddress(Address address);

  Future<Either<NetworkError, List<Address>>> getAddresses();

  Future<Either<NetworkError, Address>> changeAddress(Address address);

  Future<Either<NetworkError, List<Address>>> deleteAddress(String addressId);

  Future<Either<NetworkError, Address>> editAddress(Address address);
}
