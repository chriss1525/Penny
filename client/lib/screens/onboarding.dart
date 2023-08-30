import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/slider.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({
    super.key,
  });

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
    return Stack(
      children: <Widget>[
        PageView.builder(
          controller: _controller,
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
              ],
            ),
          ),
        ),
        Align(
          alignment: const Alignment(1.0, 0.7),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  slides.length,
                  (index) => buildDot(index: index),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  // if current index is not last item, on click set current index to next item
                  if (currentIndex < slides.length - 1 &&
                      _controller.hasClients) {
                    _controller.animateToPage(
                      currentIndex + 1,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  } else if (_controller.hasClients) {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setBool('isOnboarded', true);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Placeholder(),
                      ),
                    );
                  }
                },
                child: Text(
                    currentIndex < slides.length - 1 ? 'Next' : 'Get Started'),
              ),
            ],
          ),
        ),
      ],
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
