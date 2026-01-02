import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late TabController tabController;
  int currentIndex = 0;
  bool isExpanded = false;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
    tabController.addListener(() {
      setState(() {
        currentIndex = tabController.index;
      });
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.add, size: 30)),
          IconButton(onPressed: () {}, icon: Icon(Icons.search, size: 30)),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications, size: 30),
          ),
        ],
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.blueAccent,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        bottom: TabBar(
          controller: tabController,
          tabs: [
            Tab(
              icon: Icon(
                Icons.home,
                color: currentIndex == 0 ? Colors.blue : Colors.black,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.ondemand_video,
                color: currentIndex == 1 ? Colors.blue : Colors.black,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.people,
                color: currentIndex == 2 ? Colors.blue : Colors.black,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.person,
                color: currentIndex == 3 ? Colors.blue : Colors.black,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.notifications,
                color: currentIndex == 4 ? Colors.blue : Colors.black,
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          buildHomeTab(),
          buildVideosTab(),
          buildFriendsTab(),
          buildProfileTab(),
          buildNotificationsTab(),
        ],
      ),
    );
  }
}

Widget buildHomeTab() {
  return SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(),
          padding: const EdgeInsets.symmetric(horizontal: 10),

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
          decoration: const BoxDecoration(color: Colors.white),
          padding: const EdgeInsets.all(4),
          child: SizedBox(
            height: 300,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                buildStories(
                  'https://images.unsplash.com/photo-1506744038136-46273834b3fb',
                  'https://randomuser.me/api/portraits/men/1.jpg',
                  'John',
                ),
                buildStories(
                  'https://images.unsplash.com/photo-1511765224389-37f0e77cf0eb',
                  'https://randomuser.me/api/portraits/women/2.jpg',
                  'Emma',
                ),
                buildStories(
                  'https://images.unsplash.com/photo-1494790108377-be9c29b29330',
                  'https://randomuser.me/api/portraits/women/3.jpg',
                  'Olivia',
                ),
                buildStories(
                  'https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91',
                  'https://randomuser.me/api/portraits/men/4.jpg',
                  'Liam',
                ),
                buildStories(
                  'https://images.unsplash.com/photo-1524504388940-b1c1722653e1',
                  'https://randomuser.me/api/portraits/women/5.jpg',
                  'Ava',
                ),
              ],
            ),
          ),
        ),
        PostWidget(
          accountName: 'Account Name',
          time: '4d',
          text: 'this is a text descrription for the following content.',
        ),
        PostWidget(
          accountName: 'Account Name',
          time: '4d',
          text: 'this is a text descrription for the following content.',
        ),
        buildReels(),
      ],
    ),
  );
}

Widget buildVideosTab() {
  return SingleChildScrollView();
}

Widget buildFriendsTab() {
  return SingleChildScrollView();
}

Widget buildProfileTab() {
  return SingleChildScrollView();
}

Widget buildNotificationsTab() {
  return SingleChildScrollView();
}

Widget buildStories(String imageUrl, String profileUrl, String name) {
  return Padding(
    padding: EdgeInsetsGeometry.symmetric(horizontal: 4.0),
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(
            imageUrl,
            width: 150,
            height: 250,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 8,
          left: 8,
          child: CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(profileUrl),
          ),
        ),
        Positioned(
          top: 220,
          left: 8,
          child: Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  blurRadius: 5,
                  color: Colors.black,
                  offset: Offset(0, 0),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

class PostWidget extends StatefulWidget {
  final String accountName;
  final String time;
  final String text;

  const PostWidget({
    super.key,
    required this.accountName,
    required this.time,
    required this.text,
  });

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  widget.accountName,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              _dot(),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Follow',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              children: [
                                Text(widget.time),
                                const SizedBox(width: 4),
                                _dot(),
                                const SizedBox(width: 4),
                                const Icon(Icons.circle, size: 12),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.more_horiz),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  ),
                ],
              ),

              /// Post text
              Text(
                widget.text,
                maxLines: isExpanded ? null : 2,
                overflow: isExpanded
                    ? TextOverflow.visible
                    : TextOverflow.ellipsis,
              ),
            ],
          ),
        ),

        Container(width: double.infinity, height: 400, color: Colors.blueGrey),

        likesAndShares('6.4K', '92', '215', '651K'),
        buildBottomRow(),
      ],
    );
  }

  Widget _dot() {
    return Container(
      width: 3,
      height: 3,
      decoration: const BoxDecoration(
        color: Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}

Widget likesAndShares(
  String likes,
  String shares,
  String comments,
  String views,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      TextButton.icon(
        onPressed: () {},
        icon: Icon(Icons.thumb_up),
        label: Text(likes),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(onPressed: () {}, child: Text('$comments comments')),
          TextButton(onPressed: () {}, child: Text('$shares shares')),
          TextButton(onPressed: () {}, child: Text('$views views')),
        ],
      ),
    ],
  );
}

Widget buildBottomRow() {
  return Row(
    children: [
      Expanded(
        child: TextButton.icon(
          onPressed: () {},
          icon: Icon(Icons.thumb_up),
          label: Text('Like'),
        ),
      ),
      Expanded(
        child: TextButton.icon(
          onPressed: () {},
          icon: Icon(Icons.comment),
          label: Text('Comment'),
        ),
      ),
      Expanded(
        child: TextButton.icon(
          onPressed: () {},
          icon: Icon(Icons.share),
          label: Text('Share'),
        ),
      ),
    ],
  );
}

Widget buildReels() {
  return Container(
    padding: EdgeInsets.all(10),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.ondemand_video_rounded),
                SizedBox(width: 10),
                Text('Reels'),
              ],
            ),

            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_horiz),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 350,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              actualReels(),
              actualReels(),
              actualReels(),
              actualReels(),
              actualReels(),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget actualReels() {
  return Padding(
    padding: EdgeInsetsGeometry.all(4),
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(width: 200, height: 300, color: Colors.black),
        ),
        Positioned(
          top: 4,
          right: 4,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_horiz, color: Colors.white),
          ),
        ),
      ],
    ),
  );
}
