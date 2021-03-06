import 'package:flutter/material.dart';
import 'package:wisata_gunung_nusantara/detailScreen.dart';
import 'package:wisata_gunung_nusantara/dataList.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Wisata Gunung Nusantara',
        ),
      ),
      body: ListView(
        children: dataGunungList.map((place) {
          // ignore: deprecated_member_use
          return FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailScreen(place: place);
              }));
            },
            child: Card(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Material(
                elevation: 3,
                color: Colors.transparent,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Hero(
                          tag: place.tag ?? '',
                          child: Image.asset(
                            place.assets,
                            height: 80,
                            width: 100,
                            fit: BoxFit.cover,
                          )),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              place.nama,
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.yellow),
                            ),
                            SizedBox(height: 5),
                            Text(place.lokasi,
                                style: TextStyle(
                                    fontSize: 13,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.amber)),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
