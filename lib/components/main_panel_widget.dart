import '/components/order_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main_panel_model.dart';

int _orderIdCounter = 0; // Initialize a counter

class MainPanelWidget extends StatefulWidget {
  const MainPanelWidget({Key? key}) : super(key: key);

  @override
  State<MainPanelWidget> createState() => _MainPanelWidgetState();
}

class _MainPanelWidgetState extends State<MainPanelWidget> {
  late MainPanelModel _model;

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

  // Function to add new OrderBarWidget
  void _addNewOrder() {
    int orderID = _generateOrderId(); // Generate unique orderId
    _model.addOrderData(OrderData(
      orderId: orderID,
      orderNumText: 'Placeholder',
      timePlacedText: '00:00',
    ));
  }

  



  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Color(0x4C776AED),
      ),
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          scrollbars: true, // show the scrollbar
        ),
        child: ListView(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < _model.orderDataList.length; i++)
                  OrderBarWidget(
                    key: ValueKey(_model.orderDataList[i].orderId),
                    orderId: _model.orderDataList[i].orderId,
                    orderNumText: _model.orderDataList[i].orderNumText,
                    timePlacedText: _model.orderDataList[i].timePlacedText,
                    onDonePressed: () {
                      setState(() {
                        _model.orderDataList.removeAt(i);
                      });
                    },
                  ),
                ElevatedButton(
                  onPressed: _addNewOrder, // Call the function to add new OrderBarWidget
                  child: Text('Add New Order'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
