import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flip_card/flip_card.dart';

class Country extends StatelessWidget {
  final Map country;
  Country(this.country);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(
          country['name'],
          style: TextStyle(
            letterSpacing: 1.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ) ,
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          children: <Widget>[
            FlipCard(
              direction: FlipDirection.VERTICAL,
                front: CountryCard(title: 'Capital'),
                back: CountryDetailCard(title: country['capital'],)
            ),
            FlipCard(
                direction: FlipDirection.VERTICAL,
                front: CountryCard(title: 'Population'),
                back: CountryDetailCard(title: country['population'].toString(),)
            ),
            FlipCard(
                direction: FlipDirection.VERTICAL,
                front: CountryCard(title: 'Flag'),
                back: CountryDetailCard(title: 'Hello',)
            ),
            FlipCard(
                direction: FlipDirection.VERTICAL,
                front: CountryCard(title: 'Currency'),
                back: CountryDetailCard(title: country['currency'],)
            ),
            FlipCard(
                direction: FlipDirection.VERTICAL,
                front: CountryCard(title: 'Show on map'),
                back: CountryDetailCard(title: 'Hello',)
            ),
          ],

        ),
      ),
    );
  }
}

class CountryDetailCard extends StatelessWidget {
  final String title;
  const CountryDetailCard({
    Key key,
    this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.deepOrange,
      elevation: 10,
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            letterSpacing: 1.0,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}

class CountryCard extends StatelessWidget {
  final String title;
  const CountryCard({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0
            ),
          ),
        )
    );
  }
}
