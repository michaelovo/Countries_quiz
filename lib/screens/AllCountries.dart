import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:country_house/screens/Country.dart';

class AllCountries extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        elevation: 0,
        title: Text(
          'All countries',
          style: TextStyle(
            letterSpacing: 1.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Country(),
                ),
              );
            },
            child: Card(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical:10.0, horizontal: 8.0),
                  child: Text('Nigeria'),
                )
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Country(),
                ),
              );
            },
            child: Card(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical:10.0, horizontal: 8.0),
                  child: Text('England'),
                )
            ),
          ),
        ],),
      ),
    );
  }
}
