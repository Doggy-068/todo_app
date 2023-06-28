import 'package:drift/drift.dart' as d;
import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/database/index.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ScreenEdit extends StatefulWidget {
  const ScreenEdit({super.key, this.id});

  final int? id;

  @override
  State<ScreenEdit> createState() => ScreenEditState();
}

class ScreenEditState extends State<ScreenEdit> {
  static final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');

  ModelTodoType _type = ModelTodoType.green;
  DateTime _startTime = DateTime.now();

  void _setType(ModelTodoType type) {
    setState(() {
      _type = type;
    });
  }

  void _setStartTime(DateTime startTime) {
    setState(() {
      _startTime = startTime;
    });
  }

  final titleController = TextEditingController();
  final contentController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    (Provider.of<AppDatabase>(context, listen: false).todos.select()
          ..where((tbl) => tbl.id.equalsNullable(widget.id)))
        .getSingleOrNull()
        .then((value) {
      if (value != null) {
        _setType(value.type);
        _setStartTime(value.startTime);
        titleController.text = value.title;
        contentController.text = value.content;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.edit_edit),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: [
              FormField(
                builder: (FormFieldState state) => Row(
                  children: [
                    Text(AppLocalizations.of(context)!.edit_type),
                    PopupMenuButton(
                      initialValue: _type,
                      onSelected: (value) => _setType(value),
                      icon: Icon(
                        Icons.circle,
                        color: _type.value,
                      ),
                      itemBuilder: (BuildContext context) =>
                          ModelTodoType.values
                              .map(
                                (item) => PopupMenuItem(
                                  value: item,
                                  child: Icon(
                                    Icons.circle,
                                    color: item.value,
                                  ),
                                ),
                              )
                              .toList(),
                    ),
                  ],
                ),
              ),
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  label: Text(AppLocalizations.of(context)!.edit_title),
                ),
              ),
              FormField(
                builder: (FormFieldState state) => Container(
                  padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 4.0),
                        child: const Icon(Icons.date_range),
                      ),
                      TextButton(
                        onPressed: () {
                          showDatePicker(
                            context: context,
                            initialDate: _startTime,
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now().add(
                              const Duration(days: 365),
                            ),
                          ).then((value) {
                            if (value != null) {
                              _setStartTime(value);
                            }
                          });
                        },
                        child: Text(_dateFormat.format(_startTime)),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TextFormField(
                  controller: contentController,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.edit_content,
                    border: const OutlineInputBorder(),
                    alignLabelWithHint: true,
                  ),
                  textAlignVertical: TextAlignVertical.top,
                  maxLines: null,
                  expands: true,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        if (widget.id != null) {
                          int id = widget.id as int;
                          Provider.of<AppDatabase>(context, listen: false)
                              .todos
                              .insertOnConflictUpdate(TodosCompanion.insert(
                                id: d.Value(id),
                                type: _type,
                                startTime: _startTime,
                                title: titleController.text,
                                content: contentController.text,
                              ))
                              .then((value) => Navigator.of(context).pop());
                        } else {
                          Provider.of<AppDatabase>(context, listen: false)
                              .todos
                              .insertOne(
                                TodosCompanion.insert(
                                  type: _type,
                                  startTime: _startTime,
                                  title: titleController.text,
                                  content: contentController.text,
                                ),
                              )
                              .then((value) => Navigator.of(context).pop());
                        }
                      },
                      child: Text(AppLocalizations.of(context)!.edit_save),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(AppLocalizations.of(context)!.edit_cancel),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
