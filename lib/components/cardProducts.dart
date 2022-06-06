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
        leading: Image.asset(
          cartProdPic,
          width: 80.0,
          height: 80.0,
        ),
        title: Text(cartProdName),
        subtitle: Column(
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Text("Size"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(cartProdSize),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                  child: Text("Coor"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    cartProdColor,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "\$$cartProdPrice",
                style: const TextStyle(
                    color: Colors.red,
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        trailing: Column(
          children: [
            Expanded(
              child: Padding(
                padding:  const EdgeInsets.only(top:0.0),
                child: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.arrow_drop_up)),
              ),
            ),
             Text("$cartProdQuantity"),
            Expanded(
              child: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.arrow_drop_down)),
            )
          ],
        ),
      ),
    );
  }
}
