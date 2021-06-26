import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text('Register'),
            ),
            TextFormField(
              style: TextStyle(),
              decoration: InputDecoration(hintText: 'Display Name'),
            ),
            TextFormField(
              style: TextStyle(),
              decoration: InputDecoration(hintText: 'Email'),
            ),
            TextFormField(
              style: TextStyle(),
              decoration: InputDecoration(hintText: 'password'),
            ),
            ElevatedButton(onPressed: () {}, child: Text('Create Account'))
          ],
        ),
      ),
    );
  }
}
