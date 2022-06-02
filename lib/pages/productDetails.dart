import "package:flutter/material.dart";

class ProductDetails extends StatefulWidget {
  final productDetailName;
  final productDetailImage;
  final productDetailOldPrice;
  final productDetailPrice;

  const ProductDetails(
      {Key? key,
      this.productDetailName,
      this.productDetailImage,
      this.productDetailOldPrice,
      this.productDetailPrice})
      : super(key: key);

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
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(widget.productDetailName,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0)),
                  title: Row(
                    children: [
                      Expanded(
                        child: Text("\$${widget.productDetailOldPrice}",
                            style: const TextStyle(
                                decoration: TextDecoration.lineThrough)),
                      ),
                      Expanded(
                        child: Text(
                          "\$${widget.productDetailPrice}",
                          style: const TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(children: [
            Expanded(
              child: MaterialButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Size"),
                          content: const Text("Choose Size"),
                          actions: [
                            MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                              child: const Text("Close"),
                            )
                          ],
                        );
                      });
                },
                color: Colors.white,
                textColor: Colors.grey,
                child: Row(
                  children: const [
                    Expanded(
                      child: Text(
                        "Size",
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.indigo),
                      ),
                    ),
                    Expanded(
                      child: Icon(Icons.arrow_drop_down),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: MaterialButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Color"),
                          content: const Text("Choose a Color"),
                          actions: [
                            MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                              child: const Text("Close"),
                            )
                          ],
                        );
                      });
                },
                color: Colors.white,
                textColor: Colors.grey,
                child: Row(
                  children: const [
                    Expanded(
                      child: Text(
                        "Color",
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.indigo),
                      ),
                    ),
                    Expanded(
                      child: Icon(Icons.arrow_drop_down),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: MaterialButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Quantity"),
                          content: const Text("Choose the Quantity"),
                          actions: [
                            MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                              child: const Text("Close"),
                            )
                          ],
                        );
                      });
                },
                color: Colors.white,
                textColor: Colors.grey,
                child: Row(
                  children: const [
                    Expanded(
                      child: Text(
                        "Qty",
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.indigo),
                      ),
                    ),
                    Expanded(
                      child: Icon(Icons.arrow_drop_down),
                    ),
                  ],
                ),
              ),
            ),
          ]),
          Row(children: [
            Expanded(
              child: MaterialButton(
                  onPressed: () {},
                  color: Colors.red,
                  textColor: Colors.white,
                  elevation: 0.2,
                  child: const Text("Buy Now")),
            ),
            const IconButton(
              onPressed: null,
              icon: Icon(
                Icons.add_shopping_cart,
                color: Colors.red,
              ),
            ),
            const IconButton(
              onPressed: null,
              icon: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            ),
          ]),
          const Divider(),
          const ListTile(
            title: Text("Product Details"),
            subtitle: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
          ),
          const Divider(),
          Row(children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
              child: Text("Product Name :"),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(widget.productDetailName),
            ),
          ]),
          Row(children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
              child: Text("Product Brand :"),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(widget.productDetailName),
            ),
          ]),
          Row(children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
              child: Text("Product Condition :"),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(widget.productDetailName),
            ),
          ])
        ],
      ),
    );
  }
}
