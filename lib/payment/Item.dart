
class Item {

  final String name;
  final String url;
  final String describe;
  final num price;
  num number;
  num subtotal;

  Item.create(this.name, this.url, this.describe, this.price, this.number)
      : subtotal = price * number;

  num getSubtotal() {
    return price * number;
  }
}