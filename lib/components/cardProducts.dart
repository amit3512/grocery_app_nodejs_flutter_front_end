import 'package:flutter/material.dart';
import 'package:grocery_app/models/productModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CartProducts extends StatefulWidget {
  const CartProducts({Key? key}) : super(key: key);

  @override
  State<CartProducts> createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  // List<Map<String, Object>> productList = [
  //   {
  //     "name": "Camera 1",
  //     "picture": "images/products/a.jpg",
  //     "price": 85,
  //     "size": "M",
  //     "color": "Red",
  //     "quantity": 1
  //   },
  //   {
  //     "name": "Camera 2",
  //     "picture": "images/products/b.jpg",
  //     "price": 85,
  //     "size": "M",
  //     "color": "Blue",
  //     "quantity": 12
  //   },
  //   {
  //     "name": "Camera 3",
  //     "picture": "images/products/c.jpg",
  //     "price": 85,
  //     "size": "M",
  //     "color": "Green",
  //     "quantity": 10
  //   },
  // ];

  List<ProductModel> parseProducts(String responseBody) {
    final parsed = json.decode(responseBody).cast<String, dynamic>();
    print(parsed["data"]);
    return parsed["data"]
        .map<ProductModel>((json) => ProductModel.fromJson(json))
        .toList();
  }

  Future<List<ProductModel>> fetchProducts() async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:4000/api/category'));
    // var data = jsonDecode(response.body)["data"].toString();
    if (response.statusCode == 200) {
      // print(data);
      // return data;
      return parseProducts(response.body);
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductModel>>(
        future: fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print("what the fuck $snapshot.error");
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return SingleCartProduct(
                      cartProdName: snapshot.data![index].name,
                      cartProdPic: snapshot.data![index].picture,
                      cartProdPrice: snapshot.data![index].price,
                      // cartProdSize: productList[index]["size"],
                      // cartProdColor: productList[index]["color"],
                      // cartProdQuantity: productList[index]["quantity"],
                    );
                  },
                )
              : const Center(child: CircularProgressIndicator());
        }

        // child: ListView.builder(
        //     itemCount: productList.length,
        //     itemBuilder: (context, index) {
        //       return SingleCartProduct(
        //         cartProdName: productList[index]["name"],
        //         cartProdPic: productList[index]["picture"],
        //         cartProdPrice: productList[index]["price"],
        //         cartProdSize: productList[index]["size"],
        //         cartProdColor: productList[index]["color"],
        //         cartProdQuantity: productList[index]["quantity"],
        //       );
        //     }),
        );
  }
}

class SingleCartProduct extends StatelessWidget {
  final cartProdName;
  final cartProdPic;
  final cartProdPrice;
  // final cartProdSize;
  // final cartProdColor;
  // final cartProdQuantity;

  const SingleCartProduct({
    Key? key,
    this.cartProdName,
    this.cartProdPic,
    this.cartProdPrice,
    // this.cartProdSize,
    // this.cartProdColor,
    // this.cartProdQuantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(
          // cartProdPic,
          "images/a.jpg",
          width: 80.0,
          height: 80.0,
        ),
        title: Text(cartProdName),
        subtitle: Column(
          children: [
            Row(
              children: [
                // const Padding(
                //   padding: EdgeInsets.all(0.0),
                //   child: Text("Size"),
                // ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Text(cartProdSize),
                // ),
                // const Padding(
                //   padding: EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                //   child: Text("Coor"),
                // ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Text(
                //     cartProdColor,
                //     style: const TextStyle(color: Colors.red),
                //   ),
                // ),
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
                padding: const EdgeInsets.only(top: 0.0),
                child: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.arrow_drop_up)),
              ),
            ),
            // Text("$cartProdQuantity"),
            Text("cartProdQuantity"),

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
