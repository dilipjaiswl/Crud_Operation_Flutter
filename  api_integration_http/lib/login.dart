// import 'dart:convert';
// import 'package:employee_portal/utils/config/web_configuration.dart';
// import 'package:employee_portal/utils/store_session_experation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:http/http.dart' as http;
// import '../../constants/app_constant_texts.dart';
// import '../models/user_model.dart';
//
// Future<LoginResponse?> loginUser(String email, String password) async {
//   const endUrl = 'auth/login';
//   final Uri url = Uri.parse(Config.fastApiBaseUrl + endUrl);
//   try {
//     final response = await http.post(url, headers: {
//       'accept': 'application/json',
//       'Content-Type': 'application/json',
//     }, body: json.encode({ 'email': email, 'password': password,}),);
//     debugPrint('API Response: ${response
//         .body}'); // Log the full response body
//   if (response.statusCode >= 200 && response.statusCode < 300)
//   {
//     final Map<String, dynamic> responseData = json.decode(response.body);
//     const storage = FlutterSecureStorage();
//     final String employeeIdString = responseData['data']['employeeId'];
//     await storage.write(
//         key: 'accessToken', value: responseData['accessToken']);
//     await storage.write(key: 'userId', value: employeeIdString);
//     await storage.write(
//         key: 'lastLoginTime', value: DateTime.now().toString());
//     await storage.write(
//         key: 'firstName', value: responseData['data']['firstName']);
//     await storage.write(
//         key: 'lastName', value: responseData['data']['lastName']);
//     await storage.write(key: 'role', value: responseData['data']['role']);
//     await storeSessionExpirationTime();
//     debugPrint('Employee ID from API (String): $employeeIdString');
//     return LoginResponse.fromJson(responseData);
//   } else if (response.statusCode >= 400 && response.statusCode <= 422) {
//     final Map<String, dynamic> responseData = json.decode(response.body);
//     String errorMessage = responseData['detail'];
//     debugPrint('Error message from API: $errorMessage');
//     throw Exception(errorMessage);    }
//   else {      throw Exception(AppTexts.unknownError);    }  }
//   catch (error) {    debugPrint('Error caught in loginUser: $error');
//     throw Exception(error.toString());  }}
// //Function to logoutFuture<String> logoutUser(BuildContext context) async {  const storage = FlutterSecureStorage();  String? accessToken = await storage.read(key: 'accessToken');  String? userIdStr = await storage.read(key: 'userId');  debugPrint("AccessToken: $accessToken");  debugPrint("UserID: $userIdStr");  if (accessToken == null || userIdStr == null) {    return AppTexts.missingToken;  }  final int userId = int.tryParse(userIdStr) ?? 0;  if (userId == 0) {    return AppTexts.invalidId;  }  String logOutEndUrl = "auth/logout?user_id=$userId";  final url = Uri.parse(Config.fastApiBaseUrl + logOutEndUrl);  try {    final response = await http.post(      url,      headers: {        'accept': 'application/json',        'Authorization': 'Bearer $accessToken',      },    );    debugPrint("API Response Status: ${response.statusCode}");    debugPrint("API Response Body: ${response.body}");    if (response.statusCode == 200) {      final responseData = json.decode(response.body);      if (responseData['message'] == 'Success') {        return responseData['message'];      } else {        return responseData['message'] ?? AppTexts.unknownError;      }    } else {      final responseData = json.decode(response.body);      String errorMessage = responseData['detail'] ??          responseData['message'] ??          AppTexts.unknownError;      return errorMessage;    }  } catch (error) {    debugPrint("Error during logout: $error");    return "$error";  }}