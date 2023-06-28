import 'package:todo_app/model/todo.dart';
import 'package:drift/drift.dart';
import './platform/index.dart';

part 'index.g.dart';

class Todos extends Table {
  IntColumn get id => integer()();

  TextColumn get type => textEnum<ModelTodoType>()();

  DateTimeColumn get startTime => dateTime()();

  TextColumn get title => text()();

  TextColumn get content => text()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [Todos])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(openConnection());

  @override
  int get schemaVersion => 1;
}
