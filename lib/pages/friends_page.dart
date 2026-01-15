import 'package:flutter/material.dart';

class FriendsPage extends StatelessWidget {
  const FriendsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Friends'),
        actions: [IconButton(icon: const Icon(Icons.search), onPressed: () {})],
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          SectionHeader(title: 'Friend Requests'),
          friendRequest('Abebe Bekele', '5'),
          friendRequest('Kebede Tesfaye', '2'),
          friendRequest('Almaz Girma', '8'),

          SizedBox(height: 16),
          SectionHeader(title: 'People You May Know'),
          friendSuggestionCard('Daniel Smith', '10'),
          friendSuggestionCard('Emma Johnson', '4'),
          friendSuggestionCard('Olivia Brown', '7'),

          SizedBox(height: 16),
          SectionHeader(title: 'All Friends'),
          friendListTile(),
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}

Widget friendRequest(String name, String number) {
  return Card(
    elevation: 1,
    child: Padding(
      padding: EdgeInsets.all(12),
      child: Row(
        children: [
          CircleAvatar(radius: 28),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                Text('$number mutual friends'),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Confirm'),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        child: Text('Delete'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget friendSuggestionCard(String name, String mutualFriends) {
  return Card(
    child: ListTile(
      leading: const CircleAvatar(radius: 24),
      title: Text(name),
      subtitle: Text('$mutualFriends mutual friends'),
      trailing: SizedBox(
        width: 300,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('Add Friend')),
            SizedBox(width: 8),
            ElevatedButton(onPressed: () {}, child: const Text('Remove')),
          ],
        ),
      ),
    ),
  );
}

Widget friendListTile() {
  return ListTile(
    leading: Stack(
      children: const [
        CircleAvatar(radius: 22),
        Positioned(
          bottom: 0,
          right: 0,
          child: CircleAvatar(radius: 5, backgroundColor: Colors.green),
        ),
      ],
    ),
    title: const Text('Alex Johnson'),
    onTap: () {},
  );
}
