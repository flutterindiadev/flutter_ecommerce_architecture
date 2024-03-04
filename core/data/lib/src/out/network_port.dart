import 'package:domain/domain.dart';

abstract class NetworkPort {
  Future<Either<NetworkError, bool>> addtoCart(
      {required AddtoCartRequest addtoCartRequest});

  Future<Either<NetworkError, Cart>> getCart({required int userId});

  Future<Either<NetworkError, CartVoucher>> addVoucherinCart(
      {required CartVoucherAddRequest cartVoucherAddRequest});
  Future<Either<NetworkError, CartVoucherRemove>> removeVoucherfromCart(
      {required CartVoucherRemoveRequest cartVoucherRemoveRequest});

  //User

  Future<Either<NetworkError, User>> loginWithEmail(
      {required LoginRequest loginRequest});
  Future<Either<NetworkError, User>> signUpWithEmail(
      {required SignUpRequest signUpRequest});

  Future<Either<NetworkError, bool>> userExists({required String email});

  Future<Either<NetworkError, void>> forgotPassword();

  Future<Either<NetworkError, bool>> changePassword(
      {required ChangePasswordRequest changePasswordRequest});

  Future<Either<NetworkError, bool>> verifyotp({required int otp});

  Future<Either<NetworkError, Logout>> logout(
      {required LogoutRequest logoutRequest});

  Future<Either<NetworkError, List<Product>>> getUserFavoriteProducts(
      {required int userId});

  Future<Either<NetworkError, UserProfile>> getUserProfile(
      {required int userId});

  Future<Either<NetworkError, UserProfile>> updateUserProfile(
      {required UserProfile userProfile});

  Future<Either<NetworkError, UserSettings>> getUserSettings(
      {required int userId});

  //products

  Future<Either<NetworkError, List<Product>>> getProducts();

  Future<Either<NetworkError, Cart>> removeFromCart(
      {required RemovefromCartRequest removefromCartRequest});
  Future<Either<NetworkError, ChangeCartAddress>> changeCartAddress(
      {required CartAddressChangeRequest cartAddressChangeRequest});
  Future<Either<NetworkError, OrderItem>> checkoutCart(
      {required CheckoutRequest checkoutRequest});
  Future<Either<NetworkError, Product>> getProductDetail(
      {required int productId});

  Future<Either<NetworkError, List<ProductCategory>>> getProductCategory();

  Future<Either<NetworkError, List<Product>>> searchProducts(
      {required String productName});

  Future<Either<NetworkError, List<Product>>> selectCategory(
      {required String category});

  Future<Either<NetworkError, List<Promotion>>> getPromotions();

  //Address

  Future<Either<NetworkError, Address>> addAddress({required Address address});

  Future<Either<NetworkError, List<Address>>> getAddresses();

  Future<Either<NetworkError, Address>> changeAddress(
      {required Address address});

  Future<Either<NetworkError, List<Address>>> deleteAddress(
      {required String addressId});

  Future<Either<NetworkError, Address>> editAddress({required Address address});

  //voucher

  Future<Either<NetworkError, List<Voucher>>> getVouchers();

  /////order////////
  Future<Either<NetworkError, List<OrderItem>>> getOrderList(
      {required String userId});
  Future<Either<NetworkError, OrderItem?>> getOrderDetail(
      {required String? orderId});
  Future<Either<NetworkError, OrderRating>> getOrderRating(
      {required OrderRatingRequest orderRatingRequest});

  Future<Either<NetworkError, OrderRepeat>> doOrderRepeat(
      {required String? orderId});
  Future<Either<NetworkError, OrderCancel>> orderCancel(
      {required String? orderId});

  Future<Either<NetworkError, List<OrderItem>>> getPending(
      {required String orderId});

  Future<Either<NetworkError, OrderStatus>> getOrderStatus(
      {required String orderIdorTrackingId});
}
