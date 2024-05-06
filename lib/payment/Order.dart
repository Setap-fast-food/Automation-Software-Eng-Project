import 'Item.dart';
import 'package:flutter_test/flutter_test.dart';

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

  void main() async {
    group('All Tests of automation_software_eng_project', () {
      test(
          'getTotal() - total price should be displayed as items are being added to the order ',
              () {
            List<Item> data = [
              Item.create(
                  'Food1',
                  'https://pic1.zhimg.com/v2-36f3a88e38fbb666f7499970ee352c30_r.jpg',
                  'food describe',
                  2.5,
                  1),
              Item.create(
                  'Food2',
                  'https://img1.qunarzz.com/travel/poi/1504/74/5ba799767d759.jpg_720x300x95_bc513f62.jpg',
                  'food describe',
                  2.5,
                  1),
              Item.create(
                  'Food3',
                  'https://pic3.zhimg.com/v2-2b5a3ef5358d2569fd74b09ca1480c93_720w.jpg?source=172ae18b',
                  'food describe',
                  2.5,
                  1),
              Item.create(
                  'Food4',
                  'https://ts1.cn.mm.bing.net/th/id/R-C.bff2d511a661'
                      'eee2fa1a1449f121ade3?rik=qpJHbZUAaV15vA&riu=http%3a%2f%2fcp2.douguo.net%2fupload%2fcaiku'
                      '%2fb%2fe%2fd%2fyuan_bea82077b8d2f392c9b8d1aae175f20d.jpeg&ehk=%2bw%2f98yHTyQLXU8XD4%2fAHeO1VK'
                      '53jtjBd7pb9y1pnts0%3d&risl=&pid=ImgRaw&r=0',
                  'food describe',
                  2.5,
                  1),
              Item.create(
                  'Food5',
                  'https://ts1.cn.mm.bing.net/th/id/R-C.9b585c1dddaf1bd0de5a26ebfeeaf65b?rik=QX2%2f'
                      'Kw2IscWmKw&riu=http%3a%2f%2fa4.att.hudong.com%2f23%2f39%2f19300001307480131316395585847.jpg&eh'
                      'k=Gv5XcJd9CUvI6HT9GodaS8j95TstxcUJhZUcF0CGTmY%3d&risl=&pid=ImgRaw&r=0',
                  'food describe',
                  2.5,
                  1),
              Item.create(
                  'Food6',
                  'https://img1.qunarzz.com/travel/poi/1504/74/5ba799767d759.jpg_720x300x95_bc513f62.jpg',
                  'food describe',
                  2.5,
                  1),
              Item.create(
                  'Food7',
                  'https://ts1.cn.mm.bing.net/th/id/R-C.6199fe2964303a1b0b8f3a104fafa5ea?rik=xu1%2'
                      'fdUYq7QtJuQ&riu=http%3a%2f%2fi2.chuimg.com%2f7708ade2876c11e6b87c0242ac110003_3216w_2136h.jpg%3fi'
                      'mageView2%2f2%2fw%2f660%2finterlace%2f1%2fq%2f90&ehk=LqcvevFTztwJ3MMnsTpjREl8b7dEvO4fK9pqYQO%2bxUo%3'
                      'd&risl=&pid=ImgRaw&r=0&sres=1&sresct=1',
                  'food describe',
                  2.5,
                  1),
              Item.create(
                  'Food8',
                  'https://tse4-mm.cn.bing.net/th/id/OIP-C.QsKfWD30J1eFvFU9_lR3WwAAAA?rs=1&pid=ImgDetMain',
                  'food describe',
                  2.5,
                  1),
            ];
            Order order = Order.create(data);
            expect(order.getTotal(), 20);
          });
    });
}
}
