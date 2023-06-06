import 'package:flutter/material.dart';




void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: ForgotPasswordPage(),
    );
  }
}


class ForgotPasswordPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Forgot your password ?',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 16.0),
            Text('Enter your email address to reset password',
            textAlign: TextAlign.center,
            ),

            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),

            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: (){
                //backend password reset
              },
              child: Text('Reset Password'),
            )
          ],
          
        ),
      ),
    );
  }
}