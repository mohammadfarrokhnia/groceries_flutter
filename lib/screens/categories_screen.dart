import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/app_drawer.dart';
import 'package:provider/provider.dart';

import '../widgets/category_item.dart';
import '../providers/cart.dart';
import '../widgets/badge.dart';
import 'cart_screen.dart';

class CategoriesScrenn extends StatefulWidget {
  static const routeName = '/categoriesscreen';

  @override
  _CategoriesScrennState createState() => _CategoriesScrennState();
}

class _CategoriesScrennState extends State<CategoriesScrenn> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('MyShop'),
          actions: [
            Consumer<Cart>(
              builder: (_, cart, ch) => Badge(
                child: ch,
                value: cart.itemCount.toString(),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
              ),
            ),
          ],
        ),
        drawer: AppDrawer(),
        body: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          padding: const EdgeInsets.all(10.0),
          children: [
            CategoryItem(
              "لبنیات",
              "assets/images/dairy.jpg",
            ),
            CategoryItem(
              "دخانیات",
              "assets/images/smoking.jpg",
            ),
            CategoryItem(
              "میوه و تره بار",
              "assets/images/fruit.jpg",
            ),
            CategoryItem(
              "نوشیدنی",
              "assets/images/drink.jpg",
            ),
            CategoryItem(
              "بهداشتی",
              "assets/images/behdashty.jpg",
            ),
            CategoryItem(
              "اسنک",
              "assets/images/snack.jpg",
            ),
            CategoryItem(
              "خشکبار",
              "assets/images/khoshkbar.jpg",
            ),
          ],
        ),
      ),
    );
  }
}
