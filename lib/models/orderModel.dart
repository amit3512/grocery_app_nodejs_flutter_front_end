class OrderModel {
  String? userId;
  String? userName;
  String? userEmail;
  int? userContact;
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
      {
        this.userId,
        this.userName,
        this.userEmail,
        this.userContact,
        this.sId,
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
    userId = json['user_id'];
    userName = json['user_name'];
    userEmail = json['user_email'];
    userContact = json['user_contact'];
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
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['user_email'] = this.userEmail;
    data['user_contact'] = this.userContact;
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
