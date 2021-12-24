import 'package:sample/data/models/model_user.dart';

abstract class FetchUserState {}

class FetchUserLoading extends FetchUserState {}

class FetchUserSuccess extends FetchUserState {
  final List<ModelUser> userList;

  FetchUserSuccess({required this.userList});
}

class FetchUserFailuer extends FetchUserState {
  final String message;

  FetchUserFailuer({required this.message});
}
