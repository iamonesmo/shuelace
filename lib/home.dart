import 'dart:io';

import 'package:flutter/material.dart';

import 'accountScreen.dart';
import 'customTiles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                          Text('phone number goes here'),
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
      appBar: AppBar(),
      body: Center(
        child: Container(
          child: Text('Body goes here'),
        ),
      ),
    );
  }
}
