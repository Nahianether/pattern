import 'dart:async' show Future;
import 'dart:io' show InternetAddress, SocketException;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

bool _connected = false;
bool get connected => _connected;
late final Stream<List<ConnectivityResult>> connectionStream;
// BuildContext? context;
// final connectionStreamProvider = StreamProvider((_) => connectionStream);

void initConnectionListener() => connectionStream =
    Connectivity().onConnectivityChanged..listen(onConnectionChanged);

void onConnectionChanged(List<ConnectivityResult> results) =>
    _connected = results.isNotEmpty && !results.contains(ConnectivityResult.none);

Future<bool> hasInternet() async {
  if (!connected) {
    Fluttertoast.showToast(
      msg: 'No Internet Connection',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
    return false;
  }
  try {
    final result = await InternetAddress.lookup('example.com');
    return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
  } on SocketException catch (_) {
    return false;
  }
}

