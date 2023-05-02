import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class GroupTile extends StatefulWidget {
  final String userName;
  final String groupName;
  final String groupId;

  const GroupTile({
    super.key,
    required this.userName,
    required this.groupName,
    required this.groupId,
  });

  @override
  State<GroupTile> createState() => _GroupTileState();
}

class _GroupTileState extends State<GroupTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        nextScreen(
            context,
            ChatPage(
              groupId: widget.groupId,
              groupName: widget.groupName,
              userName: widget.userName,
            ));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            radius: 30,
            child: Text(
              widget.groupName.substring(0, 1).toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          title: Text(
            widget.groupName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            "join the conversation as ${widget.userName}",
            style: const TextStyle(fontSize: 13),
          ),
        ),
      ),
    );
  }
}
