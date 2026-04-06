import 'package:flutter/material.dart';

import '../models/user_model.dart';
import '../services/api_service.dart';

class AppController extends ChangeNotifier {
  AppController({required ApiService apiService}) : _apiService = apiService;

  final ApiService _apiService;

  String? _token;
  UserModel? _currentUser;
  List<UserModel> _users = [];
  bool _busy = false;

  String? get token => _token;
  UserModel? get currentUser => _currentUser;
  List<UserModel> get users => _users;
  bool get isBusy => _busy;
  bool get isAuthenticated => _token != null && _currentUser != null;

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    _setBusy(true);
    try {
      final result = await _apiService.register(
        name: name,
        email: email,
        password: password,
      );
      _token = result.token;
      _currentUser = result.user;
      await fetchUsers();
    } finally {
      _setBusy(false);
    }
  }

  Future<void> login({required String email, required String password}) async {
    _setBusy(true);
    try {
      final result = await _apiService.login(email: email, password: password);
      _token = result.token;
      _currentUser = result.user;
      await fetchUsers();
    } finally {
      _setBusy(false);
    }
  }

  Future<void> fetchProfile() async {
    final token = _token;
    if (token == null) return;

    _setBusy(true);
    try {
      _currentUser = await _apiService.fetchProfile(token: token);
      notifyListeners();
    } finally {
      _setBusy(false);
    }
  }

  Future<void> updateProfile({required String name}) async {
    final token = _token;
    if (token == null) return;

    _setBusy(true);
    try {
      _currentUser = await _apiService.updateProfile(token: token, name: name);
      await fetchUsers();
      notifyListeners();
    } finally {
      _setBusy(false);
    }
  }

  Future<void> fetchUsers() async {
    _users = await _apiService.fetchUsers();
    notifyListeners();
  }

  Future<void> refreshAll() async {
    final futures = <Future<void>>[fetchUsers()];
    if (_token != null) {
      futures.add(fetchProfile());
    }
    await Future.wait(futures);
  }

  void logout() {
    _token = null;
    _currentUser = null;
    _users = [];
    notifyListeners();
  }

  void _setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
}
