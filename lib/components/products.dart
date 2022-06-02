import 'package:flutter/material.dart';
import 'package:grocery_app/pages/productDetails.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  List<Map<String, Object>> productList = [
    {
      "name": "Camera 1",
      "picture": "images/products/a.jpg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Camera 2",
      "picture": "images/products/b.jpg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Camera 3",
      "picture": "images/products/c.jpg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Camera 4",
      "picture": "images/products/a.jpg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Camera 5",
      "picture": "images/products/b.jpg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Camera 6",
      "picture": "images/products/c.jpg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Camera 4",
      "picture": "images/products/a.jpg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Camera 5",
      "picture": "images/products/b.jpg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Camera 6",
      "picture": "images/products/c.jpg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Camera 4",
      "picture": "images/products/a.jpg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Camera 5",
      "picture": "images/products/b.jpg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Camera 6",
      "picture": "images/products/c.jpg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Camera 4",
      "picture": "images/products/a.jpg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Camera 5",
      "picture": "images/products/b.jpg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Camera 6",
      "picture": "images/products/c.jpg",
      "old_price": 120,
      "price": 85,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: productList.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return SingleProduct(
          prodName: productList[index]["name"],
          prodImage: productList[index]["picture"],
          prodOldPrice: productList[index]["old_price"],
          prodPrice: productList[index]["price"],
        );
      },
    );
  }
}

class SingleProduct extends StatelessWidget {
  final dynamic prodName;
  final dynamic prodImage;
  final dynamic prodOldPrice;
  final dynamic prodPrice;

  const SingleProduct({
    Key? key,
    required this.prodName,
    required this.prodImage,
    required this.prodOldPrice,
    required this.prodPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: "Test",
        child: Material(
          child: InkWell(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>  ProductDetails(
                  productDetailName: prodName,
                  productDetailImage: prodImage,
                  productDetailOldPrice: prodOldPrice,
                  productDetailPrice: prodPrice,
                ))),
            child: GridTile(
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(
                    prodName,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  title: Text("\$$prodPrice",
                      style: const TextStyle(color: Colors.red)),
                  subtitle: Text("\$$prodOldPrice",
                      style: const TextStyle(
                          color: Colors.black54,
                          decoration: TextDecoration.lineThrough)),
                ),
              ),
              child: Image.asset(prodImage),
            ),
          ),
        ),
      ),
    );
  }
}
