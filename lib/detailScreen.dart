import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wisata_gunung_nusantara/model/data_gunung.dart';

var informationTextStyle = TextStyle(
  fontFamily: 'Oxygen',
);

class DetailScreen extends StatelessWidget {
  final DataGunung place;

  DetailScreen({@required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FavoriteButton(),
      backgroundColor: Colors.lightGreen[200],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Hero(tag: place.tag ?? '', child: Image.asset(place.assets)),
                SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.arrow_back_outlined),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 10.0, bottom: 10),
              color: Colors.green,
              child: Text(
                place.nama,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  fontFamily: 'Staatliches',
                  color: Colors.yellowAccent,
                ),
              ),
            ),
            Container(
              color: Colors.green[600],
              padding: EdgeInsets.only(top: 12, bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(
                        children: [
                          Icon(
                            Icons.location_pin,
                            color: Colors.amber,
                          ),
                          Text(
                            'Lokasi',
                            style: TextStyle(
                                color: Colors.yellow,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          )
                        ],
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        '${place.lokasi}',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Row(
                        children: [
                          Icon(
                            Icons.monetization_on,
                            color: Colors.amber,
                          ),
                          Text(
                            'Tiket Masuk',
                            style: TextStyle(
                                color: Colors.yellow,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          )
                        ],
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        place.harga,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Text(
                place.deskripsi,
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 16.0, color: Colors.black87, height: 1.7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.amber.withOpacity(0.75),
          borderRadius: BorderRadius.circular(10)),
      child: IconButton(
        icon: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
        ),
        onPressed: () {
          setState(() {
            isFavorite = !isFavorite;
          });
        },
      ),
    );
  }
}
