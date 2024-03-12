import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';
import 'dart:async';

class Order {
  String orderId;
  String customerName;
  List<String> items;

  Order(this.orderId, this.customerName, this.items);
}

abstract class OrderManager {
  Future<Order> getOrder(String orderId);
  Future<void> editOrder(
      String orderId, String customerName, List<String> items);
}

class OrderManagerImpl implements OrderManager {
  final PostgreSQLConnection _connection;

  OrderManagerImpl(this._connection);

  @override
  Future<Order> getOrder(String orderId) async {
    List<List<dynamic>> results = await _connection.query(
      'SELECT * FROM orders WHERE order_id = @orderId',
      substitutionValues: {'orderId': orderId},
    );

    if (results.isNotEmpty) {
      var order = results.first;
      return Order(order[0].toString(), order[1].toString(),
          (order[2] as List<dynamic>).map((item) => item.toString()).toList());
    } else {
      return null;
    }
  }

  @override
  Future<void> editOrder(
      String orderId, String customerName, List<String> items) async {
    await _connection.query(
      'UPDATE orders SET customer_name = @customerName, items = @items WHERE order_id = @orderId',
      substitutionValues: {
        'orderId': orderId,
        'customerName': customerName,
        'items': items,
      },
    );
  }
}

Future<void> main() async {
//   final conn = await Connection.open(
//   Endpoint(
//     host: host,
//     database: database)
//  )

  final connection = PostgreSQLConnection(
      'localhost', 5432, 'your_database_name',
      username: 'your_username', password: 'your_password');

  await connection.open();

  var orderManager = OrderManagerImpl(connection);

  // Get order Example
  var order = await orderManager.getOrder('1');
  if (order != null) {
    print('Order details:');
    print('Order ID: ${order.orderId}');
    print('Customer Name: ${order.customerName}');
    print('Items: ${order.items}');
  } else {
    print('Order not found.');
  }

  // Edit order example
  await orderManager.editOrder('1', 'Jane Smith', ['Item3', 'Item4']);
  order = await orderManager.getOrder('1');
  if (order != null) {
    print('\nUpdated Order details:');
    print('Order ID: ${order.orderId}');
    print('Customer Name: ${order.customerName}');
    print('Items: ${order.items}');
  } else {
    print('Order not found.');
  }

  await connection.close();
}

// void main () async {
//  final conn = await Connection.open(
//   Endpoint(
//     host: host,
//     database: database)
//  )

// }
