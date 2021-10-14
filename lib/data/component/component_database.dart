import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'package:cookbook_app/data/component/component.dart';
import 'package:cookbook_app/data/component/component_dao.dart';
import 'package:floor/floor.dart';

part 'component_database.g.dart';

@Database(version: 1, entities: [Component])
abstract class ComponentDatabase extends FloorDatabase {
  ComponentDao get componentDao;
}