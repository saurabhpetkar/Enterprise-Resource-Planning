import 'package:flutter/material.dart';
import 'package:flutter_pagewise/flutter_pagewise.dart';
import '../../scoped_models/main.dart';
import '../../global_widgets/drawer.dart';
import 'dart:math' as math;
import 'package:http/http.dart' as http;
import 'package:transparent_image/transparent_image.dart';
import '../../models/event.dart';
import '../../models/purchase.dart';
import 'package:flutter_pagewise/flutter_pagewise.dart';


class SalesPage extends StatefulWidget {
  final MainModel model;

  SalesPage(this.model);

  @override
  State<StatefulWidget> createState() {
    return SalesPageState();
  }
}

class SalesPageState extends State<SalesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(context, widget.model.logout),
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: Hero(
          tag: 'Sales',
          child: Material(
            color: Colors.transparent,
            child: Text(
              'Sales',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: widget.model.isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : PagewiseListViewExample(widget.model.logout, widget.model.setPurchase),
    );
  }
}

class PagewiseListViewExample extends StatelessWidget {
  static const int PAGE_SIZE = 10;
  final double rad = 12;
  final Function logout;
  final Function setPurchase;


  PagewiseListViewExample(this.logout, this.setPurchase);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: PagewiseListView(
        pageSize: PAGE_SIZE,
        itemBuilder: this._itemBuilder,
        pageFuture: (pageIndex) =>
            BackendService.getPosts(pageIndex * PAGE_SIZE, PAGE_SIZE),
      ),
    );
  }

  void SetPurchase(Purchase purchase){
    setPurchase(purchase);
  }

  Widget _itemBuilder(context, Purchase entry, _) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 5, right: 2, left: 2),
          child: GestureDetector(
            onTap: () {
              SetPurchase(entry);
              Navigator.pushNamed(context, '/purchase-detail');
            },
            child: Container(
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(3),
                        child: Column(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.blueGrey.shade100,
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(2),
                                ),
                              ),
                              width: 40,
                              height: 20,
                              child: Center(
                                child: Text(
                                  entry.day,
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.greenAccent,
                                borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(2),
                                ),
                              ),
                              width: 40,
                              height: 20,
                              child: Center(
                                child: Text(
                                  entry.month,
                                  style: TextStyle(
                                      fontSize: 9, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: width - 84,
                            padding: EdgeInsets.symmetric(
                                vertical: 3, horizontal: 10),
                            child: Text(entry.product),
                          ),
                          Container(
                            width: width - 84,
                            padding: EdgeInsets.symmetric(
                                vertical: 3, horizontal: 10),
                            child: Text(
                              entry.buyer,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
//                  Divider(
//                    color: Colors.grey,
//                  )
                ],
              ),
              decoration: BoxDecoration(
//                color: Colors.yellow,
                border: Border(
                  bottom: BorderSide(color: Colors.grey.shade400),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}



class BackendService {
  static Future<List<Purchase>> getPosts(offset, limit) async {
    final responseBody = (await http.get(
        'http://jsonplaceholder.typicode.com/posts?_start=$offset&_limit=$limit'))
        .body;

    return data2;
  }
}

class JsonListToEventList {
  String title;
  String body;

  JsonListToEventList.fromJson(obj) {
    this.title = obj['title'];
    this.body = obj['body'];
  }

  static List<Purchase> fromJsonList(jsonList) {
    return jsonList
        .map<Purchase>((obj) => JsonListToEventList.fromJson(obj))
        .toList();
  }
}
//Container(
//              width: double.infinity,
//              decoration: BoxDecoration(
//                boxShadow: [
//                  BoxShadow(
//                    color: Colors.grey,
//                    offset: new Offset(10.0, 10.0),
//                    blurRadius: 20,
//                  )
//                ],
//                color: Colors.white,
//                borderRadius: BorderRadius.only(
//                  bottomRight: Radius.circular(rad),
//                  bottomLeft: Radius.circular(rad),
//                  topLeft: Radius.circular(rad),
//                  topRight: Radius.circular(rad),
//                ),
//              ),
//              child: Column(
//                crossAxisAlignment: CrossAxisAlignment.start,
//                children: <Widget>[
//                  Container(
//                    height: 250,
//                    child: Stack(
//                      children: [
//                        Align(
//                          child: Center(
//                            child: CircularProgressIndicator(
//                              backgroundColor: Colors.black54,
//                            ),
//                          ),
//                          alignment: Alignment(0.0, 0.0),
//                        ),
//                        Container(
//                          height: 250,
//                          child: ClipRRect(
//                            borderRadius: BorderRadius.only(
//                                topLeft: Radius.circular(rad),
//                                topRight: Radius.circular(rad)),
//                            child: Hero(
//                              tag: entry.title + 'image',
//                              child: FadeInImage.memoryNetwork(
//                                fit: BoxFit.fill,
//                                placeholder: kTransparentImage,
//                                image: entry.picture,
//                              ),
//                            ),
//                          ),
//                        ),
//                      ],
//                    ),
//                  ),
//                  Padding(
//                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
//                    child: Hero(
//                      tag: entry.title + 'title',
//                      child: Text(
//                        entry.title,
//                        style: TextStyle(
//                          fontWeight: FontWeight.w700,
//                          fontSize: 18,
//                        ),
//                      ),
//                    ),
//                  ),
//                ],
//              ),
//            ),

List<Purchase> data2 = [
  Purchase(product: 'shaving cream', quantity: 1, buyer: 'deepesh B', id: '1', seller: 'gelette', day: '1', month: 'DEC', year: '2019'),
  Purchase(product: 'One Plus 7', quantity: 1, buyer: 'Saurabh S P', id: '2', seller: 'One Plus', day: '2', month: 'DEC', year: '2019'),
  Purchase(product: 'Bhujiya', quantity: 1, buyer: 'Kalpa', id: '1', seller: 'food', day: '3', month: 'DEC', year: '2019'),
  Purchase(product: 'Chappal', quantity: 1, buyer: 'Akshay', id: '1', seller: 'paragon', day: '4', month: 'DEC', year: '2019'),
  Purchase(product: 'Laptop', quantity: 1, buyer: 'atul P', id: '1', seller: 'lenovo', day: '5', month: 'DEC', year: '2019'),
  Purchase(product: 'Ear phones', quantity: 1, buyer: 'Sid G', id: '1', seller: 'boat', day: '6', month: 'DEC', year: '2019'),
  Purchase(product: 'Honor', quantity: 1, buyer: 'Prerana', id: '1', seller: 'mobile', day: '7', month: 'DEC', year: '2019'),
  Purchase(product: 'Apologies', quantity: 1000000, buyer: 'Subu', id: '1', seller: 'Sorry Guys Brand', day: '8', month: 'DEC', year: '2019'),
  Purchase(product: 'Placements', quantity: 1, buyer: 'Director', id: '1', seller: 'good one', day: '9', month: 'DEC', year: '2019'),
  Purchase(product: 'Cholestroll', quantity: 1, buyer: 'Sukirti', id: '1', seller: 'KFCs', day: '10', month: 'DEC', year: '2019'),

];

