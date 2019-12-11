import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import '../../scoped_models/main.dart';
import '../../models/purchase.dart';

class PurchaseDetail extends StatelessWidget {
  final MainModel model;

  PurchaseDetail(this.model);

  TextStyle attr = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
  TextStyle content = TextStyle(
    fontSize: 21,
    fontWeight: FontWeight.w500,
    color: Color(0xff333333),
  );

  @override
  Widget build(BuildContext context) {
    Purchase purchase = model.selectedPurchase;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          title: Text(
            'Purchase',
          ),
        ),
        body: model.isLoading
            ? Center(
          child: CircularProgressIndicator(),
        )
            : Scrollbar(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
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
                        'Product',
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
                        purchase.itemname,
                        style: content,
                      ),
                    ),
                  ),
                ],
              ),


//              Row(
//                mainAxisAlignment: MainAxisAlignment.start,
//                crossAxisAlignment: CrossAxisAlignment.start,
//                children: <Widget>[
//                  Expanded(
//                    flex: 1,
//                    child: Container(
//                      padding: EdgeInsets.symmetric(
//                          vertical: 5, horizontal: 10),
//                      child: Text(
//                        'Discount',
//                        style: attr,
//                      ),
//                    ),
//                  ),
//                  Expanded(
//                    flex: 2,
//                    child: Container(
//                      padding: EdgeInsets.symmetric(
//                          vertical: 5, horizontal: 10),
//                      child: Text(
//                        purchase.discount.toString(),
//                        style: content,
//                      ),
//                    ),
//                  ),
//                ],
//              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(
                        'Discount',
                        style: attr,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(
                        purchase.discount.toString(),
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
                    flex: 1,
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
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(
                        purchase.quantity.toString(),
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
                        'Description',
                        style: attr,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(
                        purchase.description,
                        style: content,
                      ),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}

//final String description;
//final String year;

//class EventDetail extends StatelessWidget {
//  final MainModel model;
//
//  EventDetail(this.model);
//  @override
//  Widget build(BuildContext context) {
//    Event event = model.selectedEvent;
//
//    final levelIndicator = Container(
//      child: Container(
//        child: LinearProgressIndicator(
//            backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
//            value: 0.8,
//            valueColor: AlwaysStoppedAnimation(Colors.green)),
//      ),
//    );
//
//    final coursePrice = Container(
//      padding: const EdgeInsets.all(7.0),
//      decoration: new BoxDecoration(
//          border: new Border.all(color: Colors.white),
//          borderRadius: BorderRadius.circular(5.0)),
//      child: new Text(
//        // "\$20",
//        "\$" + '20',
//        style: TextStyle(color: Colors.white),
//      ),
//    );
//
//    final topContentText = Column(
//      crossAxisAlignment: CrossAxisAlignment.start,
//      children: <Widget>[
//        SizedBox(height: 120.0),
//        Icon(
//          Icons.directions_car,
//          color: Colors.white,
//          size: 40.0,
//        ),
//        Container(
//          width: 90.0,
//          child: new Divider(color: Colors.green),
//        ),
//        SizedBox(height: 10.0),
//        Text(
//          event.title,
//          style: TextStyle(color: Colors.white, fontSize: 45.0),
//        ),
//        SizedBox(height: 30.0),
//        Row(
//          mainAxisAlignment: MainAxisAlignment.start,
//          children: <Widget>[
//            Expanded(flex: 1, child: levelIndicator),
//            Expanded(
//                flex: 6,
//                child: Padding(
//                    padding: EdgeInsets.only(left: 10.0),
//                    child: Text(
//                      event.organizer,
//                      style: TextStyle(color: Colors.white),
//                    ))),
//            Expanded(flex: 1, child: coursePrice)
//          ],
//        ),
//      ],
//    );
//
//    final topContent = Stack(
//      children: <Widget>[
//        Container(
//            padding: EdgeInsets.only(left: 10.0),
//            height: MediaQuery.of(context).size.height * 0.5,
//            decoration: new BoxDecoration(
//              image: new DecorationImage(
//                image: NetworkImage(event.picture),
//                fit: BoxFit.cover,
//              ),
//            )),
//        Container(
//          height: MediaQuery.of(context).size.height * 0.5,
//          padding: EdgeInsets.all(40.0),
//          width: MediaQuery.of(context).size.width,
//          decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
//          child: Center(
//            child: topContentText,
//          ),
//        ),
//        Positioned(
//          left: 8.0,
//          top: 60.0,
//          child: InkWell(
//            onTap: () {
//              Navigator.pop(context);
//            },
//            child: Icon(Icons.arrow_back, color: Colors.white),
//          ),
//        )
//      ],
//    );
//
//    final bottomContentText = Text(
//      event.description,
//      style: TextStyle(fontSize: 18.0),
//    );
//    final readButton = Container(
//        padding: EdgeInsets.symmetric(vertical: 16.0),
//        width: MediaQuery.of(context).size.width,
//        child: RaisedButton(
//          onPressed: () => {},
//          color: Color.fromRGBO(58, 66, 86, 1.0),
//          child:
//          Text("JOIN EVENT", style: TextStyle(color: Colors.white)),
//        ));
//    final bottomContent = Container(
//      // height: MediaQuery.of(context).size.height,
//      width: MediaQuery.of(context).size.width,
//      // color: Theme.of(context).primaryColor,
//      padding: EdgeInsets.all(40.0),
//      child: Center(
//        child: Column(
//          children: <Widget>[bottomContentText, readButton],
//        ),
//      ),
//    );
//
//    return Scaffold(
//      body: Column(
//        children: <Widget>[topContent, bottomContent],
//      ),
//    );
//  }
//}
