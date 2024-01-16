import 'package:movie_app/core/exceptions/base_exception.dart';

class SignOutException extends BaseException {
  final String code;
  SignOutException(super.message, this.code);
}
