class CartVoucherAddRequest {
  String cartId;
  String voucherId;
  bool? isVoucherIdAvailable;
  CartVoucherAddRequest(
      {required this.isVoucherIdAvailable,
      required this.cartId,
      required this.voucherId});
}
