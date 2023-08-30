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

// TODO: Implement server side logic to fetch slides from database
List<SliderModel> slides = [
  SliderModel(
    title: 'Welcome to Penny',
    description:
        'Penny is your personal finance assistant that helps you stay on top of your finances and achieve your financial goals.',
  ),
  SliderModel(
    title: 'How Penny Works',
    description:
        'Penny recognizes the financial notifications and SMSs you receive on your phone, analyzes them, and provides insight into your financial habits, income, and spending.',
  ),
  SliderModel(
    title: 'Set Your Goals',
    description:
        'With Penny, you can set financial goals and milestones for yourself. Penny will compare your habits to your goals and provide insight on whether you\'re on track or not.',
  ),
  SliderModel(
    title: 'Get Timely Notifications',
    description:
        'Penny provides timely notifications with useful and actionable steps you can take to achieve your financial goals.',
  ),
  SliderModel(
    title: 'Ready to Get Started?',
    description:
        'Take control of your finances with Penny. Let\'s get started!',
  )
];
