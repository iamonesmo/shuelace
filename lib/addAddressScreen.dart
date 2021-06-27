import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shuelace/accountScreen.dart';
import 'package:shuelace/home.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({Key? key}) : super(key: key);

  @override
  _AddAddressScreenState createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  @override
  Widget build(BuildContext context) {
    //CONTROLLERS
    final _fullNameController = TextEditingController(text: '$fullName');
    final _hNumberConroller = TextEditingController();
    final _localityController = TextEditingController();
    final _pincodeController = TextEditingController();

    return Scaffold(
      backgroundColor: Color.fromRGBO(231, 227, 210, 1.0),
      appBar: AppBar(
        title: Text('Add Address'),
      ),
      body: Center(
        child: Column(
          children: [
            TextFormField(
              style: TextStyle(),
              controller: _fullNameController,
              decoration: InputDecoration(hintText: 'Full Name'),
            ),
            TextFormField(
              style: TextStyle(),
              controller: _hNumberConroller,
              decoration: InputDecoration(hintText: 'House no/Building Name'),
            ),
            TextFormField(
              style: TextStyle(),
              controller: _localityController,
              decoration: InputDecoration(hintText: 'Locality'),
            ),
            TextFormField(
              style: TextStyle(),
              controller: _pincodeController,
              decoration: InputDecoration(hintText: 'Pincode'),
            ),
            TextButton(
                onPressed: () async {
                  final SharedPreferences _sp =
                      await SharedPreferences.getInstance();
                  _sp.setString('fullName', _fullNameController.text);
                  _sp.setString('houseNumber', _hNumberConroller.text);
                  _sp.setString('locality', _localityController.text);
                  _sp.setString('pincode', _pincodeController.text);

                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  var obtainedName = prefs.getString('fullName');
                  var obtainedAddress = prefs.getString('locality');
                  setState(() {
                    fullName = obtainedName;
                    address = obtainedAddress;
                    AccountScreen();
                  });
                  print(address + " in add address screen");
                  Navigator.pop(context, MaterialPageRoute(builder: (context) {
                    return AccountScreen();
                  }));
                },
                child: Text('Add Address'))
          ],
        ),
      ),
    );
  }
}
