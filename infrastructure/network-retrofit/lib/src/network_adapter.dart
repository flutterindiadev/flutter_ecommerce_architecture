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
    return response.fold((l) => Left(l), (r) => Right(r.data.transform(),),);
  }

  @override
  Future<Either<NetworkError, Cart>> addtoCart(
      {required AddtoCartRequest addtoCartRequest}) async {

    var response = await safeApiCall(apiService.addtoCart(addtoCartRequest));
    return response.fold((l) => left(l), (r) => Right(r.data.transform(),),);
  }

  @override
  Future<Either<NetworkError, Cart>> getCart({required int userId}) async {
    var response = await safeApiCall(apiService.getCart(userId));
    return response.fold((l) => Left(l), (r) => Right(r.data.transform(),),);

  }
  @override
  Future<Either<NetworkError, Cart>> removeFromCart({required RemovefromCartRequest removefromCartRequest}) async {
    var response = await safeApiCall(apiService.removeFromCart(removefromCartRequest));
    return response.fold((l) => Left(l), (r) => Right(r.data.transform(),),);

  }
}
