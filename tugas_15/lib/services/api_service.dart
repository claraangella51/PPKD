import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../models/auth_result.dart';
import '../models/user_model.dart';

class ApiService {
  static const String baseUrl = 'https://absensib1.mobileprojp.com';
  static const Duration _timeout = Duration(seconds: 20);

  Map<String, String> _headers({String? token}) {
    return {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  Future<AuthResult> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await _performRequest(
      () => http
          .post(
            Uri.parse('$baseUrl/api/register'),
            headers: _headers(),
            body: jsonEncode({
              'name': name,
              'email': email,
              'password': password,
            }),
          )
          .timeout(_timeout),
    );

    final json = _decode(response);
    _throwIfError(response.statusCode, json);

    final data = json['data'] as Map<String, dynamic>? ?? {};
    return AuthResult(
      token: (data['token'] ?? '') as String,
      user: UserModel.fromJson(data['user'] as Map<String, dynamic>? ?? {}),
      message: (json['message'] ?? 'Registrasi berhasil') as String,
    );
  }

  Future<AuthResult> login({
    required String email,
    required String password,
  }) async {
    final response = await _performRequest(
      () => http
          .post(
            Uri.parse('$baseUrl/api/login'),
            headers: _headers(),
            body: jsonEncode({'email': email, 'password': password}),
          )
          .timeout(_timeout),
    );

    final json = _decode(response);
    _throwIfError(response.statusCode, json);

    final data = json['data'] as Map<String, dynamic>? ?? {};
    return AuthResult(
      token: (data['token'] ?? '') as String,
      user: UserModel.fromJson(data['user'] as Map<String, dynamic>? ?? {}),
      message: (json['message'] ?? 'Login berhasil') as String,
    );
  }

  Future<UserModel> fetchProfile({required String token}) async {
    final response = await _performRequest(
      () => http
          .get(
            Uri.parse('$baseUrl/api/profile'),
            headers: _headers(token: token),
          )
          .timeout(_timeout),
    );

    final json = _decode(response);
    _throwIfError(response.statusCode, json);
    return UserModel.fromJson(json['data'] as Map<String, dynamic>? ?? {});
  }

  Future<UserModel> updateProfile({
    required String token,
    required String name,
  }) async {
    final response = await _performRequest(
      () => http
          .put(
            Uri.parse('$baseUrl/api/profile'),
            headers: _headers(token: token),
            body: jsonEncode({'name': name}),
          )
          .timeout(_timeout),
    );

    final json = _decode(response);
    _throwIfError(response.statusCode, json);
    return UserModel.fromJson(json['data'] as Map<String, dynamic>? ?? {});
  }

  Future<List<UserModel>> fetchUsers() async {
    final response = await _performRequest(
      () => http
          .get(Uri.parse('$baseUrl/api/users'), headers: _headers())
          .timeout(_timeout),
    );

    final json = _decode(response);
    _throwIfError(response.statusCode, json);

    final data = json['data'] as List<dynamic>? ?? [];
    return data
        .map((item) => UserModel.fromJson(item as Map<String, dynamic>))
        .toList()
      ..sort((a, b) => b.id.compareTo(a.id));
  }

  Map<String, dynamic> _decode(http.Response response) {
    if (response.body.isEmpty) {
      return {};
    }
    final decoded = jsonDecode(response.body);
    if (decoded is Map<String, dynamic>) {
      return decoded;
    }
    return {};
  }

  void _throwIfError(int statusCode, Map<String, dynamic> json) {
    if (statusCode >= 200 && statusCode < 300) {
      return;
    }

    final errors = json['errors'];
    if (errors is Map<String, dynamic> && errors.isNotEmpty) {
      final first = errors.values.first;
      if (first is List && first.isNotEmpty) {
        throw ApiException(first.first.toString());
      }
    }

    throw ApiException(
      (json['message'] ?? 'Terjadi kesalahan pada server.') as String,
    );
  }

  Future<http.Response> _performRequest(
    Future<http.Response> Function() request,
  ) async {
    try {
      return await request();
    } on SocketException {
      throw ApiException(
        'Tidak bisa terhubung ke internet atau server API sedang tidak tersedia.',
      );
    } on TimeoutException {
      throw ApiException('Request timeout. Coba ulang beberapa saat lagi.');
    } on HttpException {
      throw ApiException('Terjadi masalah saat menghubungi server.');
    }
  }
}

class ApiException implements Exception {
  ApiException(this.message);

  final String message;

  @override
  String toString() => message;
}
