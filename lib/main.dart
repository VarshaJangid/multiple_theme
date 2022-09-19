import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import 'UI/splash_screen.dart';
import '/UI/settings.dart';
import '/UI/main_ui.dart';

import '/Constants/constants.dart';
import '/Model/theme_model.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<ThemeModel>(create: (_) => ThemeModel())
        ],
        child: const MyApp(),
      ),
    );

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ChangeNotifierProvider<ThemeModel>(
      create: (BuildContext context) => ThemeModel(),
      child: Consumer<ThemeModel>(builder: (context, model, __) {
        return MaterialApp(
          initialRoute: SPLASH_SCREEN,
          routes: <String, WidgetBuilder>{
            MAIN_UI: (BuildContext context) => MainUI(model),
            SPLASH_SCREEN: (BuildContext context) =>
                const AnimatedSplashScreen(),
            SETTINGS_SCREEN: (BuildContext context) =>
                Setting(title: "", model: ThemeModel()),
          },
          darkTheme: ThemeData.dark(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            dividerColor: model.dividerColor,
            textTheme: Theme.of(context).textTheme.apply(
                bodyColor: model.textColor, displayColor: model.textColor),
            appBarTheme: AppBarTheme(color: model.appbarcolor),
            primaryColor: model.primaryMainColor,
            colorScheme:
                ColorScheme.fromSwatch().copyWith(secondary: model.accentColor),
          ),
          title: 'Flutter Multi Theme',
        );
      }),
    );
  }
}
