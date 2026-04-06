import 'user_model.dart';

class AuthResult {
  const AuthResult({
    required this.token,
    required this.user,
    required this.message,
  });

  final String token;
  final UserModel user;
  final String message;
}
