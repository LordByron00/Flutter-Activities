import 'package:flutter/material.dart';
import 'package:facebookmimic/models/user_data.dart'; // Import the user data file

void main() {
  print('Total users: ${users.length}');
  for (var user in users) {
    print('${user.name} has ${user.posts.length} posts.');
  }

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
              // const Icon(Icons.facebook, color: Colors.blue),
              const SizedBox(width: 8),
              Text('Facebook',
                  style: TextStyle(color: Colors.blue, fontSize: 20)),
              Spacer(), // Add space between icon and text
              Icon(Icons.add_circle_sharp, color: Colors.black),
              SizedBox(width: 15),
              const Icon(Icons.search, color: Colors.black),
              SizedBox(width: 15),
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
    return ListView(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          elevation: 2,
          // margin: const EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(
                      'assets/images/profile.jpg'), // User profile pic
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Colors.grey, width: 1)),
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: "What's on your mind?",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.photo_rounded, color: Colors.green),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 165,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(users.length, (index) {
                return Card(
                  clipBehavior: Clip.hardEdge,
                  color: Colors.grey,
                  child: SizedBox(
                    height: double.infinity,
                    width: 95,
                    child: Stack(
                      children: [
                        Positioned(
                            child: Image.asset(
                          users[index].stories[0].image,
                          fit: BoxFit.cover,
                          height: double.infinity,
                        )),
                        Positioned(
                          top: 5,
                          left: 12,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundImage: AssetImage(
                                users[index].profile), // Story images
                          ),
                        ),
                        Positioned(
                          bottom: 15,
                          left: 10,
                          child: Text(users[index].name,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10)),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
        ListView.builder(
          physics:
              NeverScrollableScrollPhysics(), // Disable scrolling within ListView
          shrinkWrap: true, // Allow ListView to fit inside the parent
          itemCount: users.length, // Number of posts
          itemBuilder: (context, index) {
            final user = users[index];
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                border: Border(
                  top: BorderSide(
                      color: const Color.fromARGB(255, 181, 181, 181),
                      width: 4.0),
                ),
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                margin: const EdgeInsets.all(0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(user.profile),
                      ),
                      title: Text(user.name),
                      subtitle: Text(user.posts[0].timePosted),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(user.posts[0].caption),
                    ),
                    Image.asset(
                      user.posts[0].images[0], // Post images
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: [
                          Wrap(
                            children: [
                              Image.asset(
                                user.posts[0].reactLogo,
                                width: 20,
                                height: 20,
                              ),
                              Text('${user.posts[0].reactions}')
                            ],
                          ),
                          Spacer(),
                          Text('${user.posts[0].comments} comments'),
                          SizedBox(width: 20),
                          Text('${user.posts[0].shares} shares')
                        ],
                      ),
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextButton.icon(
                          icon: Image.asset(
                            'assets/icons/like.png',
                            width: 14,
                            height: 13,
                          ),
                          label: Text(
                            "Like",
                            style: TextStyle(
                                color: Color.fromARGB(255, 78, 78, 78)),
                          ),
                          onPressed: () {},
                        ),
                        TextButton.icon(
                          icon: Image.asset(
                            'assets/icons/comment.png',
                            width: 15,
                            height: 13,
                          ),
                          label: Text("Comment"),
                          onPressed: () {},
                        ),
                        TextButton.icon(
                          icon: Image.asset(
                            'assets/icons/send.png',
                            width: 12,
                            height: 13,
                          ),
                          label: Text("Send"),
                          onPressed: () {},
                        ),
                        TextButton.icon(
                          icon: Image.asset(
                            'assets/icons/share.png',
                            width: 15,
                            height: 15,
                          ),
                          label: Text("Send"),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        )
      ],
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
        'profileImage': 'assets/images/peter.jpg',
        'name': 'Peter Griffin',
        'mutualFriends': 2,
      },
      {
        'profileImage': 'assets/images/butcher.jpg',
        'name': 'Billy Butcher',
        'mutualFriends': 3,
      },
      {
        'profileImage': 'assets/images/vader.jpg',
        'name': 'Darth Vader',
        'mutualFriends': 2,
      },
      {
        'profileImage': 'assets/images/geralt.jpg',
        'name': 'Geralt of Rivia',
        'mutualFriends': 6,
      },
      {
        'profileImage': 'assets/images/danielle.jpg',
        'name': 'Danielle Marsh',
        'mutualFriends': 3,
      },
      {
        'profileImage': 'assets/images/nami.jpg',
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
    return ListView(
      // crossAxisAlignment: CrossAxisAlignment.start,
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
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: const Color.fromARGB(255, 125, 125, 125), // Line color
                width: 6.0, // Line thickness
              ),
            ),
          ),
          child: Container(
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
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey, // Line color
                      width: 1.0, // Line thickness
                    ),
                  ),
                ),
                // color: const Color.fromARGB(255, 95, 110, 122),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(7),
                      alignment: Alignment.center,
                      width: 75,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 169, 188, 201),
                      ),
                      child: Text(
                        'Posts',
                        style: TextStyle(
                            fontSize: 18,
                            color: const Color.fromARGB(255, 0, 42, 76)),
                      ),
                    ),
                    SizedBox(width: 15),
                    Text(
                      'Photos',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(width: 15),
                    Text(
                      'Videos',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  'Details',
                  style: TextStyle(fontSize: 22),
                ),
              ),
              Row(
                children: [
                  SizedBox(width: 5),
                  Image.asset(
                    'assets/icons/ig.png',
                    width: 17,
                    height: 17,
                    color: Colors.black,
                  ),
                  SizedBox(width: 15),
                  Text(
                    'Usernotfound000',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Icon(
                    Icons.school,
                    // size: 25,
                  ),
                  SizedBox(width: 15),
                  Text('Studied at University of Mindanao'),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Icon(Icons.home_rounded),
                  SizedBox(width: 15),
                  RichText(
                      text: TextSpan(text: 'Lives in ', children: [
                    TextSpan(
                        text: 'Davao City',
                        style: TextStyle(fontWeight: FontWeight.bold))
                  ])),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Row(
                  children: [
                    Icon(Icons.keyboard_control_outlined),
                    SizedBox(width: 15),
                    Text('See Lord Bayron\'s About Info')
                  ],
                ),
              )
            ],
          ),
        )
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
        'profileImage': 'assets/images/sheldon.jpg',
        'reaction': 'like',
      },
      {
        'message': 'Hanni Pham reacted to your photo.',
        'time': '10 mins ago',
        'profileImage': 'assets/images/hanni.jpg',
        'reaction': 'love',
      },
      {
        'message': 'George Cooper updated his profile picture.',
        'time': '1 hour ago',
        'profileImage': 'assets/images/george.jpg',
        'reaction': 'update',
      },
      {
        'message': 'Hanni Pham reacted to your story.',
        'time': '5 hours ago',
        'profileImage': 'assets/images/hanni.jpg',
        'reaction': 'wow',
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
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: _getReactionIcon(reaction),
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
      onTap: () {},
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
