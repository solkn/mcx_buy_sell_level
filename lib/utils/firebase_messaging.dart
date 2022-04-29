
import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:async';

class _FirebaseMessaging {
  //final _firebaseMessaging = FirebaseMessaging();
  final _onMessageStreamController = StreamController<RemoteMessage>.broadcast();

  _FirebaseMessaging() {
    
    FirebaseMessaging.onMessage.listen((event) { 
      RemoteMessage remoteMessage;
      _onMessageStreamController.sink.add(RemoteMessage(remoteMessage._title, remoteMessage._body));

      //return Future.delayed(Duration());

    });
    // _firebaseMessaging.configure(onMessage: (msg) {
    //   _onMessageStreamController.sink.add(RemoteMessage(
    //       msg['notification']['title'], msg['notification']['body']));
    //   return Future.delayed(Duration());

    // });
  }

  Stream<RemoteMessage> get onMessage {
    return _onMessageStreamController.stream;
  }

  void dispose() {
    _onMessageStreamController.close();
  }

  //  ---------------- methods wrapper ---------------------- //

  void requestNotificationPermissions() {
      //return _firebaseMessaging.requestNotificationPermissions();
      //_firebaseMessaging.requestPermission();

      FirebaseMessaging.instance.requestPermission();
  }

  Future<bool> deleteInstanceID() {
       //return _firebaseMessaging.deleteInstanceID();
       //return _firebaseMessaging.deleteToken();
       return FirebaseMessaging.instance.deleteToken();
  }

  Future<String> getToken() {
     //return _firebaseMessaging.getToken();
     return FirebaseMessaging.instance.getToken();
  }
}

final firebaseMessaging = _FirebaseMessaging();

class RemoteMessage {
  String _title, _body;

  String get title => _title;

  get body => _body;

  RemoteMessage(this._title, this._body);
}
