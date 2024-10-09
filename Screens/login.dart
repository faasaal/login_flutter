import 'package:flutter/material.dart';

class ScreenLogin extends StatefulWidget {
  ScreenLogin({Key? key}) : super(key: key);

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();
  bool _isDataMatched = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(90),
          child: Column(
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Username',
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                ),
              ),
              const SizedBox(height: 400),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: _isDataMatched,
                    child: Text(
                      'Username password doesnot match',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      checkLogin(context);
                    },
                    icon: const Icon(Icons.check),
                    label: const Text('Login'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void checkLogin(BuildContext ctx) {
    final _username = _usernameController.text;
    final _password = _passwordController.text;
    if (_username == _password) {
      print('Username pass match');
    } else {
      print('Username pass doesnot match');
      final _errorMessage = 'username password doesnot match ';
      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
          margin: EdgeInsets.all(30),
          content: Text(_errorMessage),
          duration: Duration(seconds: 3),
        ),
      );
      showDialog(
          context: ctx,
          builder: (ctx1) {
            return AlertDialog(
              title: Text('Error'),
              content: Text(_errorMessage),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(ctx1).pop();
                  },
                  child: const Text('Close'),
                ),
              ],
            );
          });
              }
  }
}
