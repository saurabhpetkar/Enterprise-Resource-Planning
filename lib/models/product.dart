import 'package:flutter/material.dart';

class Product {
  final String name;
  final String description;
  final int quantity;
  final double cost;
  final double discount;


  Product({
    @required this.name,
    @required this.description,
    @required this.quantity,
    @required this.cost,
    @required this.discount,

  });
}
