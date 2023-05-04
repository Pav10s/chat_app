import 'package:chat_app/service/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GroupInfo extends StatefulWidget {
  final String groupId;
  final String groupName;
  final String adminName;
  const GroupInfo({
    super.key,
    required this.adminName,
    required this.groupName,
    required this.groupId,
  });

  @override
  State<GroupInfo> createState() => _GroupInfoState();
}

class _GroupInfoState extends State<GroupInfo> {
  Stream? members;
  @override
  void initState() {
    getMember();
    super.initState();
  }

  getMember() async {
    DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
        .getGroupMembers(widget.groupId)
        .then((val) {
      setState(() {
        members = val;
      });
    });
  }

  String getName(String res) {
    return res.substring(res.indexOf("_") + 1);
  }

  String getId(String res) {
    return res.substring(0, res.indexOf("_"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Group Info",
          style: TextStyle(fontSize: 14),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).primaryColor.withOpacity(0.2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Theme.of(context).primaryColor,
                    child: Text(
                      widget.groupName.substring(0, 1).toUpperCase(),
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Group: ${widget.groupName}",
                          style: const TextStyle(fontWeight: FontWeight.w500)),
                      Text("Admin: ${getName(widget.adminName)}")
                    ],
                  )
                ],
              ),
            ),
            memberList(),
          ],
        ),
      ),
    );
  }

  memberList() {
    return StreamBuilder(
        stream: members,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data["members"] != null) {
              if (snapshot.data["members"].length != 0) {
                return ListView.builder(
                    itemCount: snapshot.data["members"].length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 10),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 20,
                            backgroundColor: Theme.of(context).primaryColor,
                            child: Text(
                              getName(snapshot.data["members"][index])
                                  .substring(0, 1)
                                  .toUpperCase(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          title: Text(getName(snapshot.data["members"][index])),
                          subtitle:
                              Text(getId(snapshot.data["members"][index])),
                        ),
                      );
                    });
              } else {
                return const Center(
                  child: Text("No Members"),
                );
              }
            } else {
              return const Center(
                child: Text("No Members"),
              );
            }
          } else {
            return Center(
                child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ));
          }
        });
  }
}
