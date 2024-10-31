import 'dart:convert';

import 'package:hive/hive.dart';

part 'product.g.dart';


List<Product> popularProductListFromJson(String val) =>
    List<Product>.from(json.decode(val)['data']
        .map((product) => Product.popularProductFromJson(product))
    );



@HiveType(typeId: 3)
class Product {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final List<String> images;


  Product(
      {required this.id,
      required this.name,
      required this.description,
      required this.images});


  factory Product.popularProductFromJson(Map<String, dynamic> data) => Product(
      id: data['id'],
      name: data['product']['name'],
      description: data['product']['description'],
      images: List<String>.from(data['product']['images']
          .map((image) => image['url'])),
  );

  factory Product.productFromJson(Map<String, dynamic> data) => Product(
      id: data['id'],
      name: data['attributes']['name'],
      description: data['attributes']['description'],
      images: List<String>.from(data['attributes']['images']['data']
          .map((image) => image['attributes']['url'])),
  );
}
