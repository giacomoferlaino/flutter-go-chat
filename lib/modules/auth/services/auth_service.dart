import 'package:rxdart/rxdart.dart';

class AuthService {
  final BehaviorSubject<bool> _isLoggedIn = BehaviorSubject<bool>();

  AuthService() {
    _isLoggedIn.sink.add(false);
  }

  Stream<bool> get isLoggedIn => _isLoggedIn.stream;

  void loginOnChange(bool isLoggedIn) {
    _isLoggedIn.sink.add(isLoggedIn);
  }

  void dispose() {
    _isLoggedIn.close();
  }
}
