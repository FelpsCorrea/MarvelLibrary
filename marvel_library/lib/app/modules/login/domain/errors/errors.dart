class LoginGoogleException implements Exception {
  final String message;

  LoginGoogleException(this.message);

  @override
  String toString() => 'LoginGoogleException(message : $message)';
}
