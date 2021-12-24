import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart';
import 'package:sample/core/constants.dart';
import 'package:sample/core/failuer.dart';
import 'package:sample/core/network_helper.dart';
import 'package:sample/data/models/model_user.dart';

abstract class FetchUsersRepository {
  Future<Either<Failuer, List<ModelUser>>> fetchUsers();
}

class FetchUsersRepositoryImpl extends FetchUsersRepository {
  @override
  Future<Either<Failuer, List<ModelUser>>> fetchUsers() async {
    try {
      Response response =
          await NetworkHelper.getInstance().get(Constants.USERS_API);
      if (response.statusCode == 200) {
        List data = jsonDecode(response.body);
        List<ModelUser> userList = [];
        for (Map<String, dynamic> element in data) {
          userList.add(ModelUser.fromJson(element));
        }
        return Right(userList);
      } else {
        return Left(Failuer(
            message: "Error ${response.statusCode} while fetching data"));
      }
    } catch (e) {
      return Left(Failuer(message: "Something went wrong"));
    }
  }
}
