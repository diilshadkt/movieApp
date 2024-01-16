import 'package:movie_app/core/exceptions/base_exception.dart';

final class AuthenticationFailedException extends BaseException {
  AuthenticationFailedException(super.reason);
}
