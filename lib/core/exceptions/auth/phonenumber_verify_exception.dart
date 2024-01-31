import 'package:movie_app/core/exceptions/base_exception.dart';

class PhoneNumberVerifyException extends BaseException {
  final String code;
  PhoneNumberVerifyException(super.message, this.code);
}
