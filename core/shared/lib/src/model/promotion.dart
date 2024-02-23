class Promotion {
  final int id;
  final int productId;
  final String productImage;
  final String productName;
  final List<String> promotionLabels;

  Promotion(
      {required this.id,
      required this.productId,
      required this.productImage,
      required this.productName,
      required this.promotionLabels});
}
