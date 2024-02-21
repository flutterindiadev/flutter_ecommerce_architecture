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
    return response.fold((l) => Left(l), (r) => Right(r));
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
  Future<Either<NetworkError, Cart>> addtoCart(
      {required AddtoCartRequest addtoCartRequest}) async {
    var response = await safeApiCall(apiService.addtoCart(addtoCartRequest));
    return response.fold(
      (l) => left(l),
      (r) => Right(
        r.data.transform(),
      ),
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
}
