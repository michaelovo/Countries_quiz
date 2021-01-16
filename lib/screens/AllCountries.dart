import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:country_house/screens/Country.dart';
import 'package:dio/dio.dart';

class AllCountries extends StatelessWidget {

  void getCountries()async{
    var response = await Dio().get("https://restcountries.eu/rest/v2/all");
    print(response.data.length);
  }
  @override
  Widget build(BuildContext context) {
    getCountries();

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
                  builder: (context) => Country("Nigeria"),
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
                  builder: (context) => Country("England"),
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
