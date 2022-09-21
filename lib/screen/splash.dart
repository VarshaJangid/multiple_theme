import 'package:flutter/material.dart';
import 'dart:math';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  moveToMain() {
    Future.delayed(const Duration(seconds: 4),
        () => Navigator.of(context).pushNamed('/first'));
  }

  @override
  void initState() {
    super.initState();
    moveToMain();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) => AnimatedLogo(animation: animation);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class AnimatedLogo extends AnimatedWidget {
  const AnimatedLogo({
    super.key,
    required Animation<double> animation,
  }) : super(listenable: animation);

  static final _opacityTween = Tween<double>(begin: 0.1, end: 1);
  static final _sizeTween = Tween<double>(begin: 0, end: 300);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Scaffold(
      body: Center(
        child: Opacity(
          opacity: _opacityTween.evaluate(animation),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            height: _sizeTween.evaluate(animation),
            width: _sizeTween.evaluate(animation),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/sofa.png"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class UsedInTutorialTextOnly extends _SplashScreenState {
  UsedInTutorialTextOnly() {
    var animation, sizeAnimation, opacityAnimation, tween, colorTween;
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    sizeAnimation = Tween<double>(begin: 0, end: 300).animate(controller);
    opacityAnimation = Tween<double>(begin: 0.1, end: 1).animate(controller);
    tween = Tween<double>(begin: -200, end: 0);
    colorTween = ColorTween(begin: Colors.transparent, end: Colors.black54);
  }

  usedInTutorialOnly1() {
    AnimationController controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    Animation<int> alpha = IntTween(begin: 0, end: 255).animate(controller);
    return alpha;
  }

  usedInTutorialOnly2() {
    AnimationController controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    final Animation<double> curve =
        CurvedAnimation(parent: controller, curve: Curves.easeOut);
    Animation<int> alpha = IntTween(begin: 0, end: 255).animate(curve);
    return alpha;
  }
}

class ShakeCurve extends Curve {
  @override
  double transform(double t) => sin(t * pi * 2);
}
