class SliderModel {
  String title;
  String description;

  SliderModel({
    required this.title,
    required this.description,
  });

  void setTitle(String source) {
    title = source;
  }

  void setDescription(String source) {
    description = source;
  }
}
