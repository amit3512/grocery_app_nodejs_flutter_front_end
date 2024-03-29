import 'package:flutter/material.dart';
import 'package:grocery_app/ApiCalls/api_calls.dart';
import 'package:grocery_app/pages/productDetails.dart';
import 'package:grocery_app/provider/order_data_provider.dart';
import 'package:provider/provider.dart';

import '../pages/login.dart';
import '../provider/user_data_provider.dart';

// import 'package:grocery_app/models/productModel.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  // final ani = const Product();
  // @override
  // void initState() {
  //   super.initState();
  //   ani.fetchCategoryData();
  // }
  @override
  void initState() {
    super.initState();
    var data = Provider.of<OrderDataProvider>(context, listen: false);
    data.fetchData(true);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiCalls().fetchProducts(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) debugPrint("$snapshot.error");
        return snapshot.hasData
            ? GridView.builder(
                itemCount: snapshot.data?.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (BuildContext context, int index) {
                  return SingleProduct(
                    prodId: snapshot.data![index].sId,
                    prodName: snapshot.data[index].name,
                    prodImage: snapshot.data[index].picture,
                    prodOldPrice: snapshot.data[index].oldPrice,
                    prodPrice: snapshot.data[index].price,
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
  final dynamic prodId;
  final dynamic prodName;
  final dynamic prodImage;
  final dynamic prodOldPrice;
  final dynamic prodPrice;

  const SingleProduct({
    Key? key,
    this.prodId,
    this.prodName,
    this.prodImage,
    this.prodOldPrice,
    this.prodPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<OrderDataProvider, UserDataProvider>(
        builder: (context, orderData, userData, child) {
      Map<String, dynamic> orderDetails = {};
      double grandTotal = 0.0;
      return Card(
        child: Hero(
          tag: prodId,
          child: Material(
            child: InkWell(
                onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductDetails(
                          productDetailId: prodId,
                          productDetailName: prodName,
                          productDetailImage: prodImage,
                          productDetailOldPrice: prodOldPrice,
                          productDetailPrice: prodPrice,
                        ),
                      ),
                    ),
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 5,
                        child: Image.network(
                          prodImage,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          prodName,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          // style: Theme.of(context).textTheme.body1,
                        ),
                      ),
                      Text("\$$prodPrice"),
                      Text(
                        "\$$prodOldPrice",
                        // "\$$prodId",
                        style: const TextStyle(
                            color: Colors.red,
                            decoration: TextDecoration.lineThrough),
                      ),
                      ElevatedButton(
                          child: Text('Add to cart'.toUpperCase(),
                              style: Theme.of(context)
                                  .textTheme
                                  .button
                                  ?.copyWith(
                                      color:
                                          Theme.of(context).primaryColorLight)),
                          onPressed: () => {
                                if (userData.isAuthenticated)
                                  {
                                    grandTotal =
                                        orderData.grandTotalPrice + prodPrice,
                                    orderDetails["productId"] = prodId,
                                    orderDetails["name"] = prodName,
                                    orderDetails["picture"] = prodImage,
                                    orderDetails["quantity"] =
                                        orderData.counter,
                                    orderDetails["prodPrice"] = prodPrice,
                                    orderDetails["totalPrice"] = grandTotal,
                                    orderData.add(orderDetails),
                                    if (orderData.added == true)
                                      {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text("$prodName Added"),
                                            backgroundColor: (Colors.lightBlue),
                                          ),
                                        ),
                                      }
                                  }
                                else
                                  {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return const AlertDialog(
                                              title: Text('Guest Information',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.red,
                                                    fontSize: 20.0,
                                                  )),
                                              contentPadding:
                                                  EdgeInsets.only(bottom: 20.0),
                                              content: Login()
                                              // Stack(
                                              //   // overflow: Overflow.visible,
                                              //   children: <Widget>[
                                              //     Positioned(
                                              //       right: -50.0,
                                              //       top: -50.0,
                                              //       child: InkResponse(
                                              //         onTap: () {
                                              //           Navigator.of(context).pop();
                                              //         },
                                              //         child:const CircleAvatar(
                                              //           child:  Icon(Icons.close),
                                              //           backgroundColor: Colors.red,
                                              //         ),
                                              //       ),
                                              //     ),
                                              //   ],
                                              // ),
                                              );
                                        })
                                  }
                              }),
                    ],
                  ),
                )
                // GridTile(
                //   footer: Container(
                //     color: Colors.white70,
                //     child: ListTile(
                //       leading: Text(
                //         prodName,
                //         style: const TextStyle(fontWeight: FontWeight.bold),
                //       ),
                //       title: Text("\$$prodPrice",
                //           style: const TextStyle(color: Colors.red)),
                //       subtitle: Text("\$$prodOldPrice",
                //           style: const TextStyle(
                //               color: Colors.black54,
                //               decoration: TextDecoration.lineThrough)),
                //     ),
                //   ),
                //   // child: Image.asset(prodImage),
                //   // child: Image.asset("images/a.jpg"),
                //   child: Image.network(prodImage),
                // ),
                ),
          ),
        ),
      );
    });
  }
}
