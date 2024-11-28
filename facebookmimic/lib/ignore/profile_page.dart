import 'package:facebookmimic/ignore/navbar.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.blue[800],
      ),
      body: ListView(
        children: [
          Container(
            color: Colors.blue[800],
            padding: const EdgeInsets.all(16),
            child: const Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      'https://i.pinimg.com/736x/32/eb/8a/32eb8a8072936e1a66922db5a25586c6.jpg'),
                ),
                SizedBox(height: 10),
                Text(
                  'John Doe',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                SizedBox(height: 5),
                Text(
                  'Flutter Developer',
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
              ],
            ),
          ),
          const ListTile(
            leading: Icon(Icons.edit),
            title: Text('Edit Profile'),
          ),
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
          const ListTile(
            leading: Icon(Icons.logout),
            title: Text('Log Out'),
          ),
        ],
      ),
      bottomNavigationBar: const Navbar(currentIndex: 1),
    );
  }
}
