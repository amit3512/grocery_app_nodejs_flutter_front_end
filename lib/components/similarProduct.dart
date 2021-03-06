import 'package:flutter/material.dart';
import 'package:grocery_app/pages/productDetails.dart';
// import 'package:grocery_app/components/products.dart';
import 'package:grocery_app/constants/apiService.dart';

class SimilarProduct extends StatefulWidget {
  const SimilarProduct({Key? key}) : super(key: key);

  @override
  State<SimilarProduct> createState() => _SimilarProductState();
}

class _SimilarProductState extends State<SimilarProduct> {
  final ani = const Product();
  @override
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
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ani.fetchCategoryData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ani.fetchCategoryData(),
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? GridView.builder(
                itemCount: snapshot.data.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (BuildContext context, int index) {
                  return SimilarSingleProduct(
                    // prodName: productList[index]["name"],
                    // prodImage: productList[index]["picture"],
                    // prodOldPrice: productList[index]["old_price"],
                    // prodPrice: productList[index]["price"],
                    prodName: snapshot.data[index].name,
                    prodImage: snapshot.data[index].picture,
                    prodOldPrice: snapshot.data[index].oldPrice,
                    prodPrice: snapshot.data[index].price,
                  );
                },
              )
            : const CircularProgressIndicator();
      },
      // child: GridView.builder(
      //   itemCount: productList.length,
      //   gridDelegate:
      //   const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      //   itemBuilder: (BuildContext context, int index) {
      //     return SimilarSingleProduct(
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

class SimilarSingleProduct extends StatelessWidget {
  final dynamic prodName;
  final dynamic prodImage;
  final dynamic prodOldPrice;
  final dynamic prodPrice;

  const SimilarSingleProduct({
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
              child: Image.network(prodImage),
            ),
          ),
        ),
      ),
    );
  }
}
