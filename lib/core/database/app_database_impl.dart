import 'dart:io';
import 'package:hive/hive.dart';
import 'app_database.dart';

class AppDatabaseImpl implements AppDatabase {
  Box<dynamic> _box;
  bool _isInitialized = false;

  AppDatabaseImpl({Box<dynamic>? box}) : _box = box ?? Hive.box('appBox');

  @override
  Future<void> init() async {
    if (!_isInitialized) {
      var path = Directory.current.path;
      Hive.init(path);
      _box = await Hive.openBox('appBox');
      _isInitialized = true;
    }
  }

  Future<void> _checkIfInitialized() async {
    if (!_isInitialized) {
      throw Exception('HiveAppDatabase not initialized. Call init() first.');
    }
  }

  @override
  Future<void> saveData(String key, dynamic value) async {
    await _checkIfInitialized();
    await _box.put(key, value);
  }

  @override
  Future<dynamic> getData(String key) async {
    await _checkIfInitialized();
    return _box.get(key);
  }

  @override
  Future<void> deleteData(String key) async {
    await _checkIfInitialized();
    await _box.delete(key);
  }

  @override
  Future<void> clearDatabase() async {
    await _checkIfInitialized();
    await _box.clear();
  }
}
