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
  Future<List> countries;
  Future<List> getCountries()async{
    var response = await Dio().get("https://restcountries.eu/rest/v2/all");
    // print(response.data.length);
    return response.data;

  }

  @override
  void initState() {
    countries = getCountries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print(countries);

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
        child: FutureBuilder<List>(
          future : countries,
          builder: (BuildContext context, AsyncSnapshot<List> snapshot){
            if(snapshot.hasData){
              // print(snapshot.data);
              return ListView.builder(
                itemBuilder: (BuildContext context, int index){
                  return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => Country(snapshot.data[index]),
                              ),
                            );
                          },
                          child: Card(
                              elevation: 10,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical:10.0, horizontal: 8.0),
                                child: Text(snapshot.data[index]["name"]),
                              )
                          ),
                        );

              });
            }
            return null;
          },
        ),
      ),
    );
  }
}
