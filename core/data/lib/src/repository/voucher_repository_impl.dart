import 'package:data/data.dart';
import 'package:domain/domain.dart';

class VoucherRepositoryImpl extends VoucherRepository {
  final NetworkPort networkPort;

  VoucherRepositoryImpl(this.networkPort);

  @override
  Future<Either<NetworkError, List<Voucher>>> getVouchers() {
    return networkPort.getVouchers();
  }
}
