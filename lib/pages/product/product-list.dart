import 'package:flutter/material.dart';
import '../../scoped_models/main.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import '../../global_widgets/drawer.dart';

class ProductListPage extends StatefulWidget {
  final MainModel model;

  ProductListPage(this.model);

  @override
  State<StatefulWidget> createState() {
    return ProductListPageState();
  }
}

class ProductListPageState extends State<ProductListPage> {
  List<Map<String, dynamic>> _products = [];
  bool isloading = true;
  @override
  void initState() {
    GetProducts();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(context, widget.model.logout, widget.model),
      appBar: AppBar(
        title: Text('Products'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body:
      isloading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Scrollbar(
                      child: ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          return ButtonTheme(
                            minWidth: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 3.0, right: 0.0, bottom: 1),
                              child: RaisedButton(
                                elevation: 1,
                                color: Colors.white,
                                onPressed: () {
                                  Navigator.pushNamed(context, '/product-detail');
                                },
                                child: Align(
                                  alignment: Alignment(-1, 0),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 1),
                                    child: Text(
                                      _products[index]['name'],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: _products.length,
                      ),
                    )




    );
  }

  GetProducts() async {

    setState(() {
      isloading = true;
    });
    http.Response response = await http.get('http://jsonplaceholder.typicode.com/posts?_start=10&_limit=3');

    _products = [
      {'name': 'some name1', 'description': 'some description', 'quantity': 10, 'cost': 34.499, 'id': 1},
      {'name': 'some name2', 'description': 'some description', 'quantity': 10, 'cost': 34.499, 'id': 2},
      {'name': 'some name3', 'description': 'some description', 'quantity': 10, 'cost': 34.499, 'id': 3},
      {'name': 'some name4', 'description': 'some description', 'quantity': 10, 'cost': 34.499, 'id': 4},
      {'name': 'some name5', 'description': 'some description', 'quantity': 10, 'cost': 34.499, 'id': 5},
      {'name': 'some name6', 'description': 'some description', 'quantity': 10, 'cost': 34.499, 'id': 6},
      {'name': 'some name7', 'description': 'some description', 'quantity': 10, 'cost': 34.499, 'id': 7},
      {'name': 'some name8', 'description': 'some description', 'quantity': 10, 'cost': 34.499, 'id': 8},
      {'name': 'some name9', 'description': 'some description', 'quantity': 10, 'cost': 34.499, 'id': 9},
      {'name': 'some name0', 'description': 'some description', 'quantity': 10, 'cost': 34.499, 'id': 10},
    ];

    setState(() {
      isloading = false;
    });

  }
}


//      SafeArea(
//        child: ScopedModel<MainModel>(
//          model: new MainModel(),
//          child: ScopedModelDescendant<MainModel>(
//            builder: (context, child, model) {
//              return model.isLoading
//                  ? Center(
//                      child: CircularProgressIndicator(),
//                    )
//                  : Scrollbar(
//                      child: ListView.builder(
//                        itemBuilder: (BuildContext context, int index) {
//                          return ButtonTheme(
//                            height: 40,
//                            minWidth: double.infinity,
//                            child: Padding(
//                              padding: const EdgeInsets.only(
//                                  left: 8.0, right: 8.0, top: 4, bottom: 2),
//                              child: FlatButton(
//                                onPressed: () {},
//                                child: Text(
//                                  widget.model.products[index]['name'],
//                                ),
//                              ),
//                            ),
//                          );
//                        },
//                        itemCount: widget.model.products.length,
//                      ),
//                    );
//            },
//          ),
//        ),
//      ),
