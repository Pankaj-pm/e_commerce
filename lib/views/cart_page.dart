import 'package:e_commerce/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double price = 0;

  @override
  void initState() {
    super.initState();
    findTotal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart Page",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: cardList.map((e) {
                  return Container(
                    height: 120,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10, offset: Offset(2, 2))]),
                    child: Row(
                      children: [
                        Image.network(
                          e["image"],
                          width: 100,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${e["name"]}",
                                  style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "\$ ${e["price"]}",
                                  style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () {
                                    cardList.remove(e);
                                    findTotal();
                                    setState(() {});
                                  },
                                  child: Text("Delete",
                                      style: TextStyle(color: Colors.red, decoration: TextDecoration.underline)),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(13),
            color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Tota price",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text(
                  "\$ $price",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void findTotal() {
    price=0;
    cardList.forEach((element) {
      var ep = element["price"];
      num p = num.parse("$ep");
      price = price + p;
      print(p);
    });
    print(price);
  }
}
