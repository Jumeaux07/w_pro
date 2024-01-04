import 'package:get/get_connect/connect.dart';
import 'package:w_pro/config/endpoint.config.dart';

class LoginService extends GetConnect {
  Future<Response> login(String phone, String password) async {
    return await post(
      ApiRout.login,
      {
        'phone1': phone,
        'password': password,
      },
    );
  }
}
