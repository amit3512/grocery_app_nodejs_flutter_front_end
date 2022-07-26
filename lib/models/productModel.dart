// class ProductModel {
//   final String _id;
//   final String name;
//   final String picture;
//   final int oldPrice;
//   final int price;
//
//   ProductModel(
//      this._id,
//     this.name,
//     this.picture,
//     this.oldPrice,
//     this.price,
//   );
//   factory ProductModel.fromMap(Map<String, dynamic> json) {
//     return ProductModel(json['_id'], json['name'], json['picture'],
//         json['oldPrice'], json['price']);
//   }
//   factory ProductModel.fromJson(Map<String, dynamic> json) {
//     return ProductModel(json['_id'], json['name'], json['picture'],
//         json['oldPrice'], json['price']);
//   }
// }

class ProductModel {
  String? sId;
  String? name;
  String? picture;
  int? oldPrice;
  int? price;
  int? iV;

  ProductModel(
      {this.sId, this.name, this.picture, this.oldPrice, this.price, this.iV});

  ProductModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    picture = json['picture'];
    oldPrice = json['oldPrice'];
    price = json['price'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['picture'] = this.picture;
    data['oldPrice'] = this.oldPrice;
    data['price'] = this.price;
    data['__v'] = this.iV;
    return data;
  }
}
