import 'package:flutter/material.dart';

class CartProducts extends StatefulWidget {
  const CartProducts({Key? key}) : super(key: key);

  @override
  State<CartProducts> createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  List<Map<String, Object>> productList = [
    {
      "name": "Camera 1",
      "picture": "images/products/a.jpg",
      "price": 85,
      "size": "M",
      "color": "Red",
      "quantity": 1
    },
    {
      "name": "Camera 2",
      "picture": "images/products/b.jpg",
      "price": 85,
      "size": "M",
      "color": "Blue",
      "quantity": 12
    },
    {
      "name": "Camera 3",
      "picture": "images/products/c.jpg",
      "price": 85,
      "size": "M",
      "color": "Green",
      "quantity": 10
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: productList.length,
        itemBuilder: (context, index) {
          return SingleCartProduct(
            cartProdName: productList[index]["name"],
            cartProdPic: productList[index]["picture"],
            cartProdPrice: productList[index]["price"],
            cartProdSize: productList[index]["size"],
            cartProdColor: productList[index]["color"],
            cartProdQuantity: productList[index]["quantity"],
          );
        });
  }
}

class SingleCartProduct extends StatelessWidget {
  final cartProdName;
  final cartProdPic;
  final cartProdPrice;
  final cartProdSize;
  final cartProdColor;
  final cartProdQuantity;
  const SingleCartProduct({
    Key? key,
    this.cartProdName,
    this.cartProdPic,
    this.cartProdPrice,
    this.cartProdSize,
    this.cartProdColor,
    this.cartProdQuantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(cartProdName),
        subtitle: Column(
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Size"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(cartProdSize),
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}
