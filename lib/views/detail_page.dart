import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  String? name;
  String? img;
  DetailPage({Key? key,this.name,this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List arguments =ModalRoute.of(context)?.settings.arguments as List;
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
          Image.network(arguments[1]),
          Text(arguments[0]),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);

        },
        child: Icon(Icons.add_shopping_cart),
      ),
    );
  }
}
