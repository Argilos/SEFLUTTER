import 'package:flutter/material.dart';
import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SignUp',
      home: SignupPage(),
    );
  }
}

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _retypePasswordController = TextEditingController();
  bool _passwordsMatch = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Directionality(
          textDirection: TextDirection.ltr, // Adjust this as per your desired text direction
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Full Name',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
              TextField(
                controller: _retypePasswordController,
                decoration: InputDecoration(
                  labelText: 'Repeat password',
                  errorText: !_passwordsMatch ? 'Passwords do not match' : null,
                ),
                obscureText: true,
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                      onPressed: () {
                        String password = _passwordController.text;
                        String retypePassword = _retypePasswordController.text;

                        if (password == retypePassword) {
                          //backend params store
                          setState(() {
                            _passwordsMatch = true;
                          });

                          Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation, secondaryAnimation) => LoginPage(),
                              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                //animation params
                                const begin = Offset(1.0, 0.0);
                                const end = Offset.zero;
                                const curve = Curves.ease;

                                final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                                // Apply the slide transition animation to the child widget
                                return SlideTransition(
                                  position: animation.drive(tween),
                                  child: child,
                                );
                              },
                            ),
                          );
                        } else {
                          // Passwords do not match
                          setState(() {
                            _passwordsMatch = false;
                          });

                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              // Show an error dialog indicating that passwords do not match
                              return AlertDialog(
                                title: Text('Error'),
                                content: Text('Passwords do not match'),
                                actions: [
                                  TextButton(
                                    child: Text('OK'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      child: Text('Sign Up'),
                ),

            TextButton(
              onPressed: (){
                Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },

            child: Text('or Login'),
            )
              
            ],
          ),
        ),
      ),
    );
  }
}
