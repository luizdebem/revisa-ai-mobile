import 'package:revisa_ai_mobile/http_client.dart';

class LoginService {
  static login(Map data) {
    return HttpClient.dio().post(
      "/auth/login",
      data: data,
    );
  }

  static refreshToken() {
    return HttpClient.dio().post(
      "/auth/refresh-token",
      data: {},
    );
  }
}
