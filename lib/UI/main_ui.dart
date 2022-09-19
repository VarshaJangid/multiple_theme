import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '/Model/productModel.dart';
import '/Model/theme_model.dart';

import '/UI/Widgets/mainui_customcard.dart';
import '/UI/settings.dart';

class MainUI extends StatefulWidget {
  ThemeModel model;

  MainUI(this.model, {super.key});

  @override
  State<MainUI> createState() => _MainUIState();
}

class _MainUIState extends State<MainUI> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  bool isExpanded = false;
  List<Product> trendingListItems = [];
  double _height = 0.0;
  double _width = 0.0;

  @override
  void initState() {
    trendingListItems = [
      Product(
          123,
          "02 Apr 2019",
          "Lenovo T450",
          "Discover the Lenovo ThinkPad T450, a 14-inch thin and light business Ultrabook with the newest Intel Core i processor, backlit keyboard and up to 17 hours battery backup.",
          40000,
          "5 months",
          "Electronics",
          8377028021,
          "assets/images/lenovot450.jpg",
          true),
      Product(
          124,
          "05 Apr 2019",
          "Samsung S9+",
          "Discover Galaxy S9 and S9+ and the revolutionary camera that adapts like the human eye.",
          60000,
          "5 months",
          "Mobiles",
          8377028021,
          "assets/images/samsuns9+.jpg",
          true),
      Product(
          125,
          "23 Mar 2019",
          "Himalayan",
          "The Himalayan is an ‘all-rounder’ motorcycle built on an all new platform from Royal Enfield. It is a 411cc adventure motorcycle which was partly developed in the United Kingdom. The motorcycle brings a series of firsts for the brand.",
          100000,
          "5 months",
          "Bike",
          8377028021,
          "assets/images/bike.jpg",
          true),
      Product(
          126,
          "10 Feb 2019",
          "Canon 200D",
          "Canon EOS 200D 24.2MP Digital SLR Camera + EF-S 18-55 mm f4 is STM Lens, Free Camera Case and 16GB Card Inside",
          35000,
          "5 months",
          "Electronics",
          8377028021,
          "assets/images/canon.jpg",
          true),
      Product(
          127,
          "1 Jan 2019",
          "Sofa",
          "Bharat Lifestyle Nano Fabric 6 Seater Sofa",
          4000,
          "5 months",
          "Furniture",
          8377028021,
          "assets/images/sofa.jpg",
          true),
    ];
    super.initState();
  }

  void _expand() {
    setState(() {
      isExpanded ? isExpanded = false : isExpanded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider.value(
      value: widget.model,
      child: Consumer<ThemeModel>(builder: (context, model, __) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: model.appbarShadeColor,
            centerTitle: true,
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Opacity(
                  opacity: 1.0,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Setting(model: model, title: 'Varsha Jangid')),
                      );
                    },
                    child: Icon(
                      Icons.settings,
                      color: Colors.white,
                      size: _height / 30,
                    ),
                  ),
                ),
              ),
            ],
            leading: Opacity(
              opacity: 1.0,
              child: GestureDetector(
                onTap: () {
                  scaffoldKey.currentState!.openDrawer();
                },
                child: Image.asset(
                  'assets/images/menubutton.png',
                  color: Colors.white,
                  scale: 25,
                ),
              ),
            ),
            title: const Text(
              'Multi Theme',
              style: TextStyle(color: Colors.white),
            ),
          ),
          backgroundColor: Colors.amber[200],
          bottomNavigationBar: _bottomNavBar(model),
          key: scaffoldKey,
          drawer: _drawer(model),
          body: Container(
            color: Colors.white,
            height: _height,
            width: _width,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(left: 30, right: 30, top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text('Shop for', style: TextStyle(fontSize: 16)),
                        GestureDetector(
                          onTap: _expand,
                          child: Text(
                            isExpanded ? "Show less" : "Show all",
                            style: TextStyle(color: model.textColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                  expandList(model.appbarShadeColor),
                  Divider(color: model.dividerColor),
                  const Text("    Trending", style: TextStyle(fontSize: 16)),
                  trendingProducts(model.appbarShadeColor),
                  const Divider(),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _drawer(ThemeModel model) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Opacity(
            opacity: 0.75,
            child: Container(
              height: _height / 6,
              padding: EdgeInsets.only(top: _height / 20),
              color: model.appbarShadeColor,
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 40,
                    color: model.appbarShadeColor,
                  ),
                ),
                title: const Text("FlutterDevs"),
                subtitle: const Text(
                  "flutterDevs@aeologic.com",
                  style: TextStyle(fontSize: 13),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.payment),
            title: Text("Orders & Payments"),
          ),
        ],
      ),
    );
  }

  Widget _bottomNavBar(ThemeModel model) {
    return BottomAppBar(
      color: model.primaryMainColor,
      notchMargin: 4,
      shape: AutomaticNotchedShape(const RoundedRectangleBorder(),
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
      child: Container(
        margin: const EdgeInsets.only(left: 50, right: 50),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(30)),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Image.asset(
                'assets/images/mail.png',
                scale: 3,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset(
                'assets/images/calendar.png',
                scale: 3.5,
                color: Colors.white,
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }

  Widget expandWidget(Color color, String name) {
    return Column(
      children: <Widget>[
        Container(
          color: color,
          height: _height / 12,
          width: _width / 6,
        ),
        const SizedBox(height: 5),
        Flexible(
          child: Text(
            name,
            style: const TextStyle(fontSize: 13),
          ),
        ),
      ],
    );
  }

  Widget expandList(Color color) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: AnimatedCrossFade(
        firstChild: GridView.count(
          padding: const EdgeInsets.all(5),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 4,
          children: <Widget>[
            expandWidget(color, "Electronics"),
            expandWidget(color, "Properties"),
            expandWidget(color, "Jobs"),
            expandWidget(color, "Furniture"),
            expandWidget(color, "Cars"),
            expandWidget(color, "Bikes"),
            expandWidget(color, "Mobiles"),
            expandWidget(color, "Pets"),
          ],
        ),
        secondChild: GridView.count(
          padding: const EdgeInsets.all(5),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 4,
          children: <Widget>[
            expandWidget(color, "Electronics"),
            expandWidget(color, "Properties"),
            expandWidget(color, "Jobs"),
            expandWidget(color, "Furniture"),
            expandWidget(color, "Cars"),
            expandWidget(color, "Bikes"),
            expandWidget(color, "Mobiles"),
            expandWidget(color, "Pets"),
            expandWidget(color, "Fashion"),
            expandWidget(color, "Style"),
          ],
        ),
        crossFadeState:
            isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        duration: kThemeAnimationDuration,
      ),
    );
  }

  Widget trendingProducts(Color color) {
    return SizedBox(
      height: _height / 4.25,
      child: ListView.builder(
        padding: const EdgeInsets.all(5),
        shrinkWrap: true,
        itemCount: trendingListItems.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, index) {
          return _buildTrendingEntries(
              context, index, trendingListItems, color);
        },
      ),
    );
  }

  Widget _buildTrendingEntries(
      BuildContext context, int index, List<Product> listItem, Color color) {
    return CustomCard(
      color: color,
      title: listItem[index].title,
      category: listItem[index].category,
      price: "₹${listItem[index].price}",
      dateAdded: listItem[index].dateAdded,
      description: listItem[index].desc,
      image: listItem[index].image,
      location: "Sector 62, Noida",
    );
  }
}
