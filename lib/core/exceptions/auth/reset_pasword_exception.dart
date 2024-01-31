import 'package:movie_app/core/exceptions/base_exception.dart';

class ResetPasswordException extends BaseException {
  final String code;
  ResetPasswordException(super.message, this.code);
}
