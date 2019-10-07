import 'package:flutter/material.dart';

class Chats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 15,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            leading: Image.asset("assets/images/belletmen.png"),
            title: Text("Kadir BEKAR"),
            subtitle: Text("Hey man, how you doing"),
            trailing: Text("Yesterday"),
          ),
        );
      },
    );
  }
}
