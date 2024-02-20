import 'package:domain/domain.dart';

abstract class NetworkPort {
  Future<Either<NetworkError, Cart>> addtoCart(
      {required AddtoCartRequest addtoCartRequest});

  Future<Either<NetworkError, Cart>> getCart({required int userId});

  //onboarding

  Future<Either<NetworkError, User>> loginWithEmail(
      {required LoginRequest loginRequest});
  Future<Either<NetworkError, User>> signUpWithEmail(
      {required SignUpRequest signUpRequest});

  Future<Either<NetworkError, void>> forgotPassword();

  Future<Either<NetworkError, bool>> verifyotp({required int otp});

  //products

  Future<Either<NetworkError, List<Product>>> getProducts();
  Future<Either<NetworkError, Logout>> logout(
      {required LogoutRequest logoutRequest});

  Future<Either<NetworkError, Cart>> removeFromCart(
      {required RemovefromCartRequest removefromCartRequest});
  Future<Either<NetworkError, ChangeCartAddress>> changeCartAddress(
      {required CartAddressChangeRequest cartAddressChangeRequest});
  Future<Either<NetworkError, OrderItem>> checkoutCart(
      {required CheckoutRequest checkoutRequest});
  Future<Either<NetworkError, Product>> getProductDetail(
      {required int productId});

  Future<Either<NetworkError, List<ProductCategory>>> getProductCategory();

  //Address

  Future<Either<NetworkError, Address>> addAddress({required Address address});

  Future<Either<NetworkError, List<Address>>> getAddresses();

  Future<Either<NetworkError, Address>> changeAddress(
      {required Address address});

  Future<Either<NetworkError, List<Address>>> deleteAddress(
      {required String addressId});

  //voucher

  Future<Either<NetworkError, List<Voucher>>> getVouchers();
}
