import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'appColors.dart';

class AccomScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = "Konaklama";

    CollectionReference accom =
        FirebaseFirestore.instance.collection('konaklama');

    return StreamBuilder(
        stream: accom.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Error");
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
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
                                Icons.bookmarks_outlined,
                                size: 26.0,
                              ),
                            )),
                      ],
                    ),
                    body: Center(
                      child: CircularProgressIndicator(),
                    )));
          }

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
                              Icons.bookmarks_outlined,
                              size: 26.0,
                            ),
                          )),
                    ],
                  ),
                  body: ListView(
                    children:
                        snapshot.data.docs.map((DocumentSnapshot document) {
                      final placeTitle = document.data()['placeTitle'];
                      final phone = document.data()['phone'];
                      final location = document.data()['location'];
                      final imageUrl = document.data()['imageUrl'];
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
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                                        imageUrl,
                                        fit: BoxFit.cover,
                                        loadingBuilder: (BuildContext context,
                                            Widget child,
                                            ImageChunkEvent loadingProgress) {
                                          if (loadingProgress == null)
                                            return child;
                                          return Center(
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  new AlwaysStoppedAnimation<
                                                          Color>(
                                                      AppColors.darkBlue),
                                              value: loadingProgress
                                                          .expectedTotalBytes !=
                                                      null
                                                  ? loadingProgress
                                                          .cumulativeBytesLoaded /
                                                      loadingProgress
                                                          .expectedTotalBytes
                                                  : null,
                                            ),
                                          );
                                        },
                                      ),
                                    )),
                              ),
                            ),
                            Expanded(
                                flex: 3,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 10),
                                      Text(
                                        placeTitle,
                                        style: TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        phone,
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w300),
                                      ),
                                      SizedBox(height: 8),
                                      Row(
                                        children: [
                                          Text(
                                            location,
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
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(6)),
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
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(6)),
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
                    }).toList(),
                  )));
        });
  }
}
