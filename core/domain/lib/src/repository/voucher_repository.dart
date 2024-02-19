import 'package:dartz/dartz.dart';
import 'package:shared/shared.dart';

abstract class VoucherRepository {
  Future<Either<NetworkError, List<Voucher>>> getVouchers();
}
