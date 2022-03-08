
import 'package:auth_nav/bloc/auth_navigation_bloc.dart';
import 'package:chat_app_flutter/data/blocs/auth/auth_bloc.dart';
import 'package:chat_app_flutter/data/repository_imp/auth_repository_imp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'application.dart';
import 'initialize_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initFirebase();
  await initializeDependencies();
  runApp(MultiBlocProvider(providers: [
    BlocProvider.value(value: GetIt.instance.get<AuthNavigationBloc>()),
    BlocProvider.value(value: GetIt.instance.get<AuthBloc>())
  ], child: MultiRepositoryProvider(
    providers: [
      RepositoryProvider<AuthRepositoryImp>(create: (context) => AuthRepositoryImp())
    ], child: Application(),
  )));
}

Future<void> initFirebase() async {
  await Firebase.initializeApp();

  final FirebaseRemoteConfig firebaseRemoteConfig = FirebaseRemoteConfig.instance;
  firebaseRemoteConfig.setConfigSettings(RemoteConfigSettings(fetchTimeout: const Duration(seconds: 10), minimumFetchInterval: const Duration(seconds: 1)));
  firebaseRemoteConfig.fetchAndActivate();
}
