import 'package:flutter/material.dart';

class Purchase {
  final String itemname;
  final String description;
  final int quantity;
  final double price;
  final double discount;


  Purchase({
    @required this.itemname,
    @required this.description,
    @required this.quantity,
    @required this.price,
    @required this.discount,

  });
}
