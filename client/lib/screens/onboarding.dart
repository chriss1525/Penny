import 'package:client/screens/login.dart';
import 'package:client/screens/register.dart';
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
              currentIndex == slides.length - 1
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OnboardingCtaButton(
                          currentIndex: currentIndex,
                          controller: _controller,
                          buttonText: 'Login',
                          buttonType: ButtonType.login,
                        ),
                        const SizedBox(width: 20),
                        OnboardingCtaButton(
                          currentIndex: currentIndex,
                          controller: _controller,
                          buttonText: 'Register',
                          buttonType: ButtonType.register,
                        ),
                      ],
                    )
                  : OnboardingCtaButton(
                      currentIndex: currentIndex,
                      controller: _controller,
                      buttonText: 'Next',
                      buttonType: ButtonType.next,
                    )
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

enum ButtonType { login, register, next }

class OnboardingCtaButton extends StatelessWidget {
  const OnboardingCtaButton({
    super.key,
    required this.currentIndex,
    required PageController controller,
    required this.buttonText,
    required this.buttonType,
  }) : _controller = controller;

  final int currentIndex;
  final PageController _controller;
  final String buttonText;
  final ButtonType buttonType;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        // if current index is not last item, on click set current index to next item
        if (currentIndex < slides.length - 1 && _controller.hasClients) {
          _controller.animateToPage(
            currentIndex + 1,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
          );
        } else if (_controller.hasClients) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setBool('isOnboarded', true);

          if (!context.mounted) return;

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => buttonType == ButtonType.login
                  ? const LoginScreen()
                  : const Register(),
            ),
          );
        }
      },
      style: buttonType == ButtonType.register
          ? ElevatedButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              backgroundColor: Theme.of(context).colorScheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            )
          : null,
      child: Text(buttonText),
    );
  }
}
