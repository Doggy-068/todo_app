import 'package:drift/drift.dart' as d;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/components/com_bottom_navigation_bar.dart';
import 'package:todo_app/database/index.dart';
import 'package:todo_app/model/daily.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ScreenDaily extends StatefulWidget {
  const ScreenDaily({super.key});

  @override
  State<ScreenDaily> createState() => ScreenDailyState();
}

class ScreenDailyState extends State<ScreenDaily> {
  List<ModelDailyGroup> _data = [];

  void reloadData() async {
    List<ModelDailyGroup> groups =
        await Provider.of<AppDatabase>(context, listen: false)
            .dailyGroups
            .select()
            .map((p0) => ModelDailyGroup(id: p0.id, name: p0.name, dailies: []))
            .get();
    for (ModelDailyGroup group in groups) {
      // ignore: use_build_context_synchronously
      List<ModelDaily> dailies = await (Provider.of<AppDatabase>(context,
                  listen: false)
              .dailies
              .select()
            ..where((tbl) => tbl.group.equals(group.id)))
          .map((p0) =>
              ModelDaily(id: p0.id, name: p0.name, isCompleted: p0.isCompleted))
          .get();
      group.dailies = dailies;
    }
    setState(() {
      _data = groups;
    });
  }

  @override
  void initState() {
    reloadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.daily_title),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: _data
              .map(
                (e) => Card(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            e.name,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: Text(
                                      AppLocalizations.of(context)!.daily_ask),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(AppLocalizations.of(context)!
                                          .daily_cancel),
                                    ),
                                    TextButton(
                                        onPressed: () async {
                                          final int groupId = e.id;
                                          await Provider.of<AppDatabase>(
                                                  context,
                                                  listen: false)
                                              .dailyGroups
                                              .deleteWhere((tbl) =>
                                                  tbl.id.equals(groupId));
                                          // ignore: use_build_context_synchronously
                                          await Provider.of<AppDatabase>(
                                                  context,
                                                  listen: false)
                                              .dailies
                                              .deleteWhere((tbl) =>
                                                  tbl.group.equals(groupId));
                                          // ignore: use_build_context_synchronously
                                          Navigator.of(context).pop(true);
                                        },
                                        child: Text(
                                            AppLocalizations.of(context)!
                                                .daily_confirm)),
                                  ],
                                ),
                              ).then((value) {
                                if (value == true) {
                                  reloadData();
                                }
                              });
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.redAccent,
                            ),
                          ),
                        ],
                      ),
                      ...e.dailies
                          .map((e0) => Row(
                                children: [
                                  Checkbox(
                                    value: e0.isCompleted,
                                    onChanged: (bool? val) {
                                      if (val != null) {
                                        setState(() {
                                          e0.isCompleted = val;
                                        });
                                      }
                                    },
                                  ),
                                  Text(e0.name),
                                ],
                              ))
                          .toList()
                    ]),
                  ),
                ),
              )
              .toList(),
        ),
      ),
      bottomNavigationBar: const ComBottomNavigationBar(
        currentIndex: 1,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final formKey = GlobalKey<FormState>();
          final groupNameController = TextEditingController();
          final itemNameController = TextEditingController();
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: const RoundedRectangleBorder(),
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return AppLocalizations.of(context)!
                                      .daily_form_group_tip;
                                }
                                return null;
                              },
                              controller: groupNameController,
                              decoration: InputDecoration(
                                label: Text(AppLocalizations.of(context)!
                                    .daily_form_group_title),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 16.0),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return AppLocalizations.of(context)!
                                        .daily_form_item_tip;
                                  }
                                  return null;
                                },
                                controller: itemNameController,
                                decoration: InputDecoration(
                                  label: Text(AppLocalizations.of(context)!
                                      .daily_form_item_title),
                                  border: const OutlineInputBorder(),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(AppLocalizations.of(context)!
                                        .daily_form_cancel),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      if (formKey.currentState!.validate()) {
                                        int groupId = (await Provider.of<
                                                        AppDatabase>(context,
                                                    listen: false)
                                                .dailyGroups
                                                .insertReturning(
                                                    DailyGroupsCompanion.insert(
                                                        name:
                                                            groupNameController
                                                                .text)))
                                            .id;

                                        // ignore: use_build_context_synchronously
                                        await Provider.of<AppDatabase>(context,
                                                listen: false)
                                            .dailies
                                            .insertOne(DailiesCompanion.insert(
                                                name: itemNameController.text,
                                                isCompleted: false,
                                                group: groupId));
                                        // ignore: use_build_context_synchronously
                                        Navigator.of(context).pop(true);
                                      }
                                    },
                                    child: Text(AppLocalizations.of(context)!
                                        .daily_form_save),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ).then((value) {
            if (value == true) {
              reloadData();
            }
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
