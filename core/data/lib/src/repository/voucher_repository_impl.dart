import 'package:data/data.dart';
import 'package:domain/domain.dart';

class VoucherRepositoryImpl extends VoucherRepository {
  final NetworkPort _networkPort;

  VoucherRepositoryImpl(this._networkPort);

  @override
  Future<Either<NetworkError, List<Voucher>>> getVouchers() {
    return _networkPort.getVouchers();
  }
}
