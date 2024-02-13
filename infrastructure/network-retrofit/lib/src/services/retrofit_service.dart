import 'package:data/data.dart';
import 'package:dio/dio.dart';
import 'package:network_retrofit/src/models/cart_entity/cart_Response_Entity.dart';
import 'package:network_retrofit/src/models/product_response_entity.dart';
import 'package:network_retrofit/src/models/user_response_entity.dart';
import 'package:retrofit/retrofit.dart';

part 'retrofit_service.g.dart';

@RestApi()
abstract class RetrofitService {
  factory RetrofitService(Dio dio, {String? baseUrl}) {
    return _RetrofitService(dio, baseUrl: dio.options.baseUrl);
  }
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

  @GET("getproducts")
  Future<HttpResponse<ProductResponseEntity>> getProducts();

  @GET("getCart")
  Future<HttpResponse<CartResponseEntity>>getCart(int userId);

  @POST("AddtoCart")
  Future<HttpResponse<CartResponseEntity>> addtoCart(
  @Body() AddtoCartRequest addCartRequest,
      );
}
