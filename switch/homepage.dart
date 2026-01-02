import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 39, 57, 255),

        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(color: Colors.yellow),
              padding: const EdgeInsets.all(10),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),

                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'What\'s on your mind?',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 20,
                          ),
                        ),
                      ),
                    ),
                  ),

                  IconButton(
                    icon: const Icon(Icons.photo_camera, color: Colors.green),
                    onPressed: () {
                      // Handle photo button press
                    },
                  ),
                ],
              ),
            ),

            Container(
              decoration: const BoxDecoration(color: Colors.purpleAccent),
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                height: 350, // 👈 give the list a fixed height
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    Card(
                      color: Colors.tealAccent,
                      child: SizedBox(
                        height: 350,
                        width: 200,
                        child: Center(
                          child: Text(
                            'Card 1',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.tealAccent,
                      child: SizedBox(
                        height: 350,
                        width: 200,
                        child: Center(
                          child: Text(
                            'Card 2',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.tealAccent,
                      child: SizedBox(
                        height: 350,
                        width: 200,
                        child: Center(
                          child: Text(
                            'Card 3',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.tealAccent,
                      child: SizedBox(
                        height: 350,
                        width: 200,
                        child: Center(
                          child: Text(
                            'Card 1',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.tealAccent,
                      child: SizedBox(
                        height: 350,
                        width: 200,
                        child: Center(
                          child: Text(
                            'Card 1',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.home, size: 32),
              onPressed: () {
                // Handle home button press
              },
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.search, size: 32)),
            IconButton(
              icon: const Icon(Icons.notifications, size: 32),
              onPressed: () {
                // Handle notifications button press
              },
            ),
            IconButton(
              icon: const Icon(Icons.person, size: 32),
              onPressed: () {
                // Handle profile button press
              },
            ),
          ],
        ),
      ),
    );
  }
}
