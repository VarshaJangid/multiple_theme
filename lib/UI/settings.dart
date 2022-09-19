import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '/Model/theme_model.dart';

class Setting extends StatefulWidget {
  Setting({Key? key, required this.title, required this.model})
      : super(key: key);
  final String title;
  ThemeModel model;

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: widget.model,
      child: Consumer<ThemeModel>(
        builder: (_, model, __) => Scaffold(
          appBar: AppBar(
            backgroundColor: model.primaryMainColor,
            title: const Text(
              "Settings",
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(top: 40),
            child: Wrap(
              runAlignment: WrapAlignment.center,
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 40,
              runSpacing: 20,
              children: [
                coloWidget(
                  model: model,
                  color: const Color(0xffA600B1),
                  colorString: "0xffA600B1",
                ),
                coloWidget(
                  model: model,
                  color: const Color(0xffEB0060),
                  colorString: "0xffEB0060",
                ),
                coloWidget(
                  model: model,
                  color: const Color(0xffFE3F0C),
                  colorString: "0xffFE3F0C",
                ),
                coloWidget(
                  model: model,
                  color: const Color(0xffF8D400),
                  colorString: "0xffF8D400",
                ),
                coloWidget(
                  model: model,
                  color: const Color(0xff5600B6),
                  colorString: "0xff5600B6",
                ),
                coloWidget(
                  model: model,
                  color: const Color(0xffC20000),
                  colorString: "0xffC20000",
                ),
                coloWidget(
                  model: model,
                  color: const Color(0xff4977A0),
                  colorString: "0xff4977A0",
                ),
                coloWidget(
                  model: model,
                  color: const Color(0xff785446),
                  colorString: "0xff785446",
                ),
                coloWidget(
                  model: model,
                  color: const Color(0xff169D39),
                  colorString: "0xff169D39",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget coloWidget(
      {required ThemeModel model,
      required Color color,
      required String colorString}) {
    return InkWell(
      onTap: () async {
        _showToast(context);
        model.setPrimaryMainColor(color);
        model.setAppbarShadeColor(color);
        // final prefs = await SharedPreferences.getInstance();
        // prefs.setString("color", colorString);
      },
      child: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Theme Colour Applied'),
        action: SnackBarAction(
            label: 'Close', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}
