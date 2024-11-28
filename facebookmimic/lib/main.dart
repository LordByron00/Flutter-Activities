import 'package:facebookmimic/pages/newsfeed_page.dart';
import 'package:facebookmimic/pages/profile_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FacebookCloneApp());
}

class FacebookCloneApp extends StatelessWidget {
  const FacebookCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Facebook Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily:
            'Roboto', // Facebook uses a sans-serif font similar to Roboto.
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const NewsFeedPage(),
        '/profile': (context) => const ProfilePage(),
      },
    );
  }
}
