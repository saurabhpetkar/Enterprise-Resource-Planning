import 'package:flutter/material.dart';
import '../../scoped_models/main.dart';
import '../../models/cv.dart';
import 'package:http/http.dart' as http;

class CVList2 extends StatefulWidget {
  final MainModel model;

  CVList2(this.model);

  @override
  State<StatefulWidget> createState() {
    return CVList2State();
  }
}

class CVList2State extends State<CVList2> {
  bool isloading;

  List<CV> CVList;

  @override
  void initState() {
//    widget.model.loadCVData();
    dedebhai();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('cv page'),
      ),
      body: isloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return index == widget.model.CVList.length
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: RaisedButton(
                            onPressed: () {
                              getsomemore();
                            },
                            color: Colors.yellow,
                            child: Center(
                              child: Text('get some more ?'),
                            ),
                          ),
                        ),
                      )
                    : Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: Text(widget.model.CVList[index].name),
                          ),
                          Divider(),
                        ],
                      );
              },
              itemCount: widget.model.CVList.length + 1,
            ),
    );
  }

// Future<List<CV>> getPosts(offset, limit) async {
//    setState(() {
//      isloading = true;
//    });
//   final responseBody = (await http.get(
//       'http://jsonplaceholder.typicode.com/posts?_start=$offset&_limit=$limit'))
//       .body;
//
//   setState(() {
//     isloading = false;
//   });
//
//   return data;
// }

  void getsomemore() async {
    final extend = await widget.model.loadCVData();
    widget.model.addittoCVList(extend);
    setState(() {

    });
  }

  void dedebhai() async {
    setState(() {
      isloading = true;
    });
    CVList = await widget.model.loadCVData();

    setState(() {
      print('setstate ho gaya');
      isloading = false;
    });
  }
}
