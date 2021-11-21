import 'dart:io';
import 'package:flutter/material.dart';

class InternetCheckProvider with ChangeNotifier {
  bool _isChekingInternet = false;
  bool _isConnected;

  Future checkInternetConnection() async {
    _isChekingInternet = true;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        _isConnected = true;
        _isChekingInternet = false;
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isConnected = false;
      _isChekingInternet = false;
      notifyListeners();
    }
  }

  bool get isChekingInternet => _isChekingInternet;
  bool get isConnected => _isConnected;
}
