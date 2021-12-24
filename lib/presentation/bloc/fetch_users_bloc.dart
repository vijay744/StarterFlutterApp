import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/data/repositories/fetch_users_repository.dart';
import 'package:sample/presentation/bloc/fetch_user_event.dart';
import 'package:sample/presentation/bloc/fetch_user_state.dart';

class FetchUserBloc extends Bloc<FetchUserEvent, FetchUserState> {
  final FetchUsersRepository repository;

  FetchUserBloc(initialState, {required this.repository})
      : super(initialState) {
    on<FetchUserFetchEvent>((event, emit) async {
      emit(FetchUserLoading());
      final eitherResult = await repository.fetchUsers();
      eitherResult.fold(
          (l) => emit(
              FetchUserFailuer(message: l.message ?? "Something went wrong")),
          (userList) => emit(FetchUserSuccess(userList: userList)));
    });
  }
}
