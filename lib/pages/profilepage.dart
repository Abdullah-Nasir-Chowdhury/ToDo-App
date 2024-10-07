import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[400],
        title: Text("Your Profile", style: TextStyle(color: Colors.white)),
        centerTitle: true,),
      body: Center(child: Container(child: Text("Profile Page")))
    );
  }
}
