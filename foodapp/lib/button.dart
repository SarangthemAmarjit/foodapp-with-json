import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/change_notifier.dart';

import 'package:foodapp/iteminfo.dart';
import 'package:foodapp/main.dart';
import 'package:foodapp/preference_services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:foodapp/iteminfo.dart';

class QuantityButton extends StatefulWidget {
  final String idnumber;
  final double itemprice;
  final String itemphoto;
  final String itname;
  const QuantityButton({
    Key? key,
    required this.idnumber,
    required this.itemprice,
    required this.itemphoto,
    required this.itname,
  }) : super(key: key);

  @override
  State<QuantityButton> createState() => _QuantityButtonState();
}

class _QuantityButtonState extends State<QuantityButton> {
  late SharedPreferences sharedPreferences;

  int quantity = 0;

  @override
  void initState() {
    super.initState();

    initialGetSaved();
  }

  void initialGetSaved() async {
    sharedPreferences = await SharedPreferences.getInstance();

    // Read the data, decode it and store it in map structure
    Map<String, dynamic> jsondatais =
        jsonDecode(sharedPreferences.getString('userdata')!);
    var user = Fooditem.fromJson(jsondatais);
    if (jsondatais.isNotEmpty) {
      print(user.id);
      print(user.itemname);
    }
  }

  void storeUserData() {
    //store the user entered data in user object
    Fooditem user1 = Fooditem(widget.idnumber, quantity, widget.itemprice,
        widget.itemphoto, widget.itname);
    // encode / convert object into json string
    String user = jsonEncode(user1);
    savedatajson = user;
    print(savedatajson);
    
    //save the data into sharedPreferences using key-value pairs
    sharedPreferences.setString('userdata', savedatajson);
  }

  @override
  Widget build(BuildContext context) {
    return quantity == 0 //&& keys.isEmpty
        ? Container(
            height: 25,
            width: 80,
            child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                )),
                onPressed: () {
                  storeUserData();
                  print(widget.itemprice);

                  setState(() {
                    quantity = quantity + 1;
                  });
                },
                child: const Text('+ ADD')),
          )
        : Container(
            height: 31,
            width: 120,
            child: Column(
              children: [
                Text(
                  'Added To Cart',
                  style: TextStyle(color: Color.fromARGB(255, 3, 170, 9)),
                ),
                Text('Successfully')
              ],
            ));
  }
}
