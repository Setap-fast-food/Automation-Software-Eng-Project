import 'order_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';

import 'main_panel_widget.dart';

class MainPanelModel extends FlutterFlowModel<MainPanelWidget> {
  late OrderBarModel orderBarModel;

  List<OrderData> orderDataList = [];

  // Callback function to trigger a rebuild
  void Function() rebuildCallback = () {};

  void initState(BuildContext context) {
    orderBarModel = createModel(context, () => OrderBarModel());
  }

  void dispose() {
    orderBarModel.dispose();
  }

  void addOrderData(OrderData orderData) {
    orderDataList.add(orderData);
    rebuildCallback(); // Trigger the rebuild
  }


}

class OrderData {
  final String orderNumText;
  final String timePlacedText;
  final int orderId;

  OrderData({
    required this.orderNumText,
    required this.timePlacedText,
    required this.orderId,
  });
  
}
