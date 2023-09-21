import 'package:e_commerce/util.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  String? name;
  String? img;
  DetailPage({Key? key,this.name,this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String,dynamic>? arguments =ModalRoute.of(context)?.settings.arguments as Map<String,dynamic>?;
    print(" build data $arguments");

    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Page"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.shopping_cart),
          )
        ],
      ),
      body: Column(
        children: [
          Image.network(arguments?["image"]??""),
          Text(arguments?["name"]??""),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if(arguments!=null){
            cardList.add(arguments);
          }
          Navigator.pop(context);
        },
        child: Icon(Icons.add_shopping_cart),
      ),
    );
  }
}
