import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rock_w/core/style/theme.dart';
import 'package:rock_w/dependencies/register_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt getIt = GetIt.instance;
  await RegisterDependencies.on(getIt);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RockW',
      home: Container(),
      theme: ThemeData.light(useMaterial3: true).copyWith(
        textTheme: AppStyleTheme().textTheme,
      ),
    );
  }
}
