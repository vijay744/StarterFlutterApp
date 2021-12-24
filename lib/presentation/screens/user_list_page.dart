import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/data/repositories/fetch_users_repository.dart';
import 'package:sample/presentation/bloc/fetch_user_event.dart';
import 'package:sample/presentation/bloc/fetch_user_state.dart';
import 'package:sample/presentation/bloc/fetch_users_bloc.dart';

class ListPage extends StatelessWidget {
  final bool isHorizontal;

  ListPage(this.isHorizontal);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (ctx) => FetchUserBloc(FetchUserLoading(),
            repository: FetchUsersRepositoryImpl()),
        child: _UserListPage(isHorizontal));
  }
}

class _UserListPage extends StatefulWidget {
  final bool isHorizontal;

  _UserListPage(this.isHorizontal);

  @override
  State<StatefulWidget> createState() => _UserListPageState();
}

class _UserListPageState extends State<_UserListPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      context.read<FetchUserBloc>().add(FetchUserFetchEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "${widget.isHorizontal ? "Horizontal" : "Vertical"} User List"),
      ),
      body: SafeArea(
        child: SizedBox(
          height: widget.isHorizontal
              ? MediaQuery.of(context).size.height / 3
              : double.infinity,
          child: BlocBuilder<FetchUserBloc, FetchUserState>(
            builder: (ctx, state) {
              if (state is FetchUserSuccess) {
                return ListView.builder(
                    scrollDirection:
                        widget.isHorizontal ? Axis.horizontal : Axis.vertical,
                    padding: const EdgeInsets.all(8),
                    itemCount: state.userList.length,
                    itemBuilder: (ctx, pos) {
                      return Card(
                        margin: const EdgeInsets.all(8),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                              child: Text(
                            "${state.userList[pos].firstName} ${state.userList[pos].lastName}",
                          )),
                        ),
                      );
                    });
              } else if (state is FetchUserFailuer) {
                return Center(
                    child: Text(
                  state.message,
                ));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
