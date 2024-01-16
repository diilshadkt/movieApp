import 'package:movie_app/core/exceptions/base_exception.dart';

class SignUpException extends BaseException {
  final String code;
  SignUpException(super.message, this.code);
}
