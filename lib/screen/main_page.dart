import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

import '/screen/game/game_page.dart';
import '/theming/theme_manager.dart';
import '/model/category_model.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainState();
}

class _MainState extends State<MainPage> {
  List<CategoryModel> categoryList = [];

  @override
  initState() {
    fetchCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, theme, child) => Scaffold(
        body: categoryList.isEmpty
            ? const SizedBox.shrink()
            : DefaultTabController(
                length: categoryList.length,
                child: NestedScrollView(
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return [
                      SliverAppBar(
                        leading: const SizedBox.shrink(),
                        centerTitle: false,
                        actions: [
                          PopupMenuButton<int>(
                            color: Theme.of(context).dialogBackgroundColor,
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                value: 1,
                                child: Text(
                                  'Light Theme',
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                                onTap: () => theme.setLightMode(),
                              ),
                              PopupMenuItem(
                                value: 2,
                                child: Text(
                                  "Dark Theme",
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                                onTap: () => theme.setDarkMode(),
                              ),
                              PopupMenuItem(
                                value: 3,
                                child: Text(
                                  "Red Theme",
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                                onTap: () => theme.setRedMode(),
                              ),
                              PopupMenuItem(
                                value: 45,
                                child: Text(
                                  "Green Theme",
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                                onTap: () => theme.setGreenMode(),
                              ),
                            ],
                          ),
                        ],
                        title: const Text('Games'),
                        pinned: true,
                        floating: true,
                        bottom: TabBar(
                          isScrollable: true,
                          tabs: categoryList.map((e) {
                            return Tab(child: Text(e.name));
                          }).toList(),
                        ),
                      ),
                    ];
                  },
                  body: TabBarView(
                    children: categoryList.map((categoryModel) {
                      return GamePage(
                        categoryId: categoryModel.id,
                      );
                    }).toList(),
                  ),
                ),
              ),
      ),
    );
  }

  fetchCategories() async {
    categoryList = await categoryApi();
    setState(() {});
  }

  Future<List<CategoryModel>> categoryApi() async {
    http.Response response =
        await http.get(Uri.parse("https://games.gamepix.com/categories"));
    var responseJson = json.decode(response.body);
    return (responseJson['data'] as List)
        .map((p) => CategoryModel.fromJson(p))
        .toList();
  }
}
