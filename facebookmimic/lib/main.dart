import 'package:flutter/material.dart';

void main() {
  runApp(const FacebookTopNavApp());
}

class FacebookTopNavApp extends StatelessWidget {
  const FacebookTopNavApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Facebook',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: const FacebookTopNavBar(),
    );
  }
}

class FacebookTopNavBar extends StatelessWidget {
  const FacebookTopNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(Icons.facebook, color: Colors.blue),
              const SizedBox(width: 8), // Add space between icon and text
              const Text('Facebook',
                  style: TextStyle(color: Colors.blue, fontSize: 20)),
              Icon(Icons.add_circle_sharp, color: Colors.black),
              const Icon(Icons.search, color: Colors.black),
              Image.asset('assets/icons/chat.png'),
            ],
          ),
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          bottom: const TabBar(
            indicatorColor: Colors.white, // Color of the selected tab underline
            tabs: [
              Tab(icon: Icon(Icons.home_filled)),
              Tab(icon: Icon(Icons.group)),
              Tab(icon: Icon(Icons.person)),
              Tab(icon: Icon(Icons.notifications)),
              Tab(icon: Icon(Icons.settings)),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            NewsfeedTab(),
            FriendsTab(),
            ProfileTab(),
            NotificationsTab(),
            SettingsTab(),
          ],
        ),
      ),
    );
  }
}

class NewsfeedTab extends StatelessWidget {
  const NewsfeedTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Newsfeed Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class FriendsTab extends StatelessWidget {
  const FriendsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Friends Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Profile Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class NotificationsTab extends StatelessWidget {
  const NotificationsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Notifications Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Settings Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
