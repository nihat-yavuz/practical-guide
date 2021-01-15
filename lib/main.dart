import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(home: PratikRehber());
  }
}

class PratikRehber extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = "Pratik Rehber";

    return MaterialApp(
        title: title,
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
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Konaklama(),
                    ),
                  ),
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

class Guide {
  const Guide({this.title, this.icon, this.color});

  final String title;
  final IconData icon;
  final Color color;
}

class AppColors {
  static const Color darkBlue = Color.fromRGBO(0, 77, 166, 1.0);
  static const Color red = Color.fromRGBO(252, 72, 80, 1.0);
  static const Color olive = Color.fromRGBO(144, 196, 24, 1.0);
  static const Color grey = Color.fromRGBO(104, 104, 104, 1.0);
  static const Color lightBlue = Color.fromRGBO(89, 173, 255, 1.0);
  static const Color purple = Color.fromRGBO(176, 50, 231, 1.0);
  static const Color orange = Color.fromRGBO(248, 200, 34, 1.0);
}

const List guideElements = const [
  const Guide(title: 'Konaklama', icon: Icons.hotel, color: AppColors.darkBlue),
  const Guide(title: 'Acenteler', icon: Icons.directions, color: AppColors.red),
  const Guide(
      title: 'Restoranlar', icon: Icons.restaurant, color: AppColors.olive),
  const Guide(title: 'Müzeler', icon: Icons.museum, color: AppColors.lightBlue),
  const Guide(
      title: 'Tekne Turları',
      icon: Icons.directions_boat,
      color: AppColors.grey),
  const Guide(
      title: 'Hastane', icon: Icons.local_hospital, color: AppColors.purple),
  const Guide(
      title: 'Bankalar', icon: Icons.attach_money, color: AppColors.red),
  const Guide(title: 'Kamu', icon: Icons.people, color: AppColors.orange),
];

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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Konaklama(),
              ),
            );
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

class Konaklama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = "Konaklama";

    return MaterialApp(
        title: title,
        home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              automaticallyImplyLeading: true,
              backgroundColor: AppColors.darkBlue,
              leading: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: IconButton(
                  icon: Icon(
                    Icons.chevron_left,
                    size: 40,
                  ),
                  onPressed: () => Navigator.pop(context),
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
                        Icons.collections_bookmark,
                        size: 26.0,
                      ),
                    )),
              ],
            ),
            body: ListView(
                children: List.generate(placeList.length, (index) {
              return Center(
                child: AccomPlaces(place: placeList[index]),
              );
            }))));
  }
}

class Place {
  const Place({this.placeTitle, this.imageUrl, this.location, this.phone});
  final String placeTitle;
  final String location;
  final String phone;
  final String imageUrl;
}

const List placeList = const [
  const Place(
      placeTitle: 'Doga Hotel',
      location: '5 km',
      phone: '0 (123) 456 78 90',
      imageUrl:
          "https://images.unsplash.com/photo-1566073771259-6a8506099945?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1950&q=80"),
  const Place(
      placeTitle: 'Hello Bungalow',
      location: '600 mt',
      phone: '0 (123) 456 78 90',
      imageUrl:
          "https://images.unsplash.com/photo-1599304843532-5a8dff6d1ca8?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80"),
  const Place(
      placeTitle: 'Fener Motel',
      location: '985 mt',
      phone: '0 (123) 456 78 90',
      imageUrl:
          "https://images.unsplash.com/photo-1568084680786-a84f91d1153c?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1934&q=80"),
  const Place(
      placeTitle: 'Yavuz Camping',
      location: '4 km',
      phone: '0 (123) 456 78 90',
      imageUrl:
          "https://images.unsplash.com/photo-1517807289433-f0282e362596?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2014&q=80"),
  const Place(
      placeTitle: 'Deniz Hotel',
      location: '12 km',
      phone: '0 (123) 456 78 90',
      imageUrl:
          "https://images.unsplash.com/photo-1455587734955-081b22074882?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1920&q=80"),
  const Place(
      placeTitle: 'Kartal Camping',
      location: '7 km',
      phone: '0 (123) 456 78 90',
      imageUrl:
          "https://images.unsplash.com/photo-1532876924456-d6460f2f56a7?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80"),
  const Place(
      placeTitle: 'Baykus Motel',
      location: '510 mt',
      phone: '0 (123) 456 78 90',
      imageUrl:
          "https://images.unsplash.com/photo-1602174193653-ccd175d77132?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80"),
  const Place(
      placeTitle: 'Kanarya Hotel',
      location: '742 mt',
      phone: '0 (123) 456 78 90',
      imageUrl:
          "https://images.unsplash.com/photo-1567636788276-40a47795ba4d?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1934&q=80"),
];

class AccomPlaces extends StatelessWidget {
  const AccomPlaces({Key key, this.place}) : super(key: key);
  final Place place;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: .5,
            blurRadius: 10,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Container(
                    height: 130,
                    child: Image.network(
                      place.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  )),
            ),
          ),
          Expanded(
              flex: 3,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      place.placeTitle,
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 8),
                    Text(
                      place.phone,
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.w300),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          place.location,
                          style: TextStyle(
                              color: AppColors.darkBlue,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(" uzaklıkta",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w300))
                      ],
                    ),
                  ],
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 1),
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(6)),
                    child: Container(
                        width: 40,
                        height: 55,
                        color: AppColors.darkBlue,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.phone_enabled,
                            size: 26,
                            color: Colors.white,
                          ),
                        )),
                  ),
                ),
                ClipRRect(
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(6)),
                  child: Container(
                      width: 40,
                      height: 55,
                      color: AppColors.darkBlue,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.location_pin,
                          size: 26,
                          color: Colors.white,
                        ),
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
