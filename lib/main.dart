import 'package:facebook/login_page.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: LoginPage(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Tooltip(
              message: 'Facebook Icon',
              child: IconButton(
                onPressed: () => {},
                icon: Icon(Icons.facebook, size: 100, color: Colors.blueAccent),
              ),
            ),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyHomePage(title: 'facebook'),
                  ),
                ),
              },
              child: Text("Start"),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
