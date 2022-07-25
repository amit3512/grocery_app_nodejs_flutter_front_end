import 'package:flutter/material.dart';
import 'package:grocery_app/pages/productDetails.dart';
import 'package:grocery_app/constants//apiService.dart';
import 'package:provider/provider.dart';

import '../provider/category_data_provider.dart';
// import 'package:grocery_app/models/productModel.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  final ani = const Product();


  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   ani.fetchCategoryData();
  // }
  @override
  void initState() {
    var data = Provider.of<CategoryDataProvider>(context, listen: false);
    data.fetchData(true);
    super.initState();
  }

  // List<Map<String, Object>> productList = [
  //   {
  //     "name": "Camera 1",
  //     "picture": "images/products/a.jpg",
  //     "old_price": 120,
  //     "price": 85,
  //   },
  // ];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ani.fetchCategoryData(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) debugPrint("$snapshot.error");
        return snapshot.hasData
            ? GridView.builder(
                itemCount: snapshot.data?.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (BuildContext context, int index) {
                  return SingleProduct(
                    prodName: snapshot.data[index].name,
                    prodImage: snapshot.data[index].picture,
                    prodOldPrice: snapshot.data[index].oldPrice,
                    prodPrice: snapshot.data[index].price,
                    // prodName: productList[index]["name"],
                    // prodImage: productList[index]["picture"],
                    // prodOldPrice: productList[index]["old_price"],
                    // prodPrice: productList[index]["price"],
                  );
                },
              )
            : const Center(child: CircularProgressIndicator());
      },
      // child: GridView.builder(
      //   itemCount: productList.length,
      //   gridDelegate:
      //       const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      //   itemBuilder: (BuildContext context, int index) {
      //     return SingleProduct(
      //       prodName: productList[index]["name"],
      //       prodImage: productList[index]["picture"],
      //       prodOldPrice: productList[index]["old_price"],
      //       prodPrice: productList[index]["price"],
      //     );
      //   },
      // ),
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
    this.prodName,
    this.prodImage,
    this.prodOldPrice,
    this.prodPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryDataProvider>(builder: (context, data, child){
    return Card(
      child: Hero(
        tag: "Test",
        child: Material(
          child: InkWell(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProductDetails(
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
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  title: Text("\$$prodPrice",
                      style: const TextStyle(color: Colors.red)),
                  subtitle: Text("\$$prodOldPrice",
                      style: const TextStyle(
                          color: Colors.black54,
                          decoration: TextDecoration.lineThrough)),
                ),
              ),
              // child: Image.asset(prodImage),
              // child: Image.asset("images/a.jpg"),
              child: Image.network(prodImage),
            ),
          ),
        ),
      ),
    );
  });
}}
