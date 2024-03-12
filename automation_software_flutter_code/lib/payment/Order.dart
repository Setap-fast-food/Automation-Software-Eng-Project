
import 'Item.dart';

class Order {

  List<Item> list;
  late num total;

  Order.create(this.list) {
    total = getTotal();
  }

  num getTotal() {
    num t = 0;
    for (Item value in list) {
      t += (value.price * value.number);
    }
    return t;
  }
}