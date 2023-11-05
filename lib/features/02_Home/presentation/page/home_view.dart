
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../../../common/string_manager.dart';
import '../../data/chat_user.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.user});
  final ChatUser user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(CupertinoIcons.home),
        title: const Text(StringManager.appTitle,),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.search)),
          IconButton(
              onPressed: () {}, icon: Icon(CupertinoIcons.ellipsis_vertical))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple.shade300,
        onPressed: () {}, child: const Icon(CupertinoIcons.text_bubble_fill, ),
      ),
    );
  }
}
