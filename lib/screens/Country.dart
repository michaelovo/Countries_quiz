import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:country_house/screens/CountryMap.dart';

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
                back: CountryDetailCard(title: country['capital'],
                  color:Colors.deepOrange,
                )
            ),
            FlipCard(
                direction: FlipDirection.VERTICAL,
                front: CountryCard(title: 'Population'),
                back: CountryDetailCard(title: country['population'].toString(),
                  color:Colors.deepPurple,)
            ),
            FlipCard(
                direction: FlipDirection.VERTICAL,
                front: CountryCard(title: 'Calling Code'),
                back: CountryDetailCard(title: country['callingCodes'].toString(),
                  color: Colors.green,
                ),
            ),
            FlipCard(
                direction: FlipDirection.VERTICAL,
                front: CountryCard(title: 'Currency'),
                back: CountryDetailCard(title: country['currencies'][0]['name'],
                  color:Colors.blue,
                )
            ),
            FlipCard(
                direction: FlipDirection.VERTICAL,
                front: CountryCard(title: 'Region'),
                back: CountryDetailCard(title: country['region'],
                  color:Colors.red,
                )
            ),
            FlipCard(
                direction: FlipDirection.VERTICAL,
                front: CountryCard(title: 'Sub Region'),
                back: CountryDetailCard(title: country['subregion'],
                  color:Colors.cyan,
                )
            ),
            FlipCard(
              direction: FlipDirection.VERTICAL,
              front: CountryCard(title: 'Flag'),
              back:Card(
                color: Colors.white,
                elevation: 10,
                child: Center(
                    // child: SvgPicture.network(
                    //     country['flag'],
                    //     width: 100,
                    // ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (ctx) => CountryMap(country['name'], country['latlng']),
                    ),
                );
              },
                child: CountryCard(title: 'Show on map')
            ),
          ],

        ),
      ),
    );
  }
}

class CountryDetailCard extends StatelessWidget {
  final String title;
  final MaterialColor color;
  const CountryDetailCard({
    Key key,
    this.title,
    this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
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
