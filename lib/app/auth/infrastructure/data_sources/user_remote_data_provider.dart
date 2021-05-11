import 'package:foxlearn/app/auth/domain/entities/user_credentials.dart';
import 'package:foxlearn/app/auth/infrastructure/models/user_model.dart';
import 'package:foxlearn/common/http_client/dio_client.dart';

class UserRemoteDataProvider {
  final DioClient dioClient;

  UserRemoteDataProvider({required this.dioClient});
  Future<UserModel?> signInUser(UserCredentials credentials) async {
    //todo
    ///send api request
    await Future.delayed(Duration(seconds: 5));
    return Future.value(UserModel(
        password: '', phoneNumber: 0, email: '', userName: '', college: 1, gender: false));
  }
}
