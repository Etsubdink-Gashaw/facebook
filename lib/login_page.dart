import 'package:facebook/language_bar.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String language = 'English';
  void _showModalBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => LanguageBar(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white10,
      body: Center(
        child: Container(
          width: 450,
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: _showModalBottomSheet,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(language),
                        Icon(Icons.keyboard_arrow_down_rounded),
                      ],
                    ),
                  ),
                  SizedBox(height: 80),
                  Icon(Icons.facebook, color: Colors.blueAccent, size: 72),
                  SizedBox(height: 80),
                  Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Mobile number or email',
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.info_outline),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.remove_red_eye_outlined),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {},

                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 50),
                        ),
                        child: Text('Log in'),
                      ),
                      SizedBox(height: 10),
                      TextButton(
                        onPressed: () {},
                        child: Text('Forgot password?'),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                    ),
                    onPressed: () {},
                    child: Text('Create new account'),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
