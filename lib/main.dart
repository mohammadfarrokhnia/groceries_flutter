import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/aboutus.dart';
import 'package:flutter_complete_guide/screens/categories_screen.dart';

import 'package:provider/provider.dart';

import './screens/splash_screen.dart';
import './screens/cart_screen.dart';
import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './providers/products.dart';
import './providers/cart.dart';
import './providers/orders.dart';
import './providers/auth.dart';
import './screens/orders_screen.dart';
import './screens/buying_confirmation.dart';
import './screens/auth_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        // ignore: missing_required_param
        ChangeNotifierProxyProvider<Auth, Products>(
          update: (ctx, auth, previousProducts) => Products(
            auth.token,
            auth.userId,
            previousProducts == null ? [] : previousProducts.items,
          ),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        // ignore: missing_required_param
        ChangeNotifierProxyProvider<Auth, Orders>(
          update: (ctx, auth, previousOrders) => Orders(
            auth.token,
            auth.userId,
            previousOrders == null ? [] : previousOrders.orders,
          ),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          title: 'MyShop',
          theme: ThemeData(
            primaryColor: Color(0xFF202020),
            primarySwatch: Colors.red,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato',
            textTheme: TextTheme(
              bodyText2: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              headline2: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
            ),
            inputDecorationTheme: InputDecorationTheme(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black87.withOpacity(0.2),
                ),
              ),
            ),
          ),
          home: auth.isAuth
              ? CategoriesScrenn()
              : FutureBuilder(
                  future: auth.tryAutoLogin(),
                  builder: (ctx, authResultSnapshot) =>
                      authResultSnapshot.connectionState ==
                              ConnectionState.waiting
                          ? SplashScreen()
                          : AuthScreen(),
                ),
          routes: {
            ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
            CartScreen.routeName: (ctx) => CartScreen(),
            OrdersScreen.routeName: (ctx) => OrdersScreen(),
            BuyingConfirmation.routeName: (ctx) => BuyingConfirmation(),
            CategoriesScrenn.routeName: (ctx) => CategoriesScrenn(),
            ProductsOverviewScreen.routeName: (ctx) => ProductsOverviewScreen(),
            AboutUs.routeName: (ctx) => AboutUs(),
          },
        ),
      ),
    );
  }
}
