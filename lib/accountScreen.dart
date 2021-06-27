import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shuelace/home.dart';

import 'addAddressScreen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var obtainedName = prefs.getString('fullName');
    var obtainedAddress = prefs.getString('locality');
    setState(() {
      fullName = obtainedName;
      address = obtainedAddress;
      print(address + 'accout screen');
      print(fullName + "account screen");
    });
  }

  var _nameController = TextEditingController(text: '$fullName');
  var _emailController = TextEditingController(text: '$finalEmail');
  var _addressController = TextEditingController(text: '$address');

  display() {
    if (address == null || address == '') {
      return TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return AddAddressScreen();
            }));
          },
          child: Text('Add Address'));
    } else {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.house),
              SizedBox(
                width: 150,
                child: TextFormField(
                  style: TextStyle(),
                  controller: _addressController,
                  decoration: InputDecoration(hintText: 'Address'),
                ),
              ),
              Icon(Icons.edit)
            ],
          ),
          TextButton(
              onPressed: () async {
                SharedPreferences _prefs =
                    await SharedPreferences.getInstance();
                _prefs.setString('fullName', _nameController.text);
                _prefs.setString('locality', _addressController.text);
                _prefs.setString('email', _emailController.text);

                Navigator.pop(context, MaterialPageRoute(builder: (context) {
                  return HomeScreen();
                }));
              },
              child: Text('save'))
        ],
      );
    }
  }

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
                  Text('$finalEmail'),
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
                    controller: _nameController,
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
                    controller: _emailController,
                    decoration: InputDecoration(hintText: 'Email'),
                  ),
                ),
                Icon(Icons.edit)
              ],
            ),
            display()
          ],
        ),
      ),
    );
  }
}
