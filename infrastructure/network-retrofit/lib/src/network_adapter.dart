import 'package:dartz/dartz.dart';
import 'package:data/data.dart';
import 'package:network_retrofit/src/utils/safe_api_call.dart';

import 'services/retrofit_service.dart';

class NetworkAdapter implements NetworkPort {
  final RetrofitService apiService;
  NetworkAdapter(this.apiService);

  @override
  Future<Either<NetworkError, User>> loginWithEmail(
      {required LoginRequest loginRequest}) async {
    var response = await safeApiCall(apiService.login(loginRequest));
    return response.fold((l) => Left(l), (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, User>> signUpWithEmail(
      {required SignUpRequest signUpRequest}) async {
    var response = await safeApiCall(
      apiService.signup(signUpRequest),
    );
    return response.fold((l) => Left(l), (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, void>> forgotPassword() async {
    var response = await safeApiCall(apiService.forgotPassword());
    return response.fold((l) => Left(l), (r) => Right(r.data));
  }

  @override
  Future<Either<NetworkError, List<Product>>> getProducts() async {
    var response = await safeApiCall(apiService.getProducts());
    return response.fold(
      (l) => Left(l),
      (r) => Right(
        r.data.transform(),
      ),
    );
  }

  @override
  Future<Either<NetworkError, bool>> addtoCart(
      {required AddtoCartRequest addtoCartRequest}) async {
    var response = await safeApiCall(apiService.addtoCart(addtoCartRequest));
    return response.fold(
      (l) => left(l),
      (r) => Right(true),
    );
  }

  @override
  Future<Either<NetworkError, Cart>> getCart({required int userId}) async {
    var response = await safeApiCall(apiService.getCart(userId));
    return response.fold(
      (l) => Left(l),
      (r) => Right(
        r.data.transform(),
      ),
    );
  }

  @override
  Future<Either<NetworkError, Cart>> removeFromCart(
      {required RemovefromCartRequest removefromCartRequest}) async {
    var response =
        await safeApiCall(apiService.removeFromCart(removefromCartRequest));
    return response.fold(
      (l) => Left(l),
      (r) => Right(
        r.data.transform(),
      ),
    );
  }

  @override
  Future<Either<NetworkError, Logout>> logout(
      {required LogoutRequest logoutRequest}) async {
    var response = await safeApiCall(apiService.logout(logoutRequest));
    return response.fold(
      (l) => Left(l),
      (r) => Right(
        r.data.transform(),
      ),
    );
  }

  @override
  Future<Either<NetworkError, OrderItem>> checkOutCart(
      {required CheckoutRequest checkoutRequest}) async {
    var response = await safeApiCall(apiService.checkOutCart(checkoutRequest));
    return response.fold(
      (l) => Left(l),
      (r) => Right(r.data.transform()),
    );
  }

  @override
  Future<Either<NetworkError, Product>> getProductDetail(
      {required int productId}) async {
    var response = await safeApiCall(apiService.getProductDetail(productId));
    return response.fold((l) => Left(l), (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, List<ProductCategory>>>
      getProductCategory() async {
    var response = await safeApiCall(apiService.getProductCategory());

    return response.fold((l) => Left(l), (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, Address>> addAddress(
      {required Address address}) async {
    var response = await safeApiCall(apiService.addAddress(address));

    return response.fold((l) => Left(l), (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, Address>> changeAddress(
      {required Address address}) async {
    var response = await safeApiCall(apiService.changeAddress(address));

    return response.fold((l) => Left(l), (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, List<Address>>> deleteAddress(
      {required String addressId}) async {
    var response = await safeApiCall(apiService.deleteAddress(addressId));

    return response.fold((l) => Left(l), (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, List<Address>>> getAddresses() async {
    var response = await safeApiCall(apiService.getAddresses());

    return response.fold((l) => Left(l), (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, List<Voucher>>> getVouchers() async {
    var response = await safeApiCall(apiService.getVouchers());

    return response.fold((l) => Left(l), (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, bool>> verifyotp({required int otp}) async {
    var response = await safeApiCall(apiService.verifyotp(otp));

    return response.fold((l) => Left(l), (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, OrderItem>> checkoutCart(
      {required CheckoutRequest checkoutRequest}) async {
    var response = await safeApiCall(apiService.checkOutCart(checkoutRequest));

    return response.fold((l) => Left(l), (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, bool>> userExists({required String email}) async {
    var response = await safeApiCall(apiService.userExists(email));

    return response.fold((l) => Left(l), (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, List<Product>>> searchProducts(
      {required String productName}) async {
    var response = await safeApiCall(apiService.searchProducts(productName));

    return response.fold((l) => Left(l), (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, Address>> editAddress(
      {required Address address}) async {
    var response = await safeApiCall(apiService.editAddress(address));

    return response.fold((l) => Left(l), (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, List<Product>>> getUserFavoriteProducts(
      {required int userId}) async {
    var response =
        await safeApiCall(apiService.getUserFavoriteProducts(userId));

    return response.fold((l) => Left(l), (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, UserProfile>> getUserProfile(
      {required int userId}) async {
    var response = await safeApiCall(apiService.getUserProfile(userId));

    return response.fold((l) => Left(l), (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, List<Product>>> selectCategory(
      {required String category}) async {
    var response = await safeApiCall(apiService.selectCategory());

    return response.fold((l) => Left(l), (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, bool>> changePassword(
      {required ChangePasswordRequest changePasswordRequest}) async {
    var response =
        await safeApiCall(apiService.changePassword(changePasswordRequest));

    return response.fold((l) => Left(l), (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, UserSettings>> getUserSettings(
      {required int userId}) async {
    var response = await safeApiCall(apiService.getUserSettings(userId));
    return response.fold((l) => Left(l), (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, UserProfile>> updateUserProfile(
      {required UserProfile userProfile}) async {
    var response = await safeApiCall(apiService.updateUserProfile(userProfile));

    return response.fold((l) => Left(l), (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, List<Promotion>>> getPromotions() async {
    var response = await safeApiCall(apiService.getPromotions());

    return response.fold((l) => Left(l), (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, ChangeCartAddress>> changeCartAddress(
      {required CartAddressChangeRequest cartAddressChangeRequest}) async {
    var response = await safeApiCall(
        apiService.changeCartAddress(cartAddressChangeRequest));

    return response.fold((l) => Left(l), (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, CartVoucher>> addVoucherinCart(
      {required CartVoucherAddRequest cartVoucherAddRequest}) async {
    var response =
        await safeApiCall(apiService.addVouchertoCart(cartVoucherAddRequest));

    return response.fold((l) => Left(l), (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, CartVoucherRemove>> removeVoucherfromCart(
      {required CartVoucherRemoveRequest cartVoucherRemoveRequest}) async {
    var response = await safeApiCall(
        apiService.removeVoucherFromCart(cartVoucherRemoveRequest));

    return response.fold((l) => Left(l), (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, List<OrderItem>>> getOrderList(
      {required String userId}) async {
    var response = await safeApiCall(apiService.getOrderList());

    return response.fold((l) => Left(l), (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, OrderItem?>> getOrderDetail(
      {required String? orderId}) async {
    var response = await safeApiCall(apiService.getOrderDetail());
    return response.fold(
      (l) => Left(l),
      (r) => Right(
        r.data.transform(),
      ),
    );
  }

  @override
  Future<Either<NetworkError, OrderRating>> getOrderRating(
      {required OrderRatingRequest orderRatingRequest}) async {
    var response =
        await safeApiCall(apiService.getOrderRating(orderRatingRequest));
    return response.fold(
      (l) => Left(l),
      (r) => Right(
        r.data.transform(),
      ),
    );
  }

  @override
  Future<Either<NetworkError, OrderRepeat>> doOrderRepeat(
      {required String? orderId}) async {
    var response = await safeApiCall(apiService.doOrderRepeat(orderId));
    return response.fold(
      (l) => Left(l),
      (r) => Right(
        r.data.transform(),
      ),
    );
  }

  @override
  Future<Either<NetworkError, OrderCancel>> orderCancel(
      {required String? orderId}) async {
    var response = await safeApiCall(apiService.orderCancel(orderId));
    return response.fold(
      (l) => Left(l),
      (r) => Right(
        r.data.transform(),
      ),
    );
  }

  @override
  Future<Either<NetworkError, List<OrderItem>>> getPending(
      {required String orderId}) async {
    var response = await safeApiCall(apiService.getPendingOrderList(orderId));
    return response.fold(
      (l) => Left(l),
      (r) => Right(
        r.data.transform(),
      ),
    );
  }

  @override
  Future<Either<NetworkError, OrderStatus>> getOrderStatus(
      {required String orderIdorTrackingId}) async {
    var response =
        await safeApiCall(apiService.getOrderStatus(orderIdorTrackingId));

    return response.fold((l) => Left(l), (r) => Right(r.data.transform()));
  }
}
