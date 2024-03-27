import 'package:connectivity_plus/connectivity_plus.dart';

extension NetworkExtensions on Connectivity {
  Future<bool> get isInternetConnected async {
    ConnectivityResult connectivityResult = await checkConnectivity();
    return connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile;
  }
}
