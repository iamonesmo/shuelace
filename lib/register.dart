import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void validate() async {
    if (formKey.currentState!.validate()) {
      //
      final SharedPreferences _sharedPreferences =
          await SharedPreferences.getInstance();
      _sharedPreferences.setString('email', _emailController.text);
      _sharedPreferences.setString('fullName', _nameController.text);
      _sharedPreferences.setString('password', _passwordController.text);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HomeScreen();
      }));
    }
  }

  String? validatePassword(value) {
    if (value == null || value.isEmpty) {
      return "Required*";
    } else if (value.length < 6) {
      return "Should be atleast 6 Characters";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text('Register'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        validator: MultiValidator(
                            [RequiredValidator(errorText: "Required*")]),
                        controller: _nameController,
                        style: TextStyle(),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Display Name")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        style: TextStyle(),
                        validator: MultiValidator([
                          EmailValidator(errorText: "Not A Valid Email"),
                          RequiredValidator(errorText: "Required*")
                        ]),
                        controller: _emailController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), labelText: "Email")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        style: TextStyle(),
                        controller: _passwordController,
                        validator: validatePassword,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Password")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: validate, child: Text('Create Account')),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
