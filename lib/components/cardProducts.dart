import 'package:flutter/material.dart';
import 'package:grocery_app/models/productModel.dart';
import 'package:grocery_app/provider/category_data_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:provider/provider.dart';
//
// class CartProducts extends StatefulWidget {
//   const CartProducts({Key? key}) : super(key: key);
//
//   @override
//   State<CartProducts> createState() => _CartProductsState();
// }
//
// class _CartProductsState extends State<CartProducts> {
//   // List<Map<String, Object>> productList = [
//   //   {
//   //     "name": "Camera 1",
//   //     "picture": "images/products/a.jpg",
//   //     "price": 85,
//   //     "size": "M",
//   //     "color": "Red",
//   //     "quantity": 1
//   //   },
//   //   {
//   //     "name": "Camera 2",
//   //     "picture": "images/products/b.jpg",
//   //     "price": 85,
//   //     "size": "M",
//   //     "color": "Blue",
//   //     "quantity": 12
//   //   },
//   //   {
//   //     "name": "Camera 3",
//   //     "picture": "images/products/c.jpg",
//   //     "price": 85,
//   //     "size": "M",
//   //     "color": "Green",
//   //     "quantity": 10
//   //   },
//   // ];
//
//   List<ProductModel> parseProducts(String responseBody) {
//     final parsed = json.decode(responseBody).cast<String, dynamic>();
//     print(parsed["data"]);
//     return parsed["data"]
//         .map<ProductModel>((json) => ProductModel.fromJson(json))
//         .toList();
//   }
//
//   Future<List<ProductModel>> fetchProducts() async {
//     final response =
//         await http.get(Uri.parse('http://10.0.2.2:4000/api/category'));
//     // var data = jsonDecode(response.body)["data"].toString();
//     if (response.statusCode == 200) {
//       // print(data);
//       // return data;
//       return parseProducts(response.body);
//     } else {
//       throw Exception('Unable to fetch products from the REST API');
//     }
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     fetchProducts();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<ProductModel>>(
//         future: fetchProducts(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) print("what the fuck $snapshot.error");
//           return snapshot.hasData
//               ? ListView.builder(
//                   itemCount: snapshot.data?.length,
//                   itemBuilder: (context, index) {
//                     return SingleCartProduct(
//                       cartProdName: snapshot.data![index].name,
//                       cartProdPic: snapshot.data![index].picture,
//                       cartProdPrice: snapshot.data![index].price,
//                       // cartProdSize: productList[index]["size"],
//                       // cartProdColor: productList[index]["color"],
//                       // cartProdQuantity: productList[index]["quantity"],
//                     );
//                   },
//                 )
//               : const Center(child: CircularProgressIndicator());
//         }
//
//         // child: ListView.builder(
//         //     itemCount: productList.length,
//         //     itemBuilder: (context, index) {
//         //       return SingleCartProduct(
//         //         cartProdName: productList[index]["name"],
//         //         cartProdPic: productList[index]["picture"],
//         //         cartProdPrice: productList[index]["price"],
//         //         cartProdSize: productList[index]["size"],
//         //         cartProdColor: productList[index]["color"],
//         //         cartProdQuantity: productList[index]["quantity"],
//         //       );
//         //     }),
//         );
//   }
// }
//
// class SingleCartProduct extends StatelessWidget {
//   final cartProdName;
//   final cartProdPic;
//   final cartProdPrice;
//   // final cartProdSize;
//   // final cartProdColor;
//   // final cartProdQuantity;
//
//   const SingleCartProduct({
//     Key? key,
//     this.cartProdName,
//     this.cartProdPic,
//     this.cartProdPrice,
//     // this.cartProdSize,
//     // this.cartProdColor,
//     // this.cartProdQuantity,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: ListTile(
//         leading: Image.asset(
//           // cartProdPic,
//           "images/a.jpg",
//           width: 80.0,
//           height: 80.0,
//         ),
//         title: Text(cartProdName),
//         subtitle: Text(
//           "\$$cartProdPrice",
//           style: const TextStyle(
//               color: Colors.red, fontSize: 17.0, fontWeight: FontWeight.bold),
//         ),
//         trailing: SizedBox(
//           width: 72.0,
//           child: Row(
//               // mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 IconButton(
//                     onPressed: () {}, icon: const Icon(Icons.add_circle)),
//                 const Text(
//                   "1",
//                   textAlign: TextAlign.center,
//                 ),
//                 Expanded(
//                   child: IconButton(
//                       onPressed: () {}, icon: const Icon(Icons.remove_circle)),
//                 ),
//               ]),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:grocery_app/models/productModel.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
class CartProducts extends StatefulWidget {
  const CartProducts({Key? key}) : super(key: key);

  @override
  State<CartProducts> createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryDataProvider>(
      builder: (context, value, child) => Scaffold(
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: ListView.builder(
              itemCount: value.lst.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.horizontal,
                  background: Container(
                    color: Colors.red,
                  ),
                  onDismissed: (direction) {
                    value.del(index);
                  },
                  child: SingleCartProduct(
                    // screenSize: screenSize,
                    cartProdId: value.lst[index].sId,
                    cartProdPic: value.lst[index].picture,
                    cartProdName: value.lst[index].name,
                    cartProdPrice: value.lst[index].price,

                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class SingleCartProduct extends StatelessWidget {
  final  cartProdId;
  final  cartProdName;
  final  cartProdPic;
  final  cartProdPrice;

  const SingleCartProduct({
    Key? key,
    required this.cartProdId,
    required this.cartProdName,
    required this.cartProdPic,
    required this.cartProdPrice,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(
          cartProdPic,
          // "images/a.jpg",
          width: 80.0,
          height: 80.0,
        ),
        title: Text(cartProdName),
        subtitle: Text(
          "\$$cartProdPrice",
          style: const TextStyle(
              color: Colors.red, fontSize: 17.0, fontWeight: FontWeight.bold),
        ),
        trailing: SizedBox(
          width: 72.0,
          child: Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.add_circle)),
                const Text(
                  "1",
                  textAlign: TextAlign.center,
                ),
                Expanded(
                  child: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.remove_circle)),
                ),
              ]),
        ),
      ),
    );
  }
}
