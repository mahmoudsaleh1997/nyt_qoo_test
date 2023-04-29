import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkChecker{
  NetworkChecker._();
  static final _instance = NetworkChecker._();
  static NetworkChecker get instance => _instance;
  final _networkConnectivity = Connectivity();

    Future<bool>  initialise() async {
    ConnectivityResult result = await _networkConnectivity.checkConnectivity();
    return await checkStatus(result);

  }

  Future<bool> checkStatus(ConnectivityResult result) async {
    bool isOnline = false;
    try {
      final result = await InternetAddress.lookup('www.google.com');
      isOnline = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      isOnline = false;
    }
    return isOnline;
  }


}