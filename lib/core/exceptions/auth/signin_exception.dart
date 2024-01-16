import 'package:movie_app/core/exceptions/base_exception.dart';

class SignInException extends BaseException {
  final String code;
  SignInException(super.message, this.code);
}
