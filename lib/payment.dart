import 'package:flutter/material.dart';
import 'Order.dart';
import 'Item.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Center(
              child: Text(title,
                  style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white))),
        ),
        body: const Row(children: [
          SizedBox(width: 200),
          Expanded(child: ItemList()),
          SizedBox(width: 200),
        ]));
  }
}

class ItemList extends StatefulWidget {
  const ItemList({super.key});

  @override
  State<StatefulWidget> createState() => _ItemListState();
}

List<Item> data = [
  Item.create(
      'Food1',
      'https://pic1.zhimg.com/v2-36f3a88e38fbb666f7499970ee352c30_r.jpg',
      'food describe',
      2.5,
      0),
  Item.create(
      'Food2',
      'https://img1.qunarzz.com/travel/poi/1504/74/5ba799767d759.jpg_720x300x95_bc513f62.jpg',
      'food describe',
      2.5,
      0),
  Item.create(
      'Food3',
      'https://pic3.zhimg.com/v2-2b5a3ef5358d2569fd74b09ca1480c93_720w.jpg?source=172ae18b',
      'food describe',
      2.5,
      0),
  Item.create(
      'Food4',
      'https://ts1.cn.mm.bing.net/th/id/R-C.bff2d511a661'
          'eee2fa1a1449f121ade3?rik=qpJHbZUAaV15vA&riu=http%3a%2f%2fcp2.douguo.net%2fupload%2fcaiku'
          '%2fb%2fe%2fd%2fyuan_bea82077b8d2f392c9b8d1aae175f20d.jpeg&ehk=%2bw%2f98yHTyQLXU8XD4%2fAHeO1VK'
          '53jtjBd7pb9y1pnts0%3d&risl=&pid=ImgRaw&r=0',
      'food describe',
      2.5,
      0),
  Item.create(
      'Food5',
      'https://ts1.cn.mm.bing.net/th/id/R-C.9b585c1dddaf1bd0de5a26ebfeeaf65b?rik=QX2%2f'
          'Kw2IscWmKw&riu=http%3a%2f%2fa4.att.hudong.com%2f23%2f39%2f19300001307480131316395585847.jpg&eh'
          'k=Gv5XcJd9CUvI6HT9GodaS8j95TstxcUJhZUcF0CGTmY%3d&risl=&pid=ImgRaw&r=0',
      'food describe',
      2.5,
      0),
  Item.create(
      'Food6',
      'https://img1.qunarzz.com/travel/poi/1504/74/5ba799767d759.jpg_720x300x95_bc513f62.jpg',
      'food describe',
      2.5,
      0),
  Item.create(
      'Food7',
      'https://ts1.cn.mm.bing.net/th/id/R-C.6199fe2964303a1b0b8f3a104fafa5ea?rik=xu1%2'
          'fdUYq7QtJuQ&riu=http%3a%2f%2fi2.chuimg.com%2f7708ade2876c11e6b87c0242ac110003_3216w_2136h.jpg%3fi'
          'mageView2%2f2%2fw%2f660%2finterlace%2f1%2fq%2f90&ehk=LqcvevFTztwJ3MMnsTpjREl8b7dEvO4fK9pqYQO%2bxUo%3'
          'd&risl=&pid=ImgRaw&r=0&sres=1&sresct=1',
      'food describe',
      2.5,
      0),
  Item.create(
      'Food8',
      'https://tse4-mm.cn.bing.net/th/id/OIP-C.QsKfWD30J1eFvFU9_lR3WwAAAA?rs=1&pid=ImgDetMain',
      'food describe',
      2.5,
      0),
];

class _ItemListState extends State<ItemList> {
  Order order = Order.create(data);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
          flex: 2,
          child: Container(
              margin: const EdgeInsets.only(top: 20),
              decoration: const BoxDecoration(
                border: Border.fromBorderSide(
                  BorderSide(width: 0.3, color: Colors.grey),
                ),
              ),
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: order.list.map((value) {
                  return Container(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 0.5, color: Colors.grey),
                        ),
                      ),
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 170,
                            height: 170,
                            child: Image.network(value.url, fit: BoxFit.cover),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: [
                                      Text(value.name,
                                          maxLines: 2,
                                          style: const TextStyle(
                                              fontSize: 25,
                                              color: Colors.black)),
                                      const SizedBox(width: 150),
                                      Text(value.describe,
                                          maxLines: 2,
                                          style: const TextStyle(
                                              fontSize: 15,
                                              color: Colors.black)),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Stack(
                                    children: <Widget>[
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text("Price: £ ${value.price}",
                                            style: const TextStyle(
                                                fontSize: 25,
                                                color: Colors.red)),
                                      ),
                                      const Align(
                                        alignment: Alignment.centerRight,
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Row(children: [
                                    Container(
                                      width: 168,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 2, color: Colors.black12)),
                                      child: Row(
                                        children: <Widget>[
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                if (value.number > 0) {
                                                  value.number--;
                                                }
                                                order.total = order.getTotal();
                                                value.subtotal =
                                                    value.getSubtotal();
                                              });
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              width: 45,
                                              height: 45,
                                              child: const Text("-",
                                                  style: TextStyle(
                                                      fontSize: 25,
                                                      color: Colors.black)),
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            width: 70,
                                            decoration: const BoxDecoration(
                                                border: Border(
                                              left: BorderSide(
                                                  width: 2,
                                                  color: Colors.black12),
                                              right: BorderSide(
                                                  width: 2,
                                                  color: Colors.black12),
                                            )),
                                            height: 45,
                                            child: Text("${value.number}",
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black)),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                value.number++;
                                                order.total = order.getTotal();
                                                value.subtotal =
                                                    value.getSubtotal();
                                              });
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              width: 45,
                                              height: 45,
                                              child: const Text("+",
                                                  style: TextStyle(
                                                      fontSize: 25,
                                                      color: Colors.black)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 50),
                                    Text("Subtotal: £ ${value.subtotal}",
                                        maxLines: 2,
                                        style: const TextStyle(
                                            fontSize: 15, color: Colors.red)),
                                  ]),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ));
                }).toList(),
              ))),
      Expanded(
          flex: 1,
          child: Row(children: [
            Expanded(
              flex: 1,
              child: Text(
                'Total: ${order.total}',
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Expanded(
                flex: 1,
                child: Center(
                  child: MaterialButton(
                    height: 50,
                    minWidth: 150,
                    color: Theme.of(context).colorScheme.primary,
                    onPressed: () {},
                    autofocus: true,
                    child: const Text(
                      'Pay',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ))
          ])),
    ]);
  }
}
