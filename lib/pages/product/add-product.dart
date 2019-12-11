import 'package:flutter/material.dart';
import '../../scoped_models/main.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../models/product.dart';
import 'package:string_validator/string_validator.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../global_widgets/drawer.dart';

class AddProduct extends StatefulWidget {
  final MainModel model;

  AddProduct(this.model);

  @override
  State<StatefulWidget> createState() {
    return AddProductPage();
  }
}

class AddProductPage extends State<AddProduct> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  TextEditingController _name = TextEditingController();
  TextEditingController _description = TextEditingController();
  TextEditingController _quantity = TextEditingController();
  TextEditingController _cost = TextEditingController();
  TextEditingController _discount = TextEditingController();
  TextEditingController _code = TextEditingController();

  void submit() async {
    Map<String, dynamic> product = {
      'itemname': _name.text,
      'itemcode': _code.text,
      'description': _description.text,
      'quantity': int.parse(_quantity.text),
      'price': double.parse(_cost.text),
      'discount': double.parse(_discount.text)
    };

    String link = 'http://' + '10.0.51.119:8000' + '/sales/restproduct/';
    http.Response response = await http.post(
      link,
      body: json.encode(product),
      headers: {'Content-Type': 'application/json'},
    );
    print('status \n\n');
//    var data = json.decode(response.body);
    print(response.body);

    if (response.body.toString() == "true")
      _showSuccessBox();
    else
      _showtrylaterbox();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(context, widget.model.logout, widget.model),
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('Add Product'),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              NameField(),
              DescriptionField(),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: QuantityField(),
                  ),
                  Expanded(
                    flex: 1,
                    child: CostField(),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: CodeField(),
                  ),
                  Expanded(
                    flex: 1,
                    child: DiscountField(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomNavBar(),
    );
  }

  Widget CostField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
      child: TextFormField(
        controller: _cost,
        keyboardType: TextInputType.numberWithOptions(
          signed: false,
          decimal: false,
        ),
        decoration: InputDecoration(hintText: 'Cost'),
        validator: (value) {
          if (value.length == 0)
            return 'Cant leave it empty';
          else if (value == 0) return "Can't have 0 cost";
          return null;
        },
      ),
    );
  }

  Widget DiscountField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
      child: TextFormField(
        controller: _discount,
        keyboardType: TextInputType.numberWithOptions(
          signed: false,
          decimal: false,
        ),
        decoration: InputDecoration(hintText: 'DIscount'),
        validator: (value) {
          if (value.length == 0)
            return 'Cant leave it empty';
          else if (double.parse(value) >= double.parse(_cost.text))
            return "Discount can't be more than the cost";
          return null;
        },
      ),
    );
  }

  Widget QuantityField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
      child: TextFormField(
        controller: _quantity,
        keyboardType: TextInputType.numberWithOptions(
          signed: false,
          decimal: false,
        ),
        decoration: InputDecoration(hintText: 'Quantity'),
        validator: (value) {
          print(value.runtimeType);
          if (value.length == 0)
            return 'Cant leave it empty';
          else if (value == 0) return "Can't have 0 quantity";
          else if(value.toString().contains('.')) return "Can't be a floating value";
//          else if(isFloat(value)) return "It can't be a floating value";
          return null;
        },
      ),
    );
  }

  void _showSuccessBox() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Product Added"),
          content: new Text("Product added successfully"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showtrylaterbox() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Error"),
          content: new Text("Couldn't add the product, please try later."),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget DescriptionField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextFormField(
        controller: _description,
        minLines: 5,
        maxLines: 10,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: 'Description',
          focusColor: Colors.lightGreenAccent,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
        ),
        validator: (value) {
          if (value.length == 0)
            return 'Cant leave it empty';
          else if (value.length < 5) return "Need more information";
          return null;
        },
      ),
    );
  }

  Widget NameField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
      child: TextFormField(
        controller: _name,
        //new password
        keyboardType: TextInputType.text,
        decoration: InputDecoration(hintText: 'Name'),
        validator: (value) {
          if (value.length == 0) return 'Cant leave it empty';
          return null;
        },
      ),
    );
  }

  Widget CodeField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
      child: TextFormField(
        controller: _code,
        //new password
        keyboardType: TextInputType.text,
        decoration: InputDecoration(hintText: 'Name Code'),
        validator: (value) {
          if (value.length == 0) return 'Cant leave it empty';
          return null;
        },
      ),
    );
  }

  void AreYouSure() {
    if (this._formKey.currentState.validate()) {
      _formKey.currentState.save(); // Save our form now.
      _showComfirmDialog();
    }
  }

  void _showComfirmDialog() {
    // flutter defined function
    // send a new password to the user's email.
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Are you sure?"),
          content: new Text("A new product will be added to your company."),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text(
                "No",
                style: TextStyle(
                  color: Color(0xFF333333),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: new Text(
                "Yes",
                style: TextStyle(
                  color: Color(0xFF333333),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                submit();
              },
            ),
          ],
        );
      },
    );
  }

  Widget bottomNavBar() {
    return ScopedModel<MainModel>(
      model: new MainModel(),
      child: ScopedModelDescendant<MainModel>(
        builder: (context, child, model) {
          print('loading: ' + model.isLoading.toString());
          return Container(
            height: 60,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: ButtonTheme(
                minWidth: double.infinity,
                child: RaisedButton(
                  color: Color(0xFF00acc1),
                  onPressed: () {
                    model.isLoading ? null : AreYouSure();
                  },
                  child: Center(
                    child: model.isLoading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Text(
                            'Submit',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
