class SliderModel {
  String title;
  String description;

  SliderModel({
    required this.title,
    required this.description,
  });

  String get getTitle => title;
  String get getDescription => description;

  set setTitle(String title) => this.title = title;
  set setDescription(String description) => this.description = description;
}
