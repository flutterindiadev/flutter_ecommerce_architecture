class OrderRatingRequest{
  String orderId;
  int rating;
  String review;

  OrderRatingRequest({required this.orderId,required this.rating, required this.review});
}