import 'dart:io';

import 'package:flutter/material.dart';
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
  @override
  // ignore: must_call_super
  void initState() {
    getEmail();
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
      body: Center(
        child: Container(
          child: Text('Welcome $finalEmail'),
        ),
      ),
    );
  }
}
