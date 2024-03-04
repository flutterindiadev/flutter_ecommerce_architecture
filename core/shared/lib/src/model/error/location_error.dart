import 'package:shared/shared.dart';

class LocationError extends BaseError {
  LocationError({
    required String message,
    required String locationError,
    required Exception cause,
  }) : super(error: ErrorInfo(message: message), cause: cause);

  @override
  String getFriendlyMessage() {
    return error.message;
  }

  @override
  AppError transform() {
    switch (error.code) {
      case 1:
        return AppError(
            error: error,
            throwable: cause,
            type: ErrorType.locationNotEnabledError);

      case 2:
        return AppError(
            throwable: cause,
            error: error,
            type: ErrorType.locationPermissionError);

      default:
        return AppError(
            throwable: cause, error: error, type: ErrorType.unknown);
    }
  }
}
