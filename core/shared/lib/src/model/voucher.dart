class Voucher {
  final int id;
  final String voucherCode;
  final DateTime expiryDate;
  final double voucherValue;

  Voucher(
      {required this.id,
      required this.voucherCode,
      required this.expiryDate,
      required this.voucherValue});
}
