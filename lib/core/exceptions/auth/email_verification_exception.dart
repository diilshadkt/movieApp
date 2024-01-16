import 'package:movie_app/core/exceptions/base_exception.dart';

class EmailVerificationException extends BaseException {
  final String code;
  EmailVerificationException(super.message, this.code);
}
