import 'package:flutter/material.dart';
import 'package:wisata_gunung_nusantara/detailScreen.dart';
import 'package:wisata_gunung_nusantara/dataList.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wisata Gunung Nusantara',),
      ),
      body: ListView(
        children: dataGunungList.map((place) {
          return FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailScreen(place: place);
              }));
            },
            child: Card(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Row(
                crossAxisAlignment: 
                CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(place.assets)
                    ),
                    
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            place.nama,
                            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700, color: Colors.white),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(place.lokasi,
                          style: TextStyle(fontSize: 13.5, fontWeight: FontWeight.w400, color: Colors.white70)),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}