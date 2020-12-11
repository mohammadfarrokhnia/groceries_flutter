import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/app_drawer.dart';

class AboutUs extends StatelessWidget {
  static const routeName = '/aboutusscreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: AppDrawer(),
      body: Container(
        alignment: Alignment.center,
        child: Text(
          "Created by Mohammad Farrokhnia",
          style: TextStyle(
            color: Colors.black12,
            fontSize: 25,
            fontFamily: 'Anton',
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
