import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../constants/api.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthProvider extends ChangeNotifier {
  late ApiService _api;
  final _storage = const FlutterSecureStorage(); // secure storage instance
  String? _token;
  bool _loading = false;

  AuthProvider() {
    _api = ApiService();
    _loadToken();
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
        await _storage.write(key: 'auth_token', value: _token);
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

  Future<bool> forgotPassword(String email) async {
    try {
      final res = await _api.post(ApiConstants.forgotPassword, {
        'email': email,
      });
      return res['success'] == true;
    } catch (e) {
      debugPrint("Forgot password error: $e");
      return false;
    }
  }

  Future<bool> resetPassword(String token, String newPassword) async {
    try {
      final res = await _api.post(ApiConstants.resetPassword, {
        'token': token,
        'password': newPassword,
      });
      return res['success'] == true;
    } catch (e) {
      debugPrint("Reset password error: $e");
      return false;
    }
  }

  Future<void> _loadToken() async {
    final savedToken = await _storage.read(key: 'auth_token');
    if (savedToken != null) {
      _token = savedToken;
      _api = ApiService(token: _token);
      notifyListeners();
    }
  }

  Future<void> logout() async {
    _token = null;
    _api = ApiService();
    await _storage.delete(key: 'auth_token'); // remove saved token
    notifyListeners();
  }
}
