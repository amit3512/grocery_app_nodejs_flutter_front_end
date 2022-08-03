class OrderModel {
  String? sId;
  String? productId;
  String? name;
  String? picture;
  int? quantity;
  int? price;
  double? totalPrice;
  int? iV;

  // real_code
  OrderModel(
      {this.sId,
        this.productId,
        this.name,
        this.picture,
        this.quantity,
        this.price,
        this.totalPrice,
        this.iV});

//testing_code
//   OrderModel(orderDetails,
//       {this.sId,
//         this.productId,
//         this.name,
//         this.picture,
//         this.quantity,
//         this.price,
//         this.totalPrice,
//         this.iV});

  OrderModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    productId = json['productId'];
    name = json['name'];
    picture = json['picture'];
    quantity = json['quantity'];
    price = json['price'];
    totalPrice = json['totalPrice'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['productId'] = this.productId;
    data['name'] = this.name;
    data['picture'] = this.picture;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['totalPrice'] = this.totalPrice;
    data['__v'] = this.iV;
    return data;
  }
}
