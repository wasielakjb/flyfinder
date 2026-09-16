import 'package:flutter/material.dart';
import 'package:flyfinder/app/app.dart';
import 'package:flyfinder/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(App());
}
