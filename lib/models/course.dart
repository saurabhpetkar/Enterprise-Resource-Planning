import 'package:flutter/material.dart';

class Course {
  final String title;
  final String author;
  final double price;
  final double before_discount;
  final int videos;
  final String about;
  final dynamic content;
  final String pic;


  Course({
    @required this.title,
    @required this.author,
    @required this.price,
    @required this.before_discount,
    @required this.videos,
    @required this.about,
    @required this.content,
    @required this.pic,

  });
}
