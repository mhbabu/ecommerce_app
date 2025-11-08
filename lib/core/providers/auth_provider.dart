import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../constants/api.dart';

class AuthProvider extends ChangeNotifier {
  late ApiService _api;
  String? _token;
  bool _loading = false;

  AuthProvider() {
    _api = ApiService();
  }

  String? get token => _token;
  bool get loading => _loading;

  Future<bool> login(String email, String password) async {
    _loading = true;
    notifyListeners();

    try {
      final res = await _api.post(ApiConstants.login, {
        'email': email,
        'password': password,
      });

      if (res['token'] != null) {
        _token = res['token'];
        _api = ApiService(token: _token); // attach token for later requests
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<bool> register(Map<String, dynamic> userData) async {
    try {
      final res = await _api.post(ApiConstants.register, userData);
      return res != null; // true if registration succeeded
    } catch (e) {
      return false;
    }
  }

  void logout() {
    _token = null;
    _api = ApiService();
    notifyListeners();
  }
}
