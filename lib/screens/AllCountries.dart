import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:country_house/screens/Country.dart';
import 'package:dio/dio.dart';

class AllCountries extends StatefulWidget {
  @override
  _AllCountriesState createState() => _AllCountriesState();
}

class _AllCountriesState extends State<AllCountries> {
  List countries =[];
  bool isSearching = false;

  getCountries() async {
    var response = await Dio().get("https://restcountries.eu/rest/v2/all");
    // print(response.data.length);
    return response.data;
  }

  @override
  void initState() {
    getCountries().then((data){
      setState(() {
        countries = data;
      });
    });
    super.initState();
  }

  void _filterCountries(value){
    print(value);
  }

  @override
  Widget build(BuildContext context) {
    // print(countries);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        elevation: 0,
        title: !isSearching
            ? Text(
                'All countries',
                style: TextStyle(
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )
            : TextField(
          onChanged: (value){
            _filterCountries(value);
          },
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            hintText: "Search country here ...",
            hintStyle: TextStyle(
                color: Colors.white
            ),
          ),
        ),
        actions: <Widget>[
          isSearching ?
          IconButton(
              icon: Icon(Icons.cancel),
              onPressed: () {
                setState(() {
                  this.isSearching = false;
                });
              }):
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                setState(() {
                  this.isSearching = true;
                });
              }),
        ],
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: countries.length > 0 ? ListView.builder(
          itemCount: countries.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Country(countries[index]),
                    ),
                  );
                },
                child: Card(
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 8.0),
                      child: Text(countries[index]["name"]),
                    )),
              );
            }): Center(
            child:CircularProgressIndicator()
        ),
      ),
    );
  }
}
