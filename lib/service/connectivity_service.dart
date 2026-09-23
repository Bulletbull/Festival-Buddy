import 'dart:async';
import 'dart:io';


import 'package:connectivity_plus/connectivity_plus.dart';


class ConnectivityService{
  ConnectivityService(){
    start();
  }

final Connectivity connectivity = Connectivity();
  final StreamController<bool> controller = StreamController<bool>.broadcast();
  Stream<bool> get onStatusChange => controller.stream;
  StreamSubscription? _sub;


  void start() {
    _sub = Connectivity().onConnectivityChanged.listen((results) {
      check();
    });
    check();
  }

  Future<void> check() async {
    bool online;
    try{
        final r = await InternetAddress.lookup("host.com");
        online = r.isNotEmpty && r[0].rawAddress.isNotEmpty;
      } on SocketException{
        online = false;
      }
      if(!controller.isClosed) controller.add(online);
  }

  Future<void> dispose() async {
    await _sub?.cancel();
    await controller.close();
  }
}