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
          bottom: TabBar(
            indicatorColor: Colors.white, // Color of the selected tab underline
            tabs: [
              const Tab(
                  icon: Icon(
                Icons.home_filled,
                size: 30,
              )),
              const Tab(
                  icon: Icon(
                Icons.group,
                size: 30,
              )),
              const Tab(
                  icon: Icon(
                Icons.person,
                size: 30,
              )),
              const Tab(
                  icon: Icon(
                Icons.notifications,
                size: 30,
              )),
              Tab(
                child: Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: const Color.fromARGB(255, 83, 83, 83),
                              width: 3)),
                      child: CircleAvatar(
                        radius: 13,
                        backgroundImage:
                            AssetImage('assets/images/profile.jpg'),
                      ),
                    ),
                    Positioned(
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 1)),
                        child: CircleAvatar(
                          radius: 8,
                          backgroundColor:
                              const Color.fromARGB(255, 80, 80, 80),
                          child: Icon(
                            Icons.menu,
                            size: 10,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
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
// every step i take
class FriendsTab extends StatelessWidget {
  const FriendsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> friendRequests = [
      {
        'profileImage':
            'assets/images/peter.jpg', 
        'name': 'Peter Griffin',
        'mutualFriends': 2,
      },
      {
        'profileImage':
            'assets/images/butcher.jpg', 
        'name': 'Billy Butcher',
        'mutualFriends': 3,
      },
      {
        'profileImage':
            'assets/images/vader.jpg', 
        'name': 'Darth Vader',
        'mutualFriends': 2,
      },
      {
        'profileImage':
            'assets/images/geralt.jpg', 
        'name': 'Geralt of Rivia',
        'mutualFriends': 6,
      },
      {
        'profileImage':
            'assets/images/danielle.jpg', 
        'name': 'Danielle Marsh',
        'mutualFriends': 3,
      },
      {
        'profileImage':
            'assets/images/nami.jpg',
        'name': 'Nami',
        'mutualFriends': 5,
      },
    ];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Text(
                  'Friend Requests',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '(${friendRequests.length})', // Number of friend requests
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: friendRequests.length,
            itemBuilder: (context, index) {
              final request = friendRequests[index];
              return FriendRequestTile(
                profileImage: request['profileImage']!,
                name: request['name']!,
                mutualFriends: request['mutualFriends']!,
              );
            },
          ),
        ],
      ),
    );
  }
}

class FriendRequestTile extends StatelessWidget {
  final String profileImage;
  final String name;
  final int mutualFriends;

  const FriendRequestTile({
    super.key,
    required this.profileImage,
    required this.name,
    required this.mutualFriends,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(profileImage), // Profile picture
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '$mutualFriends mutual friends', // Unique mutual friends count
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const Text(
                  'Confirm',
                  style: TextStyle(
                    color: Colors.white, // White text for Confirm button
                  ),
                ),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const Text(
                  'Delete',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
        SizedBox(
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
                        width: 3,
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
                bottom: 10,
                left: 120,
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 1.5)),
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.grey,
                    child: Icon(
                      Icons.camera_alt,
                      color: const Color.fromARGB(255, 22, 22, 22),
                      size: 20,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 70,
                left: 300,
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 1.5)),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.grey,
                    child: Icon(
                      Icons.camera_alt,
                      color: const Color.fromARGB(255, 22, 22, 22),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Lord Bayron',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text('165 friends'),
              Text(
                ' I am Batman!',
                style: TextStyle(fontSize: 18),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 120,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Stack(
                              children: [
                                Image.asset(
                                  'assets/images/dprian.jpg',
                                  width: 40,
                                  height: 40,
                                  fit: BoxFit.cover,
                                ),
                                Icon(
                                  Icons.play_arrow_rounded,
                                  color: Colors.white,
                                  size: 27,
                                ),
                              ],
                            ),
                            Wrap(direction: Axis.vertical, children: [
                              Text(
                                'Insanity',
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                'DPR IAN',
                                style: TextStyle(fontSize: 13),
                              ),
                            ]),
                          ]),
                    ),
                    Icon(Icons.keyboard_control_sharp)
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.blue),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Add to story',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.edit,
                            size: 20,
                          ),
                          SizedBox(width: 4),
                          Text('Edit profile')
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey),
                      child: Icon(
                        Icons.keyboard_control,
                      )),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
// NO!tifications
class NotificationsTab extends StatelessWidget {
  const NotificationsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> notifications = [
      {
        'message': 'Sheldon Cooper liked your post "#Bazinga".',
        'time': '2 mins ago',
        'profileImage':
            'assets/images/sheldon.jpg', 
        'reaction': 'like', 
      },
      {
        'message': 'Hanni Pham reacted to your photo.',
        'time': '10 mins ago',
        'profileImage':
            'assets/images/hanni.jpg', 
        'reaction': 'love', 
      },
   {
        'message': 'George Cooper updated his profile picture.',
        'time': '1 hour ago',
        'profileImage':
            'assets/images/george.jpg', 
        'reaction': 'update', 
      },
      {
        'message': 'Hanni Pham reacted to your story.',
        'time': '5 hours ago',
        'profileImage':
            'assets/images/hanni.jpg', 
        'reaction': 'wow', 
      },
      {
        'message': 'Hanni Pham reacted to your photo.',
        'time': '10 mins ago',
        'profileImage':
            'assets/images/hanni.jpg', 
        'reaction': 'love', 
      },
      {
        'message': 'Hanni Pham reacted to your photo.',
        'time': '10 mins ago',
        'profileImage':
            'assets/images/hanni.jpg', 
        'reaction': 'love', 
      },
      {
        'message': 'Hanni Pham reacted to your photo.',
        'time': '10 mins ago',
        'profileImage':
            'assets/images/hanni.jpg', 
        'reaction': 'love', 
      },
       {
        'message': 'Hanni Pham reacted to your photo.',
        'time': '10 mins ago',
        'profileImage': 'assets/images/hanni.jpg',
        'reaction': 'love',
      },
       {
        'message': 'Hanni Pham reacted to your photo.',
        'time': '10 mins ago',
        'profileImage': 'assets/images/hanni.jpg',
        'reaction': 'love',
      },
       {
        'message': 'Hanni Pham reacted to your photo.',
        'time': '10 mins ago',
        'profileImage': 'assets/images/hanni.jpg',
        'reaction': 'love',
      },
       {
        'message': 'Hanni Pham reacted to your photo.',
        'time': '10 mins ago',
        'profileImage': 'assets/images/hanni.jpg',
        'reaction': 'love',
      },
       {
        'message': 'Hanni Pham reacted to your photo.',
        'time': '10 mins ago',
        'profileImage': 'assets/images/hanni.jpg',
        'reaction': 'love',
      },
       {
        'message': 'Hanni Pham reacted to your photo.',
        'time': '10 mins ago',
        'profileImage': 'assets/images/hanni.jpg',
        'reaction': 'love',
      },
       {
        'message': 'Hanni Pham reacted to your photo.',
        'time': '10 mins ago',
        'profileImage': 'assets/images/hanni.jpg',
        'reaction': 'love',
      },
       {
        'message': 'Hanni Pham reacted to your photo.',
        'time': '10 mins ago',
        'profileImage': 'assets/images/hanni.jpg',
        'reaction': 'love',
      },
       {
        'message': 'Hanni Pham reacted to your photo.',
        'time': '10 mins ago',
        'profileImage': 'assets/images/hanni.jpg',
        'reaction': 'love',
      },
       {
        'message': 'Hanni Pham reacted to your photo.',
        'time': '10 mins ago',
        'profileImage': 'assets/images/hanni.jpg',
        'reaction': 'love',
      },
      
    ];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: notifications.map((notification) {
          return NotificationTile(
            message: notification['message']!,
            time: notification['time']!,
            profileImage: notification['profileImage']!,
            reaction: notification['reaction']!, // Passing the reaction type
          );
        }).toList(),
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final String message;
  final String time;
  final String profileImage;
  final String
      reaction; // Added reaction to differentiate between different reactions

  const NotificationTile({
    super.key,
    required this.message,
    required this.time,
    required this.profileImage,
    required this.reaction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              // Profile image
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(profileImage), // Profile picture
              ),
              
              if (reaction != 'update') ...[
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(
                        4), 
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue, 
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: _getReactionIcon(
                        reaction), 
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  time,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Function to return the correct reaction icon
Widget _getReactionIcon(String reaction) {
    String imagePath = '';

    // Assign the appropriate image path based on the reaction type
    switch (reaction) {
      case 'like':
        imagePath = 'assets/icons/like.png';
        break;
      case 'love':
        imagePath = 'assets/icons/love.png';
        break;
      case 'haha':
        imagePath = 'assets/icons/haha.png';
        break;
      case 'sad':
        imagePath = 'assets/icons/sad.png';
        break;
      case 'wow':
        imagePath = 'assets/icons/wow.png';
        break;
      case 'angry':
        imagePath = 'assets/icons/angry.png';
        break;
      case 'update':
        imagePath = 'assets/icons/update.png';
        break;
      default:
        return Container(); 
    }

    return GestureDetector(
      onTap: () {
    
      },
      child: Container(
        padding: EdgeInsets.all(0), 
        margin: EdgeInsets.all(0), 
        decoration: BoxDecoration(

          border: Border.all(color: Colors.transparent),
          color: Colors.transparent,
        ),
        child: Image.asset(
          imagePath,
          width: 20, 
          height: 20, 
          fit: BoxFit.cover, 
        ),
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
