import 'package:flutter/material.dart';

class Country extends StatelessWidget {
  final String name;
  Country(this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(
          name,
          style: TextStyle(
            letterSpacing: 1.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ) ,
        centerTitle: true,
      ),
    );
  }
}
