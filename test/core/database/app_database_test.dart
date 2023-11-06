import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:hive_test/hive_test.dart';
import 'package:rock_w/core/database/app_database.dart';
import 'package:rock_w/core/database/app_database_impl.dart';

void main() {
  group('AppDatabase Tests', () {
    late Box<dynamic> box;
    final getIt = GetIt.instance;

    setUp(() async {
      await setUpTestHive();
      box = await Hive.openBox('testBox');
      AppDatabaseImpl appDatabaseImpl = AppDatabaseImpl(box: box);
      await appDatabaseImpl.init();
      getIt.registerSingleton<AppDatabase>(appDatabaseImpl);
    });

    tearDown(() async {
      getIt.reset();
      await tearDownTestHive();
    });

    test('saveData should call Hive box put method with correct data',
        () async {
      const key = 'futebol';
      const value = 'bola';

      await getIt.get<AppDatabase>().saveData(key, value);

      final result = await getIt.get<AppDatabase>().getData(key);
      expect(result, value);
    });

    test('deleteData should remove the data associated with the key', () async {
      const key = 'keyToDelete';
      const value = 'valueToDelete';

      await getIt.get<AppDatabase>().saveData(key, value);

      await getIt.get<AppDatabase>().deleteData(key);

      final result = await getIt.get<AppDatabase>().getData(key);

      expect(result, isNull);
    });

    test('clearDatabase should remove all data from the database', () async {
      await getIt.get<AppDatabase>().saveData('key1', 'value1');
      await getIt.get<AppDatabase>().saveData('key2', 'value2');

      await getIt.get<AppDatabase>().clearDatabase();

      final result1 = await getIt.get<AppDatabase>().getData('key1');
      final result2 = await getIt.get<AppDatabase>().getData('key2');

      expect(result1, isNull);
      expect(result2, isNull);
    });

    test('saveData should handle different data types correctly', () async {
      const stringKey = 'string';
      const stringValue = 'This is a string';
      const intKey = 'int';
      const intValue = 42;
      const boolKey = 'bool';
      const boolValue = true;

      await getIt.get<AppDatabase>().saveData(stringKey, stringValue);
      await getIt.get<AppDatabase>().saveData(intKey, intValue);
      await getIt.get<AppDatabase>().saveData(boolKey, boolValue);

      expect(await getIt.get<AppDatabase>().getData(stringKey), stringValue);
      expect(await getIt.get<AppDatabase>().getData(intKey), intValue);
      expect(await getIt.get<AppDatabase>().getData(boolKey), boolValue);
    });

    test('getData should return null for non-existent keys', () async {
      const nonExistentKey = 'nonExistentKey';

      final result = await getIt.get<AppDatabase>().getData(nonExistentKey);

      expect(result, isNull);
    });
  });
}
