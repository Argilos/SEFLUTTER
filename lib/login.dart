import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value!;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                onSaved: (value) {
                  _password = value!;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    var url = Uri.parse('http://localhost:8000/api/auth/login/');
                    try {
                      var response = await http.post(
                        url,
                        headers: {'Content-Type': 'application/json'},
                        body: json.encode({'email': _email, 'password': _password}),
                      );
                      if (response.statusCode == 200) {
                        print('Login successful');
                        // Delete comments after finishing frontend
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => NextPage()),
                        // );
                      } else {
                        print('Login failed');
                      }
                    } catch (e) {
                      print('Request failed.');
                    }
                  }
                },
                child: Text('Login'),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
