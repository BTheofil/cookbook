// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'component_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorComponentDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$ComponentDatabaseBuilder databaseBuilder(String name) =>
      _$ComponentDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$ComponentDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$ComponentDatabaseBuilder(null);
}

class _$ComponentDatabaseBuilder {
  _$ComponentDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$ComponentDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$ComponentDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<ComponentDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$ComponentDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$ComponentDatabase extends ComponentDatabase {
  _$ComponentDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  ComponentDao? _componentDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Component` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL, `belongTo` TEXT NOT NULL, FOREIGN KEY (`belongTo`) REFERENCES `Recipe` (`title`) ON UPDATE NO ACTION ON DELETE NO ACTION)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  ComponentDao get componentDao {
    return _componentDaoInstance ??= _$ComponentDao(database, changeListener);
  }
}

class _$ComponentDao extends ComponentDao {
  _$ComponentDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _componentInsertionAdapter = InsertionAdapter(
            database,
            'Component',
            (Component item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'belongTo': item.belongTo
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Component> _componentInsertionAdapter;

  @override
  Future<List<Component>> getAllRecipe() async {
    return _queryAdapter.queryList('SELECT * FROM Component',
        mapper: (Map<String, Object?> row) => Component(
            id: row['id'] as int?,
            name: row['name'] as String,
            belongTo: row['belongTo'] as String));
  }

  @override
  Future<Component?> getRecipe(int id) async {
    return _queryAdapter.query('SELECT * FROM Component WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Component(
            id: row['id'] as int?,
            name: row['name'] as String,
            belongTo: row['belongTo'] as String),
        arguments: [id]);
  }

  @override
  Future<void> deleteRecipe(int id) async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM Component WHERE id = ?1', arguments: [id]);
  }

  @override
  Future<void> upsertRecipe(Component component) async {
    await _componentInsertionAdapter.insert(
        component, OnConflictStrategy.replace);
  }
}
