import 'package:firebase_core/firebase_core.dart';
import 'package:todo_workshop/core/helpers/firebase_api.dart';
import 'package:todo_workshop/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:todo_workshop/app.dart';
import 'package:todo_workshop/core/helpers/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().init();
  CacheHelper.init();
  runApp(
    const App(),
  );
}
