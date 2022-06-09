class ProductModel {
  final int id;
  final String name;
  final String picture;
  final int oldPrice;
  final int price;

  ProductModel(
    this.id,
    this.name,
    this.picture,
    this.oldPrice,
    this.price,
  );
  factory ProductModel.fromMap(Map<String, dynamic> json) {
    return ProductModel(json['id'], json['name'], json['picture'],
        json['oldPrice'], json['price']);
  }
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(json['id'], json['name'], json['picture'],
        json['oldPrice'], json['price']);
  }
}
