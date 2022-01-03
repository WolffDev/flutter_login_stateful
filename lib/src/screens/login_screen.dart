import 'package:flutter/material.dart';
import 'package:learn_login_stateful/src/mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            emailField(),
            passwordField(),
            Container(margin: const EdgeInsets.only(bottom: 25.0)),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      validator: validateEmail,
      onSaved: (newValue) => {_email = newValue!},
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: "Email Adress",
        hintText: 'you@example.com',
      ),
    );
  }

  Widget passwordField() {
    return TextFormField(
      onSaved: (newValue) => {_password = newValue!},
      validator: validatePassword,
      obscureText: false,
      decoration: const InputDecoration(
        labelText: "Password",
        hintText: 'Password',
        labelStyle: TextStyle(),
      ),
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      onPressed: submitValidation,
      child: const Text("Submit!"),
      style: ElevatedButton.styleFrom(
        primary: Colors.amber,
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
      ),
    );
  }

  void submitValidation() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print('Time to post $_email and $_password to an API!');
    } else {
      print('NOT VALID!');
    }
  }
}
