import 'package:data/data.dart';
import 'package:dio/dio.dart';
import 'package:network_retrofit/src/models/cart_entity/cart_Response_Entity.dart';
import 'package:network_retrofit/src/models/address/address_entity.dart';
import 'package:network_retrofit/src/models/address/addresses_response_entity.dart';
import 'package:network_retrofit/src/models/product/product_category_response_entity.dart';
import 'package:network_retrofit/src/models/product/product_response_entity.dart';
import 'package:network_retrofit/src/models/product/products_response_entity.dart';
import 'package:network_retrofit/src/models/user/user_response_entity.dart';
import 'package:network_retrofit/src/models/user/verifyotp_entity.dart';
import 'package:network_retrofit/src/models/voucher/vouchers_response_entity.dart';
import 'package:retrofit/retrofit.dart';
import '../models/logout_entity/logout_response_entity.dart';
import '../models/orderItem_entity/orderItem_Response_Entity.dart';
part 'retrofit_service.g.dart';

@RestApi()
abstract class RetrofitService {
  factory RetrofitService(Dio dio, {String? baseUrl}) {
    return _RetrofitService(dio, baseUrl: dio.options.baseUrl);
  }

  //onboarding

  @POST("signup")
  Future<HttpResponse<UserResponseEntity>> signup(
    @Body() SignUpRequest signUpRequest,
  );

  @POST("login")
  Future<HttpResponse<UserResponseEntity>> login(
    @Body() LoginRequest loginRequest,
  );

  @POST("forgotpassword")
  Future<HttpResponse> forgotPassword();

  //Product

  @GET("getproduct")
  Future<HttpResponse<ProductsResponseEntity>> getProduct();

  @GET("getCart")
  Future<HttpResponse<CartResponseEntity>>getCart(int userId);

  @POST("AddtoCart")
  Future<HttpResponse<CartResponseEntity>> addtoCart(
  @Body() AddtoCartRequest addCartRequest,
      );

  @POST("RemoveFromCart")
  Future<HttpResponse<CartResponseEntity>> removeFromCart(
      @Body() RemovefromCartRequest removefromCartRequest,
      );
  @POST("logout")
  Future<HttpResponse<LogoutResponseEntity>> logout(
      @Body() LogoutRequest logoutRequest,
      );

  @POST("checkout")
  Future<HttpResponse<OrderItemResponseEntity>> checkOutCart(
      @Body() CheckoutRequest checkoutRequest,
      );

  @GET("getproducts")
  Future<HttpResponse<ProductsResponseEntity>> getProducts();

  @POST("getproductDetail")
  Future<HttpResponse<ProductResponseEntity>> getProductDetail(
      @Body() int productId);

  @GET("getproductCategory")
  Future<HttpResponse<ProductCategoryResponseEntity>> getProductCategory();

  //Address
  @POST("addAddress")
  Future<HttpResponse<AddressEntity>> addAddress(@Body() Address address);

  @POST("changeAddress")
  Future<HttpResponse<AddressEntity>> changeAddress(@Body() Address address);

  @POST("deleteAddress")
  Future<HttpResponse<AddressesResponseEntity>> deleteAddress(
      @Body() String addressId);

  @GET("getAddresses")
  Future<HttpResponse<AddressesResponseEntity>> getAddresses();

  @GET("getVouchers")
  Future<HttpResponse<VouchersResponseEntity>> getVouchers();

  @GET("verifyotp")
  Future<HttpResponse<VerifyotpEntity>> verifyotp(@Body() int otp);

}
