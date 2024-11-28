import 'package:facebookmimic/pages/navbar.dart';
import 'package:flutter/material.dart';

class NewsFeedPage extends StatelessWidget {
  const NewsFeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Facebook', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[800],
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          // A sample post
          Card(
            elevation: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://i.pinimg.com/736x/32/eb/8a/32eb8a8072936e1a66922db5a25586c6.jpg'), // Sample profile picture
                  ),
                  title: Text('John Doe'),
                  subtitle: Text('2 hours ago'),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "This is a sample post. Flutter is awesome!",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Image.network(
                  'https://i.pinimg.com/736x/32/eb/8a/32eb8a8072936e1a66922db5a25586c6.jpg', // Sample post image
                  fit: BoxFit.cover,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.thumb_up_alt_outlined),
                      label: const Text('Like'),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.comment_outlined),
                      label: const Text('Comment'),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.share_outlined),
                      label: const Text('Share'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const Navbar(currentIndex: 0),
    );
  }
}
