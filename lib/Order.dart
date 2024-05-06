import 'Item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';

class Order {
  List<Item> list;
  late String name;
  late num total;
  late String status;

  Order.create(this.list) {
    name = 'JoeBlogs';
    total = getTotal();
    status = 'active';
  }

  num getTotal() {
    num t = 0;
    for (Item value in list) {
      t += (value.price * value.number);
    }
    return t;
  }

  Future placeOrder(test) async {
    String order_List = '';
    for (Item value in list) {
      if (value.number > 0) {
        String quantity = ('${value.number} X ${value.name}, ');
        order_List += quantity;
      }
    }
    /*
    THE FOLLOWING SECTION MUST REMAIN THE SAME BAR THE WORD "FAKE"
    AND SYNTAX "INSTANCE" IN ORDER FOR TESTING TO BE ACCURATE
    */
    if (test) {
      CollectionReference collRef =
          FakeFirebaseFirestore().collection('Orders');
      await collRef.add({
        'name': name,
        'order': order_List,
        'price': total,
        'status': status,
      });
      return 'Test Success';
    } else {
      CollectionReference collRef =
          FirebaseFirestore.instance.collection('Orders');
      await collRef.add({
        'name': name,
        'order': order_List,
        'price': total,
        'status': status,
      });
      print(
          'Test Not Completed - FirebaseFirestore invoked instead of FakeFirebaseFirestore. FirebaseFireStore cannot be used in testing');
    }
  }
}
