import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import '../Api%20Handler/api_handler.dart';
import 'github_profile_state.dart';

class GithubProfileCubit extends Cubit<GithubProfileState> {
  GithubProfileCubit() : super(InitialState());

  initialState() => InitialState();

  fetchData(String userName) async {
    emit(LoadingState());

    try {
      final response = await ApiHandler(Dio()).getProfileInfo(userName);
      emit(FinishState(response));
    } on Exception catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}
