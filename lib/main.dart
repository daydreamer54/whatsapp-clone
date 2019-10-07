import 'package:flutter/material.dart';
import './pages/chat.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: "CHATS",
              ),
              Tab(
                text: "STATUS",
              ),
              Tab(
                text: "CALLS",
              ),
            ],
          ),
          backgroundColor: Colors.green[800],
          title: Text("Whatsapp"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                debugPrint("You have clicked on search button");
              },
            ),
            SizedBox(
              child: Padding(
                padding: EdgeInsets.only(left: 1.0),
              ),
            ),
            IconButton(
              onPressed: () {
                debugPrint("You have clicked on more_vert button");
              },
              icon: Icon(Icons.more_vert),
            ),
            SizedBox(
              child: Padding(
                padding: EdgeInsets.only(right: 5.0),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {},
          child: Icon(
            Icons.chat,
            color: Colors.white,
          ),
        ),
        body: Chats(),
      ),
    );
  }
}
