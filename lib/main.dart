import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import './scoped_models/main.dart';

import './pages/home/home.dart';
import './pages/login/login.dart';
import './models/home.dart';
import './pages/about/about.dart';
import './pages/home/Events/eventList.dart';
import './pages/home/Events/eventDetail.dart';
import './pages/sales/salespage.dart';
import './pages/sales/purchaseDetail.dart';
import './pages/hr/cvList.dart';
import './pages/hr/cvList2.dart';
import './pages/hr/cvDetail.dart';
import './pages/finance/finance.dart';
import './pages/profile/profile.dart';
import './pages/product/add-product.dart';
import './pages/product/product-list.dart';
import './pages/product/product-detail.dart';
import './pages/meeting/add-meeting.dart';
import './pages/meeting/meeting-list.dart';
import './pages/meeting/meeting-detail.dart';
import './pages/customer_company/customer_company.dart';
import './pages/training/training.dart';
import './pages/complain/complain-list.dart';
import './pages/complain/complain-box.dart';


import './pages/privacy_policy/privacy_policy.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final MainModel _model = MainModel();
  bool _isAuthenticated = false;
  HomePageMode _userMode = HomePageMode.not_authenticated;

  @override
  initState() {
    super.initState();
    print("in initstate");
    _model.autoAuthenticate();
    _model.usermode.listen((HomePageMode usermode) {
      setState(() {
        _userMode = usermode;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build main');
    return ScopedModel<MainModel>(
      model: _model,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          accentColor: Color(0xFF62efff),
          fontFamily: 'Roboto',

        ),
        home: _userMode == HomePageMode.authenticated
            ? HomePage(_model)
            : LoginPage(_model),
        routes: {
          '/about': (BuildContext context) =>
          _userMode == HomePageMode.not_authenticated
              ? LoginPage(_model)
              : AboutPage(_model),
          '/event-list': (BuildContext context) =>
          _userMode == HomePageMode.not_authenticated
              ? LoginPage(_model)
              : EventPage(_model),
          '/privacy-policy': (BuildContext context) =>
          _userMode == HomePageMode.not_authenticated
              ? LoginPage(_model)
              : PrivacyPolicyPage(_model),
          '/event-detail': (BuildContext context) =>
          _userMode == HomePageMode.not_authenticated
              ? LoginPage(_model)
              : EventDetail(_model),
          '/sales': (BuildContext context) =>
          _userMode == HomePageMode.not_authenticated
              ? LoginPage(_model)
              : SalesPage(_model),
          '/purchase-detail': (BuildContext context) =>
          _userMode == HomePageMode.not_authenticated
              ? LoginPage(_model)
              : PurchaseDetail(_model),
          '/hr': (BuildContext context) =>
          _userMode == HomePageMode.not_authenticated
              ? LoginPage(_model)
              : CVPage(_model),
          '/finance': (BuildContext context) =>
          _userMode == HomePageMode.not_authenticated
              ? LoginPage(_model)
              : FinancePage(_model),
          '/cv-detail': (BuildContext context) =>
          _userMode == HomePageMode.not_authenticated
              ? LoginPage(_model)
              : CVDetail(_model),
          '/profile': (BuildContext context) =>
          _userMode == HomePageMode.not_authenticated
              ? LoginPage(_model)
              : ProfilePage(_model),
          '/add-product': (BuildContext context) =>
          _userMode == HomePageMode.not_authenticated
              ? LoginPage(_model)
              : AddProduct(_model),
          '/product-list': (BuildContext context) =>
          _userMode == HomePageMode.not_authenticated
              ? LoginPage(_model)
              : ProductListPage(_model),
          '/product-detail': (BuildContext context) =>
          _userMode == HomePageMode.not_authenticated
              ? LoginPage(_model)
              : ProductDetailPage(_model),
          '/add-meeting': (BuildContext context) =>
          _userMode == HomePageMode.not_authenticated
              ? LoginPage(_model)
              : AddMeetingPage(_model),
          '/meeting-list': (BuildContext context) =>
          _userMode == HomePageMode.not_authenticated
              ? LoginPage(_model)
              : MeetingListPage(_model),
          '/meeting-detail': (BuildContext context) =>
          _userMode == HomePageMode.not_authenticated
              ? LoginPage(_model)
              : MeetingDetailPage(_model),
          '/company-list': (BuildContext context) =>
          _userMode == HomePageMode.not_authenticated
              ? LoginPage(_model)
              : CompanyPage(_model),
          '/training': (BuildContext context) =>
          _userMode == HomePageMode.not_authenticated
              ? LoginPage(_model)
              : TrainingPage(_model),
          '/complain-list': (BuildContext context) =>
          _userMode == HomePageMode.not_authenticated
              ? LoginPage(_model)
              : ComplainPage(_model),
          '/complain-box': (BuildContext context) =>
          _userMode == HomePageMode.not_authenticated
              ? LoginPage(_model)
              : ComplainBoxPage(_model),
        },
        onGenerateRoute: (RouteSettings settings) {
          print(settings);
          final List<String> pathElements = settings.name.split('/');
//          if(pathElements[1] == 'hr'){
//            _model.SetCVPage(int.parse(pathElements[2]));
//            return MaterialPageRoute(
//              builder: (BuildContext context) => CVList2(_model),
//            );
//          }
          return null;
        },
        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute(
            builder: (BuildContext context) =>
            !_isAuthenticated ? HomePage(_model) : LoginPage(_model),
          );
        },
      ),
    );
  }
}
