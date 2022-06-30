import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_mgmt_provider/screens/catalog_screen.dart';
import 'models/cart_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StateMgmt Provider',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CatalogScreen(),
    );
  }
}
