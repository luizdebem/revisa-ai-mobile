import 'package:dio/dio.dart';
import 'package:localstorage/localstorage.dart';
import 'package:revisa_ai_mobile/http_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuizService {
  static Future<Response<dynamic>> find(String password) {
    return HttpClient.dio().get(
      "/quiz/$password",
    );
  }

  static Future<Response<dynamic>> submit(Map data) async {
    final prefs = await SharedPreferences.getInstance();

    return HttpClient.dio().post(
      "/answer",
      data: data,
      options: Options(
        headers: {
          "x-auth-token": prefs.getString("accessToken"),
        },
      ),
    );
  }

  static Future<Response<dynamic>> listByStudentId(String studentId) async {
    final prefs = await SharedPreferences.getInstance();

    return HttpClient.dio().get(
      "/answer/$studentId",
      options: Options(
        headers: {
          "x-auth-token": prefs.getString("accessToken"),
        },
      ),
    );
  }
}
