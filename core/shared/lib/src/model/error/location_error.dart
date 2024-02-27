import 'package:shared/shared.dart';

class LocationError extends BaseError {
  LocationError({
    required String message,
    required String locationError,
    required Exception cause,
  }) : super(error: ErrorInfo(message: message), cause: Exception());

  @override
  String getFriendlyMessage() {
    return error.message;
  }
}
