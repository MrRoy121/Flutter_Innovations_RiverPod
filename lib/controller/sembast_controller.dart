import 'package:flutter/foundation.dart'; // For kIsWeb
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';
import 'package:sembast_web/sembast_web.dart';
import '../model/Accounts.dart';
import 'package:path/path.dart';

class SembastDatabaseService {
  Database? _database;
  late StoreRef<int, Map<String, dynamic>> _accountsStore;

  SembastDatabaseService() {
    _initDatabase();
  }

  Future<void> _initDatabase() async {
    if (kIsWeb) {
      // Use Sembast web for persistent storage
      _database = await databaseFactoryWeb.openDatabase('appss');
    } else {
      // Use local storage for mobile
      final dir = await getApplicationDocumentsDirectory();
      final path = join(dir.path, 'app.db');
      _database = await databaseFactoryIo.openDatabase(path);
    }
    _accountsStore = intMapStoreFactory.store('accounts');
  }

  Future<void> addAccount(Accounts account) async {
    if (_database == null) await _initDatabase();
    await _accountsStore.add(_database!, account.toMap());
  }

  Future<List<Accounts>> getAccounts() async {
    if (_database == null) await _initDatabase();
    final records = await _accountsStore.find(_database!);
    return records.map((record) => Accounts.fromMap(record.value)).toList();
  }

  Future<void> updateAccount(int id, Accounts updatedAccount) async {
    if (_database == null) await _initDatabase();
    await _accountsStore.record(id).update(_database!, updatedAccount.toMap());
  }

  Future<void> deleteAccount(int id) async {
    if (_database == null) await _initDatabase();
    await _accountsStore.record(id).delete(_database!);
  }
}