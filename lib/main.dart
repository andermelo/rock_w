import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rock_w/dependencies/register_dependencies.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt getIt = GetIt.instance;
  RegisterDependencies.on(getIt);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RockW',
      home: Container(),
    );
  }
}
