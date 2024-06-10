import 'package:equatable/equatable.dart';

import '../models/profile.dart';

abstract class GithubProfileState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialState extends GithubProfileState {}

class LoadingState extends GithubProfileState {}

class FinishState extends GithubProfileState {
  final Profile profile;

  FinishState(this.profile);
}

class ErrorState extends GithubProfileState {
  final errorMessage;

  ErrorState(this.errorMessage);
}
