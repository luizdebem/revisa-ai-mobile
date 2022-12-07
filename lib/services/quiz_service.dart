import 'package:dio/dio.dart';
import 'package:revisa_ai_mobile/http_client.dart';

class QuizService {
  static Future<Response<dynamic>> find(String password) {
    return HttpClient.dio().get("/quiz/$password");
  }
}
