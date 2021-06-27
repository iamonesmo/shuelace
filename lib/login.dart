import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';
import 'package:form_field_validator/form_field_validator.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // ignore: must_call_super
  void initState() {
    getCreds();
  }

  // get email sharedPreferences
  getCreds() async {
    SharedPreferences _sp = await SharedPreferences.getInstance();
    var obtainedEmail = _sp.getString('email');
    var obtainedPassword = _sp.getString('password');
    setState(() {
      finalEmail = obtainedEmail;
      password = obtainedPassword;
    });
  }

  void validate() async {
    if (formKey.currentState!.validate()) {
      //
      if (_passwordController.text == password &&
          _emailController.text == finalEmail) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return HomeScreen();
        }));
      } else {
        Fluttertoast.showToast(
            msg: "Wrong Password or Email. Try creating an acount first.",
            textColor: Colors.red,
            backgroundColor: Colors.red,
            toastLength: Toast.LENGTH_LONG);
      }
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
    // final _passwordController = TextEditingController();
    return Scaffold(
      // appBar: AppBar(),
      backgroundColor: Color.fromRGBO(231, 227, 210, 1.0),
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
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: TextFormField(
                      validator: MultiValidator([
                        EmailValidator(errorText: "Not A Valid Email"),
                        RequiredValidator(errorText: "Required*")
                      ]),
                      controller: _emailController,
                      style: TextStyle(),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: TextFormField(
                      obscureText: true,
                      style: TextStyle(),
                      validator: validatePassword,
                      controller: _passwordController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: ElevatedButton(
                        onPressed: validate, child: Text('login')),
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
