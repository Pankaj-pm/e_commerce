import 'package:e_commerce/util.dart';
import 'package:e_commerce/views/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? dropDownSelection;
  double slideValue = 0;
  RangeValues rangeValues = RangeValues(0.0, 0.0);

  List<Map<String, dynamic>> fList=productList.map((e) => e).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Home Page",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.shopping_cart, color: Colors.black),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton(
                  items: [
                    DropdownMenuItem(
                      child: Text("Smartphone"),
                      value: 0,
                    ),
                    DropdownMenuItem(
                      child: Text("Laptop"),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      child: Text("Fragrances"),
                      value: 2,
                    ),
                    DropdownMenuItem(
                      child: Text("SkinCare"),
                      value: 3,
                    ),
                    DropdownMenuItem(
                      child: Text("Groceries"),
                      value: 4,
                    ),
                    DropdownMenuItem(
                      child: Text("Home Decoration"),
                      value: 5,
                    ),
                  ],
                  onChanged: (val) {
                    dropDownSelection = val;
                    print("$val ${productList.length}");
                    Map<String,dynamic> item = productList[val??0];
                    fList.clear();
                    fList.add(item);
                    setState(() {});

                  },
                  hint: Text("Select category.."),
                  value: dropDownSelection,
                ),
              ),
              if (dropDownSelection != null)
                ActionChip(
                  label: Text("Clear"),
                  onPressed: () {
                    dropDownSelection = null;
                    fList=productList.map((e) => e).toList();
                    setState(() {});
                  },
                ),
            ],
          ),
          // Slider(
          //   value: slideValue,
          //   // var double
          //   max: 100,
          //   activeColor: Colors.red,
          //   thumbColor: Colors.blue,
          //   label: "${slideValue.toStringAsFixed(2)}",
          //   divisions: 100,
          //   onChanged: (value) {
          //     slideValue = value;
          //     setState(() {});
          //     print("Value $value");
          //   },
          // ),
          if (dropDownSelection != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text("From\n\$ 12555",textAlign: TextAlign.center,),
                  Expanded(
                    child: RangeSlider(
                      values: rangeValues,
                      onChanged: (value) {
                        rangeValues = value;
                        setState(() {});
                        print(value);
                      },
                    ),
                  ),
                  Text("To\n\$ 12",textAlign: TextAlign.center),
                ],
              ),
            ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: fList.map((e) {
                  String n = e["name"];
                  List<Map>? pl = e["product_list"] as List<Map>?;
                  print(pl?.length);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          n,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: (pl ?? []).map((e) {
                            return ProductWidget(
                              data: e,
                            );
                          }).toList(),
                        ),
                      )
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductWidget extends StatelessWidget {
  Map? data;

  ProductWidget({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    num? discount = data?["discount"];
    return InkWell(
      onTap: () {
        // Navigator.push(context, MaterialPageRoute(builder: (context) {
        //   return DetailPage(
        //     name: data?["name"],
        //     img: data?["imge"],
        //   );
        // }));

        // Navigator.pushNamed(context, "detailPage");

        //pass data to new screen using arguments
        List list = [data?["name"], data?["image"]]; // pass multiple value
        Navigator.pushNamed(context, "detailPage", arguments: list);
      },
      child: Container(
        height: 220,
        width: 150,
        margin: EdgeInsets.all(10),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.grey, offset: Offset(0.5, 0.5), blurRadius: 2)]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Image.network(
                    data?["image"] ?? "",
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.red, borderRadius: BorderRadius.only(bottomRight: Radius.circular(5))),
                    padding: EdgeInsets.all(3),
                    child: Text(
                      "${discount ?? 0}%",
                      style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            // Expanded(
            //   // child: Image(image: NetworkImage(data?["imge"] ?? ""))
            //   child: Image.asset(
            //     "asset/pic_2.png",
            //     color: Colors.red,
            //     height: 30,
            //     width: 20,
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data?["name"] ?? "",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${data?["price"] ?? 0}",
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                  RatingBarIndicator(
                    rating: double.parse("${data?["rating"] ?? 0}"),
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 17.0,
                    direction: Axis.horizontal,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProductModel {
  String? name;
  int? price;
}
