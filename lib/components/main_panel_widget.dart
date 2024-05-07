import 'package:automation_software_flutter_code/payment/Order.dart';

import 'order_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_test/flutter_test.dart';

import 'main_panel_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

int _orderIdCounter = 0; // Initialize a counter
String flag = 'active';

class MainPanelWidget extends StatefulWidget {
  const MainPanelWidget({Key? key}) : super(key: key);

  @override
  State<MainPanelWidget> createState() => _MainPanelWidgetState();
}

class _MainPanelWidgetState extends State<MainPanelWidget> {
  late MainPanelModel _model;

  var collection = FirebaseFirestore.instance
      .collection('Orders')
      .where('status', isEqualTo: 'active');
  var collection1 = FirebaseFirestore.instance
      .collection('Orders')
      .where('status', isEqualTo: 'completed');
  late List<Map<String, dynamic>> items;
  bool isLoaded = false;

  _incrementCounter() async {
    List<Map<String, dynamic>> tempList = [];
    var data = await collection.get();
    var completedData = await collection1.get();

    if (flag == 'active') {
      data.docs.forEach((element) {
        tempList.add(element.data());
      });
    } else {
      completedData.docs.forEach((element) {
        tempList.add(element.data());
      });
    }

    setState(() {
      items = tempList;
      isLoaded = true;
    });
  }

  @override
  void initState() {
    super.initState();
    _model = Provider.of<MainPanelModel>(context, listen: false);
    _model.rebuildCallback = () {
      setState(() {}); // Trigger rebuild when callback is called
    };
    _model.initState(context);
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  // Function to generate unique orderId (id for referencing when removing)
  int _generateOrderId() {
    return _orderIdCounter++;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pending Orders'),
      ),
      body: Container(
          height: double.infinity,
          child: isLoaded
              ? ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(width: 2),
                              borderRadius: BorderRadius.circular(20)),
                          leading: const CircleAvatar(
                            backgroundColor: Color(0xff6ae792),
                            child: Icon(Icons.person),
                          ),
                          title: Row(
                            children: [
                              Text(items[index]['name']),
                              SizedBox(
                                width: 10,
                              ),
                              Text(items[index]['order'])
                            ],
                          ),
                        ));
                  })
              : Text('No Data')),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
