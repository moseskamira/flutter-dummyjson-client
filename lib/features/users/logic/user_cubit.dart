import 'package:dummy_json_api/features/users/data/models/users_response.dart';
import 'package:dummy_json_api/features/users/domain/repositories/user_repository.dart';
import 'package:dummy_json_api/features/users/logic/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository repository;

  UserCubit({required this.repository}) : super(Initial());

  Future<void> getUsers() async {
    emit(UsersLoading());
    final response = await repository.getUsers();
    if (response.success) {
      final responseData = response.data as UsersResponse;
      final users = responseData.users ?? [];
      emit(UsersSuccess(users: users));
    } else {
      final errorMessage = response.error;
      emit(UsersError(message: errorMessage ?? 'Something wrong happened'));
    }
  }

  Future<void> getUserInfo(String userId) async {
    emit(UserInfoLoading());
    final response = await repository.getUserInfo(userId);
    if (response.success) {
      final responseData = response.data;
      print('USERINFODATA:$responseData');

      emit(UserInfoSuccess(user: responseData));
    } else {
      final errorMessage = response.error;
      emit(UserInfoError(message: errorMessage ?? 'Something wrong happened'));
    }
  }
}
