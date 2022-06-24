import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<bool> checkInternetConnection(Function func) async {
  var result = await Connectivity().checkConnectivity();
  if (result != ConnectivityResult.none) {
    func.call();
  } else {
    if (!Platform.isLinux) {
      Fluttertoast.showToast(msg: 'Вы не подключены к сети');
    }
  }
  return result != ConnectivityResult.none;
}

Future<bool> checkInternetConnectionInBackground(
    Function func, Function elseFunc) async {
  var result = await Connectivity().checkConnectivity();
  if (result != ConnectivityResult.none) {
    func.call();
  } else {
    elseFunc.call();
  }
  return result != ConnectivityResult.none;
}
