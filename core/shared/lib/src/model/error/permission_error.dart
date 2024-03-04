import 'package:shared/shared.dart';

class PermissionError extends BaseError {
  PermissionError(
      {required String errorMessage,
      required String locationError,
      required Exception cause})
      : super(cause: cause, error: ErrorInfo(message: errorMessage));

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
