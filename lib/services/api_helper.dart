import 'package:dio/dio.dart';
import 'package:my_app/model/user_models.dart';
import 'package:my_app/model/user_response.dart';

class APIHelper {
  final Dio dio = Dio();

  Future<String> registerUser({
    required String name,
    required String email,
    required String password,
  }) async {
    var formData = FormData.fromMap({
      "name": name,
      "email": email,
      "password": password,
      "password_confirmation": password,
    });

    try {
      final response = await dio.post(
        "http://10.0.2.2:8000/api/auth/register",
        data: formData,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      if (response.statusCode == 200) {
        // Assuming the response data has a "message" field
        return response.data["message"] ?? "Success";
      } else {
        throw Exception("Failed to register: ${response.statusCode}");
      }
    } on DioException catch (e) {
      // Handle Dio-specific exceptions
      throw Exception("Dio error: ${e.message}");
    } catch (e) {
      // Handle general exceptions
      throw Exception("General error: $e");
    }
  }

  Future<UserRespone> loginUsers({
    required String email,
    required String password,
  }) async {
    var formData = FormData.fromMap({
      "email": email,
      "password": password,
      "password_confirmation": password,
    });

    try {
      final response = await dio.post(
        "http://10.0.2.2:8000/api/auth/login",
        data: formData,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      if (response.statusCode == 200) {
        return UserRespone.fromJson(response.data);
      } else {
        throw Exception("Failed to login: ${response.statusCode}");
      }
    } on DioException catch (e) {
      throw Exception("Dio error: ${e.message}");
    } catch (e) {
      throw Exception("General error: $e");
    }
  }

  Future<UserModel> getUserAccount({required String token}) async {
    try {
      final response = await dio.get(
        "http://10.0.2.2:8000/api/auth/me",
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token", // Corrected the typo here
          },
        ),
      );
      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      } else {
        throw Exception("Failed to get Users: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("General error: $e");
    }
  }

  Future<String> logout({required String token}) async {
    try {
      final response = await dio.post(
        "http://10.0.2.2:8000/api/auth/logout",
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        return "Logged out successfully";
      } else {
        throw Exception("Failed to login: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("General error: $e");
    }
  }
}
