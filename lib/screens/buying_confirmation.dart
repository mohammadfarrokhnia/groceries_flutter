import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/cart.dart';
import 'package:flutter_complete_guide/providers/orders.dart';
import 'package:provider/provider.dart';

class BuyingConfirmation extends StatefulWidget {
  static const routeName = '/buyingconfirmation';

  @override
  _BuyingConfirmationState createState() => _BuyingConfirmationState();
}

class _BuyingConfirmationState extends State<BuyingConfirmation> {
  static String adress = "";
  final _form = GlobalKey<FormState>();
  void _saveform() {
    _form.currentState.save();
  }

  @override
  Widget build(BuildContext context) {
    final bconfirm = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirm the purches'),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          child: Column(children: <Widget>[
            Padding(padding: EdgeInsets.all(20)),
            Form(
              key: _form,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'adress',
                  prefixIcon: Icon(Icons.map),
                  border: OutlineInputBorder(),
                ),
                textInputAction: TextInputAction.done,
                onSaved: (val) => adress = val,
              ),
            ),
            FlatButton(
              child: Text("pay cash"),
              onPressed: () {
                _saveform();
                Provider.of<Orders>(context, listen: false).addOrder(
                  bconfirm.items.values.toList(),
                  bconfirm.totalAmount,
                  adress,
                );
                bconfirm.clear();
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text("pay online"),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text('An Error Occurred!'),
                    content: Text("this feature is not availabe at the moment"),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('Okay'),
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                      )
                    ],
                  ),
                );
              },
            ),
          ]),
        ),
      ),
    );
  }
}
