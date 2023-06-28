import 'package:drift/drift.dart' as d;
import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/screen/edit/index.dart';
import 'package:todo_app/database/index.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ScreenDetail extends StatelessWidget {
  static final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');

  const ScreenDetail({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: (Provider.of<AppDatabase>(context).todos.select()
            ..where((tbl) => tbl.id.equals(id)))
          .getSingle(),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          final ModelTodo todo = ModelTodo(
            id: snapshot.data!.id,
            type: snapshot.data!.type,
            title: snapshot.data!.title,
            startTime: snapshot.data!.startTime,
            content: snapshot.data!.content,
          );
          return Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  Icon(
                    Icons.circle,
                    color: todo.type.value,
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        _dateFormat.format(todo.startTime),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  )
                ],
              ),
            ),
            body: Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          todo.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            padding:
                                const EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: SingleChildScrollView(
                              child: Text(todo.content),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Visibility(
                        visible: !todo.isOutDate,
                        child: TextButton.icon(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) => ScreenEdit(
                                  id: todo.id,
                                ),
                              ),
                            );
                          },
                          icon: const Icon(Icons.edit),
                          label:
                              Text(AppLocalizations.of(context)!.detail_edit),
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: Text(
                                  AppLocalizations.of(context)!.detail_tip),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(false);
                                  },
                                  child: Text(
                                    AppLocalizations.of(context)!.detail_cancel,
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Provider.of<AppDatabase>(context,
                                            listen: false)
                                        .todos
                                        .deleteWhere(
                                          (tbl) => tbl.id.equals(todo.id),
                                        )
                                        .then(
                                          (value) =>
                                              Navigator.of(context).pop(true),
                                        );
                                  },
                                  child: Text(AppLocalizations.of(context)!
                                      .detail_confirm),
                                ),
                              ],
                            ),
                          ).then((value) {
                            if (value == true) {
                              Navigator.of(context).pop();
                            }
                          });
                        },
                        icon: const Icon(Icons.delete),
                        label:
                            Text(AppLocalizations.of(context)!.detail_delete),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        }
        return const Center();
      },
    );
  }
}
