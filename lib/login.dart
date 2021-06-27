import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _emailController = TextEditingController();
    // final _passwordController = TextEditingController();
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
              controller: _emailController,
              style: TextStyle(),
              decoration: InputDecoration(hintText: 'Email'),
            ),
            TextFormField(
              style: TextStyle(),
              decoration: InputDecoration(hintText: 'password'),
            ),
            ElevatedButton(
                onPressed: () async {
                  final SharedPreferences sharedPreferences =
                      await SharedPreferences.getInstance();
                  sharedPreferences.setString('email', _emailController.text);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return HomeScreen();
                  }));
                  print(finalEmail + ' from login');
                },
                child: Text('login'))
          ],
        ),
      ),
    );
  }
}
