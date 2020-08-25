import 'models/auth_state.dart';

bool isAuthenticatedSelector(AuthState state) =>
    state.authToken != null && state.authToken.isNotEmpty;
