import 'Item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Order {
  List<Item> list;
  late String name;
  late num total;
  late String status;

  Order.create(this.list) {
    name = 'JoeBlogs';
    total = getTotal();
    status = 'completed';
  }

  num getTotal() {
    num t = 0;
    for (Item value in list) {
      t += (value.price * value.number);
    }
    return t;
  }

  void placeOrder() {
    String order_List = '';
    for (Item value in list) {
      if (value.number > 0) {
        String quantity = ('${value.number} X ${value.name}, ');
        order_List += quantity;
      }
    }

    CollectionReference collRef =
        FirebaseFirestore.instance.collection('Orders');
    collRef.add({
      'name': name,
      'order': order_List,
      'price': total,
      'status': status,
    });
  }
}
