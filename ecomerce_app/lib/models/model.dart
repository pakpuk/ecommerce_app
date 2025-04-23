class Product {
  int? _totalsize;
  int? _offset;
  int? _tyopeId;
  late List<ProductModel> _products;
  List<ProductModel> get products => _products;

  Product(
      {required totalesize,
      required offset,
      required tyopeId,
      required products}) {
    _totalsize = totalesize;
    _offset = offset;
    _tyopeId = tyopeId;
    _products = products;
  }
  Product.FromJson(Map<String, dynamic> json) {
    _totalsize = json['_totalSize'];
    _offset = json['_offset'];
    _tyopeId = json['_tyopeId'];
    if (json['_products'] != null) {
      _products = <ProductModel>[];
      json["_products"].forEach((v) {
        _products.add(ProductModel.fromJson(v));
      });
    }
  }
}

class ProductModel {
  int? id;
  String? name;
  String? description;
  String? img;
  String? location;
  String? createdat;
  String? upladedat;
  int? price;
  int? typeid;

  ProductModel(
      {this.createdat,
      this.name,
      this.description,
      this.img,
      this.location,
      this.upladedat,
      this.price,
      this.typeid});
  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    img = json['img'];
    location = json['location'];
    createdat = json['createdAt'];
    upladedat = json['uploadedAt'];
    price = json['price'];
    typeid = json['typeId'];
  }
}
