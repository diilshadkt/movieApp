import 'package:movie_app/core/exceptions/base_exception.dart';

class SigninWithGoogleException extends BaseException {
  final String code;
  SigninWithGoogleException(super.message, this.code);
}
