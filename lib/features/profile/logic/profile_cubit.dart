import 'package:dummy_json_api/features/profile/data/mappers/user_profile_dto_mapper.dart';
import 'package:dummy_json_api/features/profile/data/models/user_profile_dto.dart';
import 'package:dummy_json_api/features/profile/domain/models/user_profile.dart';
import 'package:dummy_json_api/features/profile/domain/repositories/profile_repository.dart';
import 'package:dummy_json_api/features/profile/logic/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository repository;

  ProfileCubit({required this.repository}) : super(Initial());

  Future<void> getProfile() async {
    emit(LoadingState());
    final response = await repository.getUserProfile();
    if (response.success) {
      final userProfileDto = response.data as UserProfileDto;
      final UserProfile userProfile = userProfileDto.toDomain();
      emit(SuccessState(profile: userProfile));
    } else {
      final error = response.error;
      emit(ErrorState(message: error ?? 'Something wrong happened'));
    }
  }
}
