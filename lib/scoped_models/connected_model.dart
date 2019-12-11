import 'package:scoped_model/scoped_model.dart';
import 'dart:convert';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rxdart/subjects.dart';
import 'package:http/http.dart' as http;
import '../models/event.dart';
import '../models/purchase.dart';
import '../models/cv.dart';
import '../models/product.dart';

import '../models/home.dart';
import '../models/user.dart';

class ConnectedModel extends Model {
  bool _isloading = false;
  User _authenticatedUser;
  PublishSubject<HomePageMode> _usermode = PublishSubject();
  Event _selectedEvent;
  Purchase _selectedPurchase;
  CV _selectedCV;
}

class UserModel extends ConnectedModel {
  PublishSubject<HomePageMode> get usermode {
    return _usermode;
  }

  User get authenticatedUser {
    return _authenticatedUser;
  }

  Timer _authtimer;
  PublishSubject<bool> _userSubject = PublishSubject();

  PublishSubject<bool> get userSubject {
    return _userSubject;
  }

  User get user {
    return _authenticatedUser;
  }

  Future<Map<String, dynamic>> authenticate(
      String username, String password) async {
    _isloading = true;
    notifyListeners();

    final Map<String, dynamic> authdata_login = {
      'username': username,
      'password': password,
    };

    final name = "temperory name";
    bool haserror = true;
    String message = 'incorrect data entered';

    //eras the below later
    String token = 'token';

    setAuthTimeout(1 * 3600 * 24); //1day timeout in seconds
    final DateTime now = DateTime.now();
    final DateTime expiryTime =
        now.add(Duration(seconds: 1 * 3600 * 24)); //1 day in seconds

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', name);
    prefs.setString('token', token);
    prefs.setString('email', 'a@a.com');

    prefs.setString('expiryTime', expiryTime.toIso8601String());
    //erase the above later
//    print(authdata_signup);
//
//
//      String link = "link to login";
//
//      http.Response response = await http.post(
//        link,
//        body: json.encode(authdata_login),
//        headers: {'Content-Type': 'application/json', 'accept': 'application/json'},
//      );
//
//    print('ye hai response ${json.decode(response.body)}');
//    final Map<String, dynamic> responsedata = json.decode(response.body);
//    print('ye hai status code ${response.statusCode}');
//
//    if (response.statusCode != 400 && response.statusCode != 401) {
//      haserror = false;
//      _authenticatedUser = User(
//        token: responsedata['token'],
//        username: username,
    //    fname: responsedata['fname']
    //    lname: responsedata['lname']
    //    email: responsedata['email']


//      );
//
//      setAuthTimeout(1 * 3600 * 24); //1day timeout in seconds
//      final DateTime now = DateTime.now();
//      final DateTime expiryTime =
//      now.add(Duration(seconds: 1 * 3600 * 24)); //1 day in seconds
//
//      final SharedPreferences prefs = await SharedPreferences.getInstance();
//      prefs.setString('username', responsedata['username']);
//      prefs.setString('token', responsedata['token']);
//      prefs.setString('expiryTime', expiryTime.toIso8601String());
//      prefs.setString('fname', responsedata['fname']);
    //      prefs.setString('lname', responsedata['lname']);
    //      prefs.setString('email', responsedata['email']);



//      _userSubject.add(true);
//    }
//    else{
//      return {'success': false, 'error': 'some error'};
//    }

    _authenticatedUser = User(
        username: 'user',  token: 'token', email: 'a@a.com');
    haserror = false;
    message = 'Logged in';
    _isloading = false;
    notifyListeners();
    if(haserror == false)
      _usermode.add(HomePageMode.authenticated);
    //only for frontend purpose



    return {'success': !haserror, 'message': message};
  }

  void autoAuthenticate() async {
    _isloading = true;
    notifyListeners();
    print('in autoauthenticate');
//    _usermode.add(HomePageMode.not_authenticated);

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('token');

    if (token != null) {
      final String expiryTime = prefs.getString('expiryTime');
      print('token not null');
      final DateTime now = DateTime.now();
      final parsedExpiryTime = DateTime.parse(expiryTime);
      if (parsedExpiryTime.isBefore(now)) {
        print('token expired');
        _isloading = false;
        notifyListeners();
        _usermode.add(HomePageMode.not_authenticated);
      }
      print('token not expired');

      _authenticatedUser = User(
        token: prefs.getString('token'),
        username: prefs.getString('username'),
        email: prefs.getString('email'),
        //        fname: prefs.getString('fname'),
//        lname: prefs.getString('lname'),

      );

      final int tokenlifespan = parsedExpiryTime.difference(now).inSeconds;
      setAuthTimeout(tokenlifespan);

      _isloading = false;
      notifyListeners();
      print('he is authenticated');
      print(_authenticatedUser);
      _usermode.add(HomePageMode.authenticated);
    }
    _isloading = false;
    notifyListeners();
    print('out of autoauthenticate');

    //logged out hai
  }

  void logout() async {
    print('logout ho raha hai');
    _authtimer.cancel();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('access');
    prefs.remove('refresh');
    prefs.remove('username');
    _authenticatedUser = null;
    _usermode.add(HomePageMode.not_authenticated);
    print('logout ho gaya');
  }

  void setAuthTimeout(int time) {
    _authtimer = Timer(Duration(seconds: time), () {
      logout();
      print('logout, automatic');
    });
  }

  Future<Map<String, dynamic>> PasswordChange(
      String prev, String new_pass) async {
    _isloading = true;
    notifyListeners();

    http.Response response = await http
        .get('http://jsonplaceholder.typicode.com/posts?_start=10&_limit=3');
    print(response.statusCode);
    Map<String, dynamic> res = {
      'success': false,
      'message': 'Incorrect previous Password'
    };
    Map<String, dynamic> res2 = {
      'success': true,
      'message': 'Password Updated'
    };

    _isloading = false;
    notifyListeners();
    return res2;
  }
}

class UtilityModel extends ConnectedModel {
  bool get isLoading {
    return _isloading;
  }

  String get ip {
    return "10.0.55.60:8000";
  }

}

class EventModel extends ConnectedModel {
  void setEvent(Event event) {
    _selectedEvent = event;
  }

  Event get selectedEvent {
    return _selectedEvent;
  }
}

class SalesModel extends ConnectedModel {
  void setPurchase(Purchase purchase) {
    _selectedPurchase = purchase;
  }

  Purchase get selectedPurchase {
    return _selectedPurchase;
  }
}

class HRModel extends ConnectedModel {
  List<CV> data = [
    CV(
        name: 'deepesh',
        email: 'xyz@gmail.com',
        cv_link: 'http://www.africau.edu/images/default/sample.pdf',
        state: 'Bihar',
        day: 1,
        month: 'Jan',
        year: 2019,
        hour: 18,
        min: 38),
    CV(
        name: 'saurabh',
        email: 'xyz@gmail.com',
        cv_link: 'http://www.africau.edu/images/default/sample.pdf',
        state: 'Maharashtra',
        day: 2,
        month: 'Jan',
        year: 2019,
        hour: 18,
        min: 38),
    CV(
        name: 'atul',
        email: 'xyz@gmail.com',
        cv_link: 'http://www.africau.edu/images/default/sample.pdf',
        state: 'Bihar',
        day: 3,
        month: 'Jan',
        year: 2019,
        hour: 18,
        min: 38),
    CV(
        name: 'kolpo',
        email: 'xyz@gmail.com',
        cv_link: 'http://www.africau.edu/images/default/sample.pdf',
        state: 'Assam',
        day: 4,
        month: 'Jan',
        year: 2019,
        hour: 18,
        min: 38),
    CV(
        name: 'sid G',
        email: 'xyz@gmail.com',
        cv_link: 'http://www.africau.edu/images/default/sample.pdf',
        state: 'Bihar',
        day: 5,
        month: 'Jan',
        year: 2019,
        hour: 18,
        min: 38),
    CV(
        name: 'akshay',
        email: 'xyz@gmail.com',
        cv_link: 'http://www.africau.edu/images/default/sample.pdf',
        state: 'UP',
        day: 6,
        month: 'Jan',
        year: 2019,
        hour: 18,
        min: 38),
    CV(
        name: 'sukirti',
        email: 'xyz@gmail.com',
        cv_link: 'http://www.africau.edu/images/default/sample.pdf',
        state: 'AP',
        day: 7,
        month: 'Jan',
        year: 2019,
        hour: 18,
        min: 38),
    CV(
        name: 'sri babu',
        email: 'xyz@gmail.com',
        cv_link: 'http://www.africau.edu/images/default/sample.pdf',
        state: 'AP',
        day: 8,
        month: 'Jan',
        year: 2019,
        hour: 18,
        min: 38),
    CV(
        name: 'sai krishna',
        email: 'xyz@gmail.com',
        cv_link: 'https://pdftron.s3.amazonaws.com/downloads/pdfref.pdf',
        state: 'AP',
        day: 9,
        month: 'Jan',
        year: 2019,
        hour: 18,
        min: 38),
    CV(
        name: 'ankur',
        email: 'xyz@gmail.com',
        cv_link: 'https://pdftron.s3.amazonaws.com/downloads/pdfref.pdf',
        state: 'UP',
        day: 10,
        month: 'Jan',
        year: 2019,
        hour: 18,
        min: 38),
  ];

  List<CV> cv_list;

  final int PAGE_SIZE = 10;

  int get Page_Size {
    return PAGE_SIZE;
  }

  void emptyCVList() {
    cv_list = [];
  }

  void addittoCVList(List<CV> extend) {
    for (int i = 0; i < extend.length; i++) cv_list.add(extend[i]);
  }

  Future<List<CV>> loadCVData() async {
    //from page index to pageindex + 25
    _isloading = true;
    notifyListeners();
    print('about to load');
    final response = await http
        .get('http://jsonplaceholder.typicode.com/posts?_start=3&_limit=10');

    if (response.statusCode == 200) _isloading = !_isloading;

    print('loaded ' + _isloading.toString());

    cv_list = data;
    notifyListeners();
    return data;
  }

  List<CV> get CVList {
    return cv_list;
  }

  int _cvPageIndex = 0;

  void SetCVPage(int index) {
    _cvPageIndex = index;
  }

  List<int> _cv_index = [];

  void insertIndex(int index) {
    _cv_index.add(index);
  }

  void emptyCVIndex() {
    _cv_index = [];
  }

  bool searchIndex(int index) {
    return _cv_index.contains(index); //true if yes, else false
  }

  void setCV(CV cv) {
    _selectedCV = cv;
  }

  CV get selectedCV {
    return _selectedCV;
  }
}

class FinanceModel extends ConnectedModel {}

class ProductModel extends ConnectedModel {
  List<Map<String, dynamic>> _products = [];
  int _selectedProductId = 0;

  int get selectedProductId {
    return _selectedProductId;
  }

  void SetProductId(int index){
    _selectedProductId = index;
  }

  List<Map<String, dynamic>> get products {
    return _products;
  }

  Future<Map<String, dynamic>> AddProduct(Map<String, dynamic> product) async {
    _isloading = true;
    notifyListeners();

    http.Response response = await http
        .get('http://jsonplaceholder.typicode.com/posts?_start=10&_limit=3');
    print(response.statusCode);
    Map<String, dynamic> res = {
      'success': false,
      'message': 'Incorrect previous Password'
    };
    Map<String, dynamic> res2 = {
      'success': true,
      'message': 'Password Updated'
    };

    _isloading = false;
    notifyListeners();
    return res2;
  }

  GetProducts() async {
    _isloading = true;
    print('is loading: '+_isloading.toString());
    notifyListeners();
    http.Response response = await http.get('http://jsonplaceholder.typicode.com/posts?_start=10&_limit=3');

    _products = [
      {'name': 'some name1', 'description': 'some description', 'quantity': 10, 'cost': 34.499},
      {'name': 'some name2', 'description': 'some description', 'quantity': 10, 'cost': 34.499},
      {'name': 'some name3', 'description': 'some description', 'quantity': 10, 'cost': 34.499},
      {'name': 'some name4', 'description': 'some description', 'quantity': 10, 'cost': 34.499},
      {'name': 'some name5', 'description': 'some description', 'quantity': 10, 'cost': 34.499},
      {'name': 'some name6', 'description': 'some description', 'quantity': 10, 'cost': 34.499},
      {'name': 'some name7', 'description': 'some description', 'quantity': 10, 'cost': 34.499},
      {'name': 'some name8', 'description': 'some description', 'quantity': 10, 'cost': 34.499},
      {'name': 'some name9', 'description': 'some description', 'quantity': 10, 'cost': 34.499},
      {'name': 'some name0', 'description': 'some description', 'quantity': 10, 'cost': 34.499},
    ];
    _isloading = false;
    print('is loading: '+_isloading.toString());
    notifyListeners();
    _isloading = false;
    notifyListeners();
  }

}

class MeetingModel extends ConnectedModel {
  int _selectedMeetingId = 0;
  int get selectedMeetingId {
    return _selectedMeetingId;
  }

  void SetMeetingId(int index){
    _selectedMeetingId = index;
  }
}
