import 'package:foxlearn/app/api/settings/api_settings.dart';
import 'package:foxlearn/app/api/user/api_user.dart';

class ApiRepository {
static  ApiUser get apiUser => ApiUser();
static ApiSettings get apiSettings => ApiSettings();

}
