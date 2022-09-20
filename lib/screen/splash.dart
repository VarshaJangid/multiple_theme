import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashState();
}

class _SplashState extends State<SplashPage> {
  @override
  void initState() {
    moveToMain();
    super.initState();
  }

  moveToMain() {
    Future.delayed(const Duration(seconds: 2),
        () => Navigator.of(context).pushNamed('/first'));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
