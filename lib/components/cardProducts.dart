import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/category_data_provider.dart';
import '../provider/order_data_provider.dart';

class CartProducts extends StatefulWidget {
  const CartProducts({Key? key}) : super(key: key);

  @override
  State<CartProducts> createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  @override
  void initState() {
    var data = Provider.of<CategoryDataProvider>(context, listen: false);
    data.fetchProductData(true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final categoryProvider =
        Provider.of<CategoryDataProvider>(context, listen: false);
    double grandTotal = 0.0;
    return Consumer<OrderDataProvider>(
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
                    dynamic priceToReduce = value.lst[index].price;
                    grandTotal = value.grandTotalPrice - priceToReduce ;
                    value.del(index,grandTotal);
                  },
                  child: SingleCartProduct(
                    // screenSize: screenSize,
                    cartProdId: value.lst[index].productId,
                    cartProdPic: value.lst[index].picture,
                    cartProdName: value.lst[index].name,
                    cartProdQuantity: value.lst[index].quantity,
                    cartProdPrice: value.lst[index].price,
                    prodPrice: categoryProvider.data
                        ?.where((x) => x.sId == value.lst[index].productId)
                        .first
                        .price,
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
  final cartProdId;
  final cartProdName;
  final cartProdPic;
  final cartProdPrice;
  final prodPrice;
  final cartProdQuantity;

  const SingleCartProduct({
    Key? key,
    required this.cartProdId,
    required this.cartProdName,
    required this.cartProdPic,
    required this.cartProdPrice,
    required this.prodPrice,
    required this.cartProdQuantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderDataProvider>(builder: (context, orderData, child) {
      Map<String, dynamic> orderDetails = {};
      double grandTotal = 0.0;
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
            "\$" + cartProdPrice.toString(),
            style: const TextStyle(
                color: Colors.red, fontSize: 17.0, fontWeight: FontWeight.bold),
          ),
          trailing: SizedBox(
            width: 72.0,
            child: Row(
// mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        grandTotal = orderData.grandTotalPrice + prodPrice;
                        orderDetails["productId"] = cartProdId;
                        orderDetails["name"] = cartProdName;
                        orderDetails["picture"] = cartProdPic;
                        orderDetails["quantity"] = cartProdQuantity;
                        orderDetails["price"] = cartProdPrice;
                        orderDetails["totalPrice"] = grandTotal;
                        orderDetails["prodPrice"] = prodPrice;
                        orderData.add(orderDetails);
                      },
                      icon: const Icon(Icons.add_circle)),
                  Text(
                    cartProdQuantity.toString(),
                    textAlign: TextAlign.center,
                  ),
                  Expanded(
                    child: IconButton(
                        onPressed: () {
                          grandTotal = orderData.grandTotalPrice - prodPrice;
                          orderDetails["productId"] = cartProdId;
                          orderDetails["name"] = cartProdName;
                          orderDetails["picture"] = cartProdPic;
                          orderDetails["quantity"] = cartProdQuantity;
                          orderDetails["price"] = cartProdPrice;
                          orderDetails["totalPrice"] = grandTotal;
                          orderDetails["prodPrice"] = prodPrice;
                          orderData.remove(orderDetails);
                        },
                        icon: const Icon(Icons.remove_circle)),
                  ),
                ]),
          ),
        ),
      );
    });
  }
}
