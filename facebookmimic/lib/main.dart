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
            indicator: const UnderlineTabIndicator(
              borderSide: BorderSide(
                  width: 4.0, color: Colors.blue), // Blue line highlight
            ),
            unselectedLabelColor: Colors.grey, // Grey for inactive tabs
            labelColor: Colors.blue, // Blue for active tab
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
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(width: 35),
              Text(
                'Lord Bayron',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Container(
                width: 25,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(20)),
                child: Text("9+", style: TextStyle(color: Colors.white)),
              ),
              Icon(
                Icons.arrow_drop_down_outlined,
                size: 35,
              ),
              CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 185, 185, 185),
                child: Stack(children: [
                  Icon(
                    Icons.person,
                    size: 30,
                    color: const Color.fromARGB(255, 16, 16, 16),
                  ),
                  Positioned(
                      bottom: -3,
                      right: -3,
                      child: CircleAvatar(
                        maxRadius: 10,
                        backgroundColor:
                            const Color.fromARGB(255, 185, 185, 185),
                        child: Icon(
                          Icons.edit,
                          size: 13,
                          color: Color.fromARGB(255, 16, 16, 16),
                          // fill: 1,
                        ),
                      )),
                ]),
              )
            ],
          ),
        ),
        Container(
          height: 280,
          child: Stack(
            children: [
              Image.asset(
                'assets/images/dieforme.png',
                fit: BoxFit.cover,
                width: double.infinity,
                height: 220,
              ),
              Positioned(
                left: 25,
                top: 130,
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      )),
                  child: CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.black,
                    backgroundImage: AssetImage(
                      'assets/images/profile.jpg',
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 70,
                left: 300,
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.camera_alt,
                    color: const Color.fromARGB(255, 22, 22, 22),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
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
