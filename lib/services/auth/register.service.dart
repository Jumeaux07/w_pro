import 'package:get/get.dart';
import 'package:w_pro/config/endpoint.config.dart';
import 'package:w_pro/utils/utils.dart';

class RegisterService extends GetConnect {
  Future<Response> register(String nomprenoms, String phone1, String password,
      String confirmation) async {
    return await post(
        ApiRout.register,
        {
          "nom_prenoms": nomprenoms,
          "phone1": phone1,
          "password": password,
          "password_confirmation": confirmation
        },
        headers: headers(null));
  }
}
