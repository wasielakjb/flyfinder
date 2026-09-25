import 'package:flutter/material.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart'
    as lib_phone_number;
import 'package:flyfinder/app/app.dart';
import 'package:flyfinder/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await lib_phone_number.init();
  runApp(App());
}
