import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foodapp/iteminfo.dart';

import 'package:foodapp/main.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:collection/collection.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'button.dart';

class Mycarditem extends StatefulWidget {
  Mycarditem({
    Key? key,
  }) : super(key: key);

  @override
  State<Mycarditem> createState() => _MycarditemState();
}

class _MycarditemState extends State<Mycarditem> {
  late SharedPreferences sharedPreferences;
  var user;
  @override
  void initState() {
    //widgetholder1 = firstwidget();
    super.initState();
    Map<String, dynamic> jsondatais =
        jsonDecode(sharedPreferences.getString('userdata')!);
     user = Fooditem.fromJson(jsondatais);
     
     
  }
  
  

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Your Cart'),
          centerTitle: true,
          backgroundColor: Colors.pink),
      body: Column(
        children: [
          // ValueListenableBuilder(
          //   valueListenable: user
          //   builder: (context, Box<ItemModal> todos, _) {
          //     List<int> keys = todos.keys.cast<int>().toList();

          //     if (keys.isEmpty) {
          //       return Column(
          //         crossAxisAlignment: CrossAxisAlignment.stretch,
          //         children: [
          //           const SizedBox(
          //             height: 170,
          //           ),
          //           Column(children: [
          //             Container(
          //               width: 350,
          //               height: 350,
          //               child: Image.asset('assets/images/cart3.png'),
          //             ),
          //             const SizedBox(
          //               height: 10,
          //             ),
          //           ]),
          //         ],
          //       );
          //     }

          //     return Column(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         Container(
          //           height: 470,
          //           child: ListView.separated(
          //             itemBuilder: (_, index) {
          //               final int key = keys[index];
          //               final ItemModal todo = todos.get(key) as ItemModal;
          //               print(todo.qty);

          //               return ListTile(
          //                 title: Row(
          //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                   children: [
          //                     Column(
          //                       crossAxisAlignment: CrossAxisAlignment.start,
          //                       children: [
          //                         Padding(
          //                           padding: const EdgeInsets.only(bottom: 8),
          //                           child: Text(todo.itemname,
          //                               style: TextStyle(
          //                                 color: Colors.green[800],
          //                                 fontSize: 18,
          //                                 fontWeight: FontWeight.bold,
          //                               )),
          //                         ),
          //                         Text('Qnt :${todo.qty}'),
          //                       ],
          //                     ),
          //                     Container(
          //                       width: 86,
          //                       height: 70,
          //                       child: Image.asset(todo.itemimage),
          //                     ),
          //                     Text('Price:'),
          //                     Text('Rs ${todo.price}'),
          //                     PopupMenuButton(
          //                       onSelected: (item) {
          //                         todos.deleteAt(index);
          //                       },
          //                       itemBuilder: (context) {
          //                         return [
          //                           PopupMenuItem(
          //                             value: 'delete',
          //                             child: Text('Delete'),
          //                           ),
          //                         ];
          //                       },
          //                     ),
          //                   ],
          //                 ),
          //                 subtitle: Row(
          //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                   children: [
          //                     Text('Item Id:${todo.id}'),
          //                     Container(
          //                         height: 25,
          //                         width: 120,
          //                         child: Row(
          //                           children: [
          //                             FloatingActionButton(
          //                               onPressed: () {
          //                                 setState(() {
          //                                   todo.qty -= 1;
          //                                 });
          //                               },
          //                               tooltip: 'Decrement',
          //                               child: Icon(Icons.horizontal_rule),
          //                             ),
          //                             Text('${todo.qty}'),
          //                             FloatingActionButton(
          //                               onPressed: () {
          //                                 setState(() {
          //                                   todo.qty += 1;
          //                                 });
          //                               },
          //                               tooltip: 'Increment',
          //                               child: Icon(Icons.add),
          //                             )
          //                           ],
          //                         ))
          //                   ],
          //                 ),
          //               );
          //             },
          //             separatorBuilder: (_, index) => Divider(
          //               color: Colors.deepPurple[200],
          //             ),
          //             itemCount: keys.length,
          //             shrinkWrap: true,
          //           ),
          //         ),
          //         Column(
          //           children: [
          //             Padding(
          //               padding: const EdgeInsets.symmetric(horizontal: 17),
          //               child: Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                 children: [
          //                   Text(
          //                     'Items Purchased :',
          //                     style: TextStyle(
          //                         fontSize: 20, fontWeight: FontWeight.bold),
          //                   ),
          //                   Text('Amount :',
          //                       style: TextStyle(
          //                           fontSize: 20, fontWeight: FontWeight.bold))
          //                 ],
          //               ),
          //             ),
          //             Container(
          //               color: Colors.yellow[100],
          //               height: 150,
          //               child: ListView.builder(
          //                 itemBuilder: (_, index1) {
          //                   final int key = keys[index1];
          //                   final ItemModal todo = todos.get(key) as ItemModal;
          //                   print(todo.qty);
          //                   double total = (todo.qty) * (todo.price);
          //                   return Container(
          //                     height: 30,
          //                     child: ListTile(
          //                       title: Row(
          //                         mainAxisAlignment:
          //                             MainAxisAlignment.spaceBetween,
          //                         children: [
          //                           Text(todo.itemname),
          //                           Row(
          //                             children: [Text(' Rs'), Text('$total')],
          //                           ),
          //                         ],
          //                       ),
          //                     ),
          //                   );
          //                 },
          //                 scrollDirection: Axis.vertical,
          //                 shrinkWrap: true,
          //                 itemCount: keys.length,
          //               ),
          //             ),
          //             Container(
          //               color: Colors.amber,
          //               height: 30,
          //               child: ListView.builder(

          //                 itemBuilder: (_, index2) {

          //                   final int key = keys[index2];
          //                   final ItemModal todo = todos.get(key) as ItemModal;
          //                   print(todo.qty);
          //                   List<double> a = [];
          //                   for (index2 = 0; index2 < keys.length; index2++) {
          //                     double total = (todo.qty) * (todo.price);
          //                     a.add(total);

          //                     print(a);
          //                   }
          //                   var total1 =
          //                       a.reduce((value, element) => value + element);

          //                   print('total Amount is :$total1');
          //                   double totalamount = 0.00;
          //                   return Container(
          //                     height: 45,
          //                     child: ListTile(
          //                       title: Column(
          //                         children: [
          //                           Row(
          //                             crossAxisAlignment:
          //                                 CrossAxisAlignment.start,
          //                             mainAxisAlignment:
          //                                 MainAxisAlignment.spaceBetween,
          //                             children: [
          //                               Text(
          //                                 'Total Amount :',
          //                                 style: TextStyle(
          //                                     fontSize: 20,
          //                                     fontWeight: FontWeight.bold),
          //                               ),
          //                               Row(
          //                                 children: [
          //                                   Text(' Rs'),
          //                                   Text('$total1')
          //                                 ],
          //                               ),
          //                             ],
          //                           ),
          //                         ],
          //                       ),
          //                     ),
          //                   );
          //                 },
          //                 scrollDirection: Axis.vertical,
          //                 shrinkWrap: true,
          //                 itemCount: keys.length,
          //               ),
          //             ),
          //           ],
          //         )
          //       ],
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
