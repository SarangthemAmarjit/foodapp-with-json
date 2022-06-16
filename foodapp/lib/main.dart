import 'package:flutter/material.dart';
import 'package:foodapp/cartitemshow.dart';
import 'package:foodapp/homepage.dart';
import 'package:foodapp/item.dart';
import 'package:path_provider/path_provider.dart';

import 'package:foodapp/iteminfo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

String savedatajson = '';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getExternalStorageDirectory();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FOOD APP',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: FoodApp(),
    );
  }
}

class FoodApp extends StatefulWidget {
  const FoodApp({Key? key}) : super(key: key);

  @override
  State<FoodApp> createState() => _FoodAppState();
}

class _FoodAppState extends State<FoodApp> {
  @override
  initState() {
    super.initState();
  }

  List<Widget> itm = [
    HomePage1(),
    Text('SEARCH'),
    Text('NOTIFICATION'),
    Mycarditem(),
    const Text('ACCOUNT'),
  ];
  int currentselectedindex = 0;

  void _ontap(int index) {
    setState(() {
      currentselectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (itm.elementAt(currentselectedindex)),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search_outlined,
              ),
              label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications_outlined,
              ),
              label: 'Notification'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart_outlined,
              ),
              label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline_outlined,
              ),
              label: 'Account'),
        ],
        iconSize: 30,
        currentIndex: currentselectedindex,
        elevation: 5,
        selectedFontSize: 17,
        selectedItemColor: Colors.amber,
        showSelectedLabels: true,
        selectedIconTheme: IconThemeData(color: Colors.amber),
        unselectedIconTheme: IconThemeData(color: Colors.black45),
        onTap: _ontap,
      ),
    );
  }
}
