import 'package:flutter/material.dart';
import 'package:test_tasarim/museumScreen.dart';

import 'accomScreen.dart';
import 'agencyScreen.dart';
import 'appColors.dart';
import 'bankScreen.dart';
import 'hospitalScreen.dart';
import 'publicBuildingScreen.dart';
import 'restaurantScreen.dart';
import 'yacthTourScreen.dart';

class PratikRehber extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = "Pratik Rehber";

    return MaterialApp(
        title: title,
        routes: <String, WidgetBuilder>{
          '/accomScreen': (BuildContext context) => AccomScreen(),
          '/agencyScreen': (BuildContext context) => AgencyScreen(),
          '/restaurantScreen': (BuildContext context) => RestaurantScreen(),
          '/museumScreen': (BuildContext context) => MuseumScreen(),
          '/yatchTourScreen': (BuildContext context) => YatchTourScreen(),
          '/hospitalScreen': (BuildContext context) => HospitalScreen(),
          '/bankScreen': (BuildContext context) => BankScreen(),
          '/publicBuildingScreen': (BuildContext context) =>
              PublicBuildingScreen()
        },
        home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              automaticallyImplyLeading: true,
              backgroundColor: AppColors.darkBlue,
              leading: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: IconButton(
                  icon: Icon(
                    Icons.chevron_left,
                    size: 40,
                  ),
                  onPressed: () {},
                  color: Colors.white,
                ),
              ),
              title: Text(title, style: TextStyle(fontSize: 16)),
              actions: <Widget>[
                Padding(
                    padding: EdgeInsets.only(right: 30.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.bookmarks_outlined,
                        size: 26.0,
                      ),
                    )),
              ],
            ),
            body: GridView.count(
                crossAxisCount: 2,
                children: List.generate(guideElements.length, (index) {
                  return Center(
                    child: MenuItem(guide: guideElements[index]),
                  );
                }))));
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem({Key key, this.guide}) : super(key: key);
  final Guide guide;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      margin: EdgeInsets.all(20),
      child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, guide.nav);
          },
          child: Stack(children: [
            Container(
                decoration: BoxDecoration(
                    color: guide.color,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(6),
                        topRight: Radius.circular(6))),
                width: 300,
                height: 120,
                child: Icon(guide.icon, size: 45.0, color: Colors.white)),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(6),
                        bottomRight: Radius.circular(6))),
                width: 300,
                height: 55,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(guide.title,
                          style: TextStyle(color: Colors.black, fontSize: 16)),
                      Icon(Icons.arrow_forward)
                    ],
                  ),
                ),
              ),
            ),
          ])),
    );
  }
}

class Guide {
  const Guide({this.title, this.icon, this.color, this.nav});

  final String title;
  final IconData icon;
  final Color color;
  final String nav;
}

const List<Guide> guideElements = const <Guide>[
  const Guide(
      title: 'Konaklama',
      icon: Icons.hotel,
      color: AppColors.darkBlue,
      nav: '/accomScreen'),
  const Guide(
      title: 'Acentalar',
      icon: Icons.directions,
      color: AppColors.red,
      nav: '/agencyScreen'),
  const Guide(
      title: 'Restoranlar',
      icon: Icons.restaurant,
      color: AppColors.olive,
      nav: '/restaurantScreen'),
  const Guide(
      title: 'Müzeler',
      icon: Icons.museum,
      color: AppColors.lightBlue,
      nav: '/museumScreen'),
  const Guide(
      title: 'Tekne Turları',
      icon: Icons.directions_boat,
      color: AppColors.grey,
      nav: '/yatchTourScreen'),
  const Guide(
      title: 'Hastane',
      icon: Icons.local_hospital,
      color: AppColors.purple,
      nav: '/hospitalScreen'),
  const Guide(
      title: 'Bankalar',
      icon: Icons.attach_money,
      color: AppColors.red,
      nav: '/bankScreen'),
  const Guide(
      title: 'Kamu Bina',
      icon: Icons.people,
      color: AppColors.orange,
      nav: '/publicBuildingScreen'),
];
