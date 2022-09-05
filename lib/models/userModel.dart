class UserModel {
  String? name;
  String? userId;
  String? email;
  int? contact;
  String? role;
  String? slug;
  String? token;

  UserModel({
    this.name,
    this.userId,
    this.email,
    this.contact,
    this.role,
    this.slug,
    this.token,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    userId = json['user_id'];
    email = json['email'];
    contact = json['contact'];
    role = json['role'];
    slug = json['slug'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['user_id'] = this.userId;
    data['email'] = this.email;
    data['contact'] = this.contact;
    data['role'] = this.role;
    data['slug'] = this.slug;
    data['token'] = this.token;

    return data;
  }
}
