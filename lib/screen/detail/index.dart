import 'package:drift/drift.dart' as d;
import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/screen/edit/index.dart';
import 'package:todo_app/database/index.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ScreenDetail extends StatefulWidget {
  const ScreenDetail({super.key, required this.id});

  final int id;

  @override
  State<ScreenDetail> createState() => ScreenDetailState();
}

class ScreenDetailState extends State<ScreenDetail> {
  static final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');

  ModelTodo _todo = ModelTodo(
    id: -1,
    type: ModelTodoType.green,
    title: '',
    startTime: DateTime.now(),
    content: '',
  );

  void fetchTodo() {
    (Provider.of<AppDatabase>(context, listen: false).todos.select()
          ..where((tbl) => tbl.id.equals(widget.id)))
        .getSingle()
        .then((value) {
      setState(() {
        _todo = ModelTodo(
          id: value.id,
          type: value.type,
          title: value.title,
          startTime: value.startTime,
          content: value.content,
        );
      });
    });
  }

  @override
  void initState() {
    fetchTodo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(
              Icons.circle,
              color: _todo.type.value,
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 8.0),
                child: Text(
                  _dateFormat.format(_todo.startTime),
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
                    _todo.title,
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
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: SingleChildScrollView(
                        child: Text(_todo.content),
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
                  visible: !_todo.isOutDate,
                  child: TextButton.icon(
                    onPressed: () {
                      Navigator.of(context)
                          .push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => ScreenEdit(
                            id: _todo.id,
                          ),
                        ),
                      )
                          .then((value) {
                        if (value == true) {
                          fetchTodo();
                        }
                      });
                    },
                    icon: const Icon(Icons.edit),
                    label: Text(AppLocalizations.of(context)!.detail_edit),
                  ),
                ),
                TextButton.icon(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: Text(AppLocalizations.of(context)!.detail_tip),
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
                              Provider.of<AppDatabase>(context, listen: false)
                                  .todos
                                  .deleteWhere(
                                    (tbl) => tbl.id.equals(_todo.id),
                                  )
                                  .then(
                                    (value) => Navigator.of(context).pop(true),
                                  );
                            },
                            child: Text(
                                AppLocalizations.of(context)!.detail_confirm),
                          ),
                        ],
                      ),
                    ).then((value) {
                      if (value == true) {
                        Navigator.of(context).pop(true);
                      }
                    });
                  },
                  icon: const Icon(Icons.delete),
                  label: Text(AppLocalizations.of(context)!.detail_delete),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
