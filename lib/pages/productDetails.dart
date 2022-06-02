import "package:flutter/material.dart";

class ProductDetails extends StatefulWidget {
  final productDetailName;
  final  productDetailImage;
  final  productDetailOldPrice;
  final  productDetailPrice;


  const ProductDetails({Key? key,this.productDetailName,this.productDetailImage,this.productDetailOldPrice,this.productDetailPrice}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Grocery App"),
        actions: const [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: null,
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: null,
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 300.0,
            child: GridTile(
child: Container(
  color: Colors.white70,
  child: Image.asset(widget.productDetailImage),
),
            ),
          )
        ],
      ),
    );
  }
}