import 'package:flutter/material.dart';

import 'addAddressScreen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: Column(
                children: [
                  Icon(
                    Icons.person_outline_outlined,
                    size: 60,
                  ),
                  Text('Number goes here'),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.person),
                SizedBox(
                  width: 150,
                  child: TextFormField(
                    style: TextStyle(),
                    decoration: InputDecoration(hintText: 'Your Name'),
                  ),
                ),
                Icon(Icons.edit)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.email),
                SizedBox(
                  width: 150,
                  child: TextFormField(
                    style: TextStyle(),
                    decoration: InputDecoration(hintText: 'Email'),
                  ),
                ),
                Icon(Icons.edit)
              ],
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return AddAddressScreen();
                  }));
                },
                child: Text('Add Address'))
          ],
        ),
      ),
    );
  }
}
