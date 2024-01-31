import 'package:movie_app/core/exceptions/base_exception.dart';

class OtpVerifyException extends BaseException {
  final String code;
  OtpVerifyException(super.message, this.code);
}
