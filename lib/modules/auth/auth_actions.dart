class LoginAction {
  final String email;
  final String password;

  LoginAction(this.email, this.password);

  @override
  String toString() {
    return 'LoginAction{email: $email, password: $password}';
  }
}

class SaveAuthTokenAction {
  final String authToken;

  SaveAuthTokenAction(this.authToken);

  @override
  String toString() {
    return 'SaveAuthTokenAction{authToken: $authToken}';
  }
}
