import 'package:dummy_json_api/core/utils/session_manager.dart';
import 'package:dummy_json_api/features/auth/data/models/login_request.dart';
import 'package:dummy_json_api/features/auth/data/models/login_response.dart';
import 'package:dummy_json_api/features/auth/domain/repositories/auth_repository.dart';
import 'package:dummy_json_api/features/auth/logic/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository repository;

  AuthCubit({required this.repository}) : super(LoginInitial());

  Future<void> login(LoginRequest request) async {
    emit(LoginLoadingState());
    final response = await repository.login(request);
    if (response.success) {
      final LoginResponse loginResponse = response.data;
      final token = loginResponse.accessToken;
      if (token != null) {
        SessionManager().saveUserToken(token);
      }
      emit(LoginSuccessState(response: loginResponse));
    } else {
      final error = response.error;
      emit(LoginErrorState(message: error ?? "Something wrong happened"));
    }
  }
}
