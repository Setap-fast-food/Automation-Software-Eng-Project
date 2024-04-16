import 'Item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Order {
  List<Item> list;
  late String name;
  late num total;

  Order.create(this.list) {
    name = 'JoeBlogs';
    total = getTotal();
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
      order_List += value.name;
    }
    CollectionReference collRef =
        FirebaseFirestore.instance.collection('Orders');
    collRef.add({
      'name': name,
      'order': order_List,
      'price': total,
    });
  }
}
