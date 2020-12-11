import 'package:flutter/material.dart';

import '../screens/products_overview_screen.dart';

class CategoryItem extends StatelessWidget {
  final String name;
  final String image;
  CategoryItem(this.name, this.image);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductsOverviewScreen.routeName,
              arguments: name,
            );
          },
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          title: Text(
            name,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
