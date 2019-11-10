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
import './pages/hr/cvDetail.dart';
import './pages/finance/finance.dart';
import './pages/profile/profile.dart';



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
    return ScopedModel<MainModel>(
      model: _model,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          accentColor: Colors.greenAccent,
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
        },
//        onGenerateRoute: (RouteSettings settings) {
//          print(settings);
//          final List<String> pathElements = settings.name.split('/');
//          String first = pathElements[2];
//
//          if (pathElements[1] == 'finance') {
//            return Finance(first);
//          }
//
//
//
//          return null;
//        },
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

//  MaterialPageRoute<bool> Finance (String first){
//    if (first == 'AA') {
//      return MaterialPageRoute<bool>(
//          builder: (BuildContext context) =>
//          _isAuthenticated ? LoginPage(_model) : AccountAdministrationPage(_model));
//    }
//    else if(first == 'CBA'){
//      return MaterialPageRoute<bool>(
//          builder: (BuildContext context) =>
//          _isAuthenticated ? LoginPage(_model) : CashBankAccPage(_model));
//    }
//    else if(first == 'CCP'){
//      return MaterialPageRoute<bool>(
//          builder: (BuildContext context) =>
//          !_isAuthenticated ? LoginPage(_model) : FinancePage(_model));
//    }
//    else if(first == 'AM'){
//      return MaterialPageRoute<bool>(
//          builder: (BuildContext context) =>
//          !_isAuthenticated ? LoginPage(_model) : FinancePage(_model));
//    }
//    else if(first == 'APAR'){
//      return MaterialPageRoute<bool>(
//          builder: (BuildContext context) =>
//          !_isAuthenticated ? LoginPage(_model) : FinancePage(_model));
//    }
//    else if(first == 'SC'){
//      return MaterialPageRoute<bool>(
//          builder: (BuildContext context) =>
//          !_isAuthenticated ? LoginPage(_model) : FinancePage(_model));
//    }
//    else if(first == 'SA'){
//      return MaterialPageRoute<bool>(
//          builder: (BuildContext context) =>
//          !_isAuthenticated ? LoginPage(_model) : FinancePage(_model));
//    }
//    else if(first == 'FA'){
//      return MaterialPageRoute<bool>(
//          builder: (BuildContext context) =>
//          !_isAuthenticated ? LoginPage(_model) : FinancePage(_model));
//    }
//    else if(first == 'FAM'){
//      return MaterialPageRoute<bool>(
//          builder: (BuildContext context) =>
//          !_isAuthenticated ? LoginPage(_model) : FinancePage(_model));
//    }
//  }
