import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';
import 'dart:async';

class CVPDF extends StatefulWidget {
  final String cv_link;

  CVPDF(this.cv_link);

  @override
  State<StatefulWidget> createState() {
    return CVPDFState();
  }
}

class CVPDFState extends State<CVPDF> {
  PDFDocument document;
  bool _isloading = false, _isinit = true;

  getFile() async {
    setState(() {
      _isinit = false;
      _isloading = true;
    });
    print('b4 await');

    document = await PDFDocument.fromURL(
        "http://www.africau.edu/images/default/sample.pdf");
    setState(() {
      _isloading = false;
    });
    print('after await');

    print(document.runtimeType);
  }

  @override
  void initState() {
    super.initState();
    print('inside initstate');
    getFile();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: _isinit
                    ? Text('click the buttons')
                    : _isloading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : PDFViewer(
                            indicatorBackground: Colors.blue,
                            indicatorText: Colors.white,
                            document: document,
                          ),
              ),
            ),
//            Expanded(
//              child: MaterialButton(
//                child: Text('from url'),
//                color: Colors.green,
//                onPressed: () {
//                  getFile();
//                },
//              ),
//            ),
          ],
        ),
      ),
    );
  }
}
