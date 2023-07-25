class ModelDaily {
  int id;
  String name;
  bool isCompleted;

  ModelDaily({required this.id, required this.name, required this.isCompleted});
}

class ModelDailyGroup {
  int id;
  String name;
  List<ModelDaily> dailies;

  ModelDailyGroup(
      {required this.id, required this.name, required this.dailies});
}
