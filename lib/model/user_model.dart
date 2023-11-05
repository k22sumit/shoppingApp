class UserModel {
  String? sId;
  String? name;
  String? email;
  String? password;
  String? address;
  String? type;
  String? token;
  List<dynamic>? cart;

  UserModel(
      {this.sId,
      this.name,
      this.email,
      this.password,
      this.address,
      this.type,
      this.token,
      this.cart});

  UserModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    address = json['address'];
    type = json['type'];
    token = json['token'];
    cart = json['cart'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = sId;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['address'] = address;
    data['type'] = type;
    data['token'] = token;
    data['cart'] = cart;
    return data;
  }

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? address,
    String? type,
    String? token,
    List<dynamic>? cart,
  }) {
    return UserModel(
      sId: id ?? sId,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      address: address ?? this.address,
      type: type ?? this.type,
      token: token ?? this.token,
      cart: cart ?? this.cart,
    );
  }

}
