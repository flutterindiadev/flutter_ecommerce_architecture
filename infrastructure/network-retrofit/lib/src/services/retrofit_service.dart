import 'package:data/data.dart';
import 'package:dio/dio.dart';
import 'package:network_retrofit/src/models/product_category_response_entity.dart';
import 'package:network_retrofit/src/models/product_response_entity.dart';
import 'package:network_retrofit/src/models/products_response_entity.dart';
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
  Future<HttpResponse<ProductsResponseEntity>> getProducts();

  @POST("getproductDetail")
  Future<HttpResponse<ProductResponseEntity>> getProductDetail(
      @Body() int productId);

  @GET("getproductCategory")
  Future<HttpResponse<ProductCategoryResponseEntity>> getProductCategory();
}
