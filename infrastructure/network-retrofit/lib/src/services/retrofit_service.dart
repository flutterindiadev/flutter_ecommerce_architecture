import 'package:data/data.dart';
import 'package:dio/dio.dart';
import 'package:network_retrofit/src/models/CartVoucher/cart_voucher_add_entity.dart';
import 'package:network_retrofit/src/models/Order_Repeat/order_repeat_response_entity.dart';
import 'package:network_retrofit/src/models/cart_entity/cart_Response_Entity.dart';
import 'package:network_retrofit/src/models/address/address_entity.dart';
import 'package:network_retrofit/src/models/address/addresses_response_entity.dart';
import 'package:network_retrofit/src/models/changeCartAddress/change_cart_Address_entity.dart';
import 'package:network_retrofit/src/models/order_rating/order_rating_response_entity.dart';
import 'package:network_retrofit/src/models/product/product_category_response_entity.dart';
import 'package:network_retrofit/src/models/product/product_response_entity.dart';
import 'package:network_retrofit/src/models/product/products_response_entity.dart';
import 'package:network_retrofit/src/models/user/user_response_entity.dart';
import 'package:network_retrofit/src/models/user/verifyotp_entity.dart';
import 'package:network_retrofit/src/models/voucher/vouchers_response_entity.dart';
import 'package:retrofit/retrofit.dart';
import '../models/cart_voucher_remove/cart_voucher_remove_entity.dart';
import '../models/logout_entity/logout_response_entity.dart';
import '../models/orderItem_entity/orderItem_Response_Entity.dart';
import '../models/orderItem_entity/orderitems_response_entity.dart';
import '../models/order_cancel/order_cancel_response_entity.dart';
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
  Future<HttpResponse<CartResponseEntity>> getCart(int userId);

  @POST("AddtoCart")
  Future<HttpResponse<bool>> addtoCart(
    @Body() AddtoCartRequest addCartRequest,
  );

  @POST("addvouchertoCart")
  Future<HttpResponse<CartVoucherEntity>> addVouchertoCart(
    @Body() CartVoucherAddRequest cartVoucherAddRequest,
  );

  @POST("removevoucherfromcart")
  Future<HttpResponse<CartVoucherRemoveEntity>> removeVoucherFromCart(
    @Body() CartVoucherRemoveRequest cartVoucherRemoveRequest,
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

  @POST("changeCartAddress")
  Future<HttpResponse<ChangeCartAddressEntity>> changeCartAddress(
      @Body() CartAddressChangeRequest cartAddressChangeRequest);

  @POST("deleteAddress")
  Future<HttpResponse<AddressesResponseEntity>> deleteAddress(
      @Body() String addressId);

  @GET("getAddresses")
  Future<HttpResponse<AddressesResponseEntity>> getAddresses();

  @GET("getVouchers")
  Future<HttpResponse<VouchersResponseEntity>> getVouchers();

  @GET("verifyotp")
  Future<HttpResponse<VerifyotpEntity>> verifyotp(@Body() int otp);

  //////order////////////
  @GET("getorderlist")
  Future<HttpResponse<OrderItemsResponseEntity>> getOrderList();

  @GET("getorderDetail")
  Future<HttpResponse<OrderItemResponseEntity>> getOrderDetail();

  @POST("orderCancell")
  Future<HttpResponse<OrderCancelResponseEntity>> orderCancel(
      @Body() String? orderId);

  @POST("getorderrating")
  Future<HttpResponse<OrderRatingResponseEntity>> getOrderRating(
      @Body() OrderRatingRequest orderRatingRequest);

  @POST("getorderrepeat")
  Future<HttpResponse<OrderRepeatResponseEntity>> doOrderRepeat(
      @Body() String? orderId);
}
