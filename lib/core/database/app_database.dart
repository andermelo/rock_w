abstract class AppDatabase {
  Future<void> init();

  Future<void> saveData(String key, dynamic value);

  Future<dynamic> getData(String key);

  Future<void> deleteData(String key);

  Future<void> clearDatabase();
}
