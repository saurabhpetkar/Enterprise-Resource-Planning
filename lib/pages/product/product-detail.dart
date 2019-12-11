import 'package:flutter/material.dart';
import '../../scoped_models/main.dart';
import 'package:http/http.dart' as http;
import '../../global_widgets/drawer.dart';

class ProductDetailPage extends StatefulWidget {
  final MainModel model;

  ProductDetailPage(this.model);

  @override
  State<StatefulWidget> createState() {
    return ProductDetailPageState();
  }
}

class ProductDetailPageState extends State<ProductDetailPage> {
  Map<String, dynamic> _product;
  bool isloading = true;

  @override
  void initState() {
    GetProduct(widget.model.selectedProductId);
    super.initState();
  }

  TextStyle attr = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
  TextStyle content = TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.w500,
    color: Color(0xff333333),
  );

  @override  
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(context, widget.model.logout, widget.model),
      appBar: AppBar(
        title: Text('Product'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: isloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Scrollbar(
              child: ListView(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              child: Text(
                                'Name',
                                style: attr,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              child: Text(
                                _product['name'],
                                style: content,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              child: Text(
                                'Cost',
                                style: attr,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              child: Text(
                                _product['cost'].toString()+ ' \$',
                                style: content,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              child: Text(
                                'Quantity',
                                style: attr,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              child: Text(
                                _product['quantity'].toString(),
                                style: content,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Text(
                          'Description',
                          style: attr,
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                        child: Text(
                          _product['description'],
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }

  GetProduct(int index) async {
    setState(() {
      isloading = true;
    });
    http.Response response = await http
        .get('http://jsonplaceholder.typicode.com/posts?_start=10&_limit=3');

    _product = {
      'name': 'some name0',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'quantity': 10,
      'cost': 34.499,
      'id': 10
    };

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
