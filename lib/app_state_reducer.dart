import './app_state.dart';
import './modules/auth/auth_reducer.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(
    auth: authReducer(state.auth, action),
  );
}
