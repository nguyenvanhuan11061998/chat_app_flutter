


import 'package:firebase_remote_config/firebase_remote_config.dart';

class  RemoteConfigService {
  final FirebaseRemoteConfig remoteConfig;

  RemoteConfigService(this.remoteConfig) {
    remoteConfig.setDefaults(<String, dynamic> {
      'name_app' : 'Test chat app'
    });
  }

  // Future<String> getAppName() async {
  //
  // }
}