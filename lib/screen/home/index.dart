import 'package:drift/drift.dart' as d;
import 'package:flutter/material.dart';
import 'package:todo_app/components/com_bottom_navigation_bar.dart';
import 'package:todo_app/model/todo.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/screen/detail/index.dart';
import 'package:todo_app/screen/edit/index.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/database/index.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: (Provider.of<AppDatabase>(context).todos.select()
            ..orderBy([(t) => d.OrderingTerm(expression: t.startTime)]))
          .map(
            (p0) => ModelTodo(
                id: p0.id,
                type: p0.type,
                startTime: p0.startTime,
                title: p0.title,
                content: p0.content),
          )
          .get(),
      builder: (context, snapshot) {
        List<ModelTodo> list = List.empty();
        if (snapshot.hasData && snapshot.data != null) {
          list = snapshot.data!;
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text('TODO_APP'),
          ),
          body: Container(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: list.map((e) => TodoItemCard(todo: e)).toList(),
            ),
          ),
          bottomNavigationBar: const ComBottomNavigationBar(
            currentIndex: 0,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ScreenEdit(),
                ),
              );
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}

class TodoItemCard extends StatelessWidget {
  static final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');

  static const double _size = 16.0;

  final ModelTodo _todo;

  const TodoItemCard({super.key, required ModelTodo todo}) : _todo = todo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ScreenDetail(id: _todo.id),
          ),
        );
      },
      child: Badge(
        isLabelVisible: _todo.isOutDate,
        label: Text(AppLocalizations.of(context)!.home_outdated),
        offset: const Offset(-55, 15),
        child: Card(
          color: _todo.isOutDate ? Colors.grey[200] : null,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.circle,
                      color: _todo.type.value,
                      size: _size,
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(
                          left: 4.0,
                        ),
                        child: Text(
                          _dateFormat.format(_todo.startTime),
                          style: const TextStyle(
                            fontSize: _size,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        _todo.title,
                        style: const TextStyle(
                          fontSize: _size,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          text: _todo.content,
                          style: const TextStyle(
                            fontSize: _size,
                          ),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
