
import 'package:foxlearn/app/infrastructure/models/user_data.dart';
import 'package:foxlearn/common/api_tools/api_result.dart';

abstract class ApiUserServices {
  Future<ApiResult<bool?>> isUserBlocked(int userId);
  Future<ApiResult<UserAccount>> signIn(String userName, String password);

  Future<ApiResult<UserAccount>> signUp(UserAccount userData);

  Future<ApiResult<UserAccount>> updateStudent(UserAccount userData);

  // Future<ApiResult<List<PointOfSale>>> getUsersWithType(int type);
  //
  // Future<ApiResult<List<Question>>> getQuestions(int userId);

  Future<ApiResult<bool?>> checkStudentSecurityStamp(String phoneNumber, String securityStamp);

  Future<ApiResult<UserAccount>> skipLogin();
}
