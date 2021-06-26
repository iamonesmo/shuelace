import 'package:flutter/material.dart';
import 'package:shuelace/accountScreen.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({Key? key}) : super(key: key);

  @override
  _AddAddressScreenState createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Address'),
      ),
      body: Center(
        child: Column(
          children: [
            TextFormField(
              style: TextStyle(),
              decoration: InputDecoration(hintText: 'Full Name'),
            ),
            TextFormField(
              style: TextStyle(),
              decoration: InputDecoration(hintText: 'House no/Building Name'),
            ),
            TextFormField(
              style: TextStyle(),
              decoration: InputDecoration(hintText: 'Locality'),
            ),
            TextFormField(
              style: TextStyle(),
              decoration: InputDecoration(hintText: 'Pincode'),
            ),
            TextButton(
                onPressed: () {
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
