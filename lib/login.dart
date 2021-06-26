import 'package:flutter/material.dart';
import 'home.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text('Login'),
            ),
            TextFormField(
              style: TextStyle(),
              decoration: InputDecoration(hintText: 'Email'),
            ),
            TextFormField(
              style: TextStyle(),
              decoration: InputDecoration(hintText: 'password'),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return HomeScreen();
                  }));
                },
                child: Text('login'))
          ],
        ),
      ),
    );
  }
}
