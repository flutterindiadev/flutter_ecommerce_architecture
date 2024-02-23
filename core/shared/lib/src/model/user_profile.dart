import 'package:shared/shared.dart';

class UserProfile {
  final int userId;
  final String email;
  final String mobile;

  Address address;
  List<OrderItem> orderHistory;
  List<Product> favoriteProducts;

  UserProfile(
      {required this.userId,
      required this.address,
      required this.email,
      required this.favoriteProducts,
      required this.mobile,
      required this.orderHistory});
}
