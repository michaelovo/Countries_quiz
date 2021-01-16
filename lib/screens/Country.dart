import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

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
            CountryCard(title: 'Capital'),
            CountryCard(title: 'Population'),
            CountryCard(title: 'Flag'),
            CountryCard(title: 'Currency'),
            CountryCard(title: 'Show on map'),

          ],

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
