import 'package:flutter/material.dart';

import '../models/slider.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: currentIndex);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      key: const Key('onboarding'),
      textDirection: TextDirection.ltr,
      child: PageView.builder(
        itemCount: slides.length,
        scrollDirection: Axis.horizontal,
        onPageChanged: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                slides[index].getTitle,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 20),
              Text(
                slides[index].getDescription,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  slides.length,
                  (index) => buildDot(index: index),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildDot({required int index, BuildContext? context}) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      height: 8,
      width: currentIndex == index ? 24 : 8,
      decoration: BoxDecoration(
        color: index == currentIndex
            ? Colors.deepPurple
            : Colors.deepPurple.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
