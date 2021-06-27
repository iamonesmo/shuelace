import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'accountScreen.dart';
import 'customTiles.dart';

var finalEmail;
var fullName;
var address;
var password;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Razorpay _razorpay = Razorpay();

  void callRazorpay() {
    var options = {
      'key': 'rzp_test_oCw86A8j2wlpov',
      'amount': 2700000, //in the smallest currency sub-unit.
      'name': 'Shuelace',

      'description': 'Nike Adapt BB',

      'prefill': {'contact': '', 'email': '$finalEmail'}
    };
    try {
      _razorpay.open(options);
    } catch (msg) {}
  }

  @override
  // ignore: must_call_super
  void initState() {
    getEmail();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "Payment successful", toastLength: Toast.LENGTH_LONG);
    // Do something when payment succeeds
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "Payment Failed. " + response.message,
        toastLength: Toast.LENGTH_LONG);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "Redirecting to external wallet", toastLength: Toast.LENGTH_LONG);
  }

  // get email sharedPreferences
  getEmail() async {
    SharedPreferences _sp = await SharedPreferences.getInstance();
    var obtainedEmail = _sp.getString('email');
    var obtainedName = _sp.getString('fullName');
    setState(() {
      finalEmail = obtainedEmail;
      fullName = obtainedName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              Container(
                  height: 150,
                  child: DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.deepOrangeAccent,
                    ),
                    child: Material(
                      color: Colors.deepOrangeAccent,
                      child: InkWell(
                        splashColor: Colors.green,
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return AccountScreen();
                          }));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.person_outline),
                            Text('$finalEmail'),
                            Icon(Icons.arrow_right_outlined)
                          ],
                        ),
                      ),
                    ),
                  )),
              CustomTile(Icons.menu, 'Order History', () {}),
              CustomTile(Icons.phone, 'Help & Support', () {}),
              CustomTile(Icons.update, 'Updates', () {}),
              CustomTile(Icons.power_settings_new, 'Logout', () {
                return showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                          title: Text('Are You sure you want to logout?'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  //  Navigator.pop(context)
                                  Navigator.of(ctx).pop();
                                },
                                child: Text('no')),
                            TextButton(
                                onPressed: () {
                                  exit(0);
                                },
                                child: Text('yes'))
                          ],
                        ));
              }),
            ],
          ),
        ),
        backgroundColor: Colors.blueGrey[50],
        appBar: AppBar(
          title: Text('Shuelace'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Container(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Image.asset('assets/smaple.jpg'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Nike Adapt BB',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text('Price: Rs27000',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      callRazorpay();
                    },
                    child: Text('Buy'))
              ],
            )),
          ),
        ));
  }
}
