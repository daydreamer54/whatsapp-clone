import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: tabBarim(),
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
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            ListView.builder(
              itemCount: 7,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  child: Card(
                    child: ListTile(
                      leading: Image.asset("assets/images/belletmen.png"),
                      title: Text("Kadir BEKAR",style: TextStyle(fontSize: 18.0,fontFamily: 'Gayathiri'),),
                      subtitle: Text("Hey man, how you doing",style: TextStyle(fontFamily: 'Rock',fontSize: 17.0),),
                      trailing: Text("Yesterday",style: TextStyle(fontFamily: 'Gayathiri'),),
                    ),
                  ),
                  padding: EdgeInsets.all(3.0),
                );
              },
            ),
            Container(
              alignment: Alignment.center,
              color: Colors.pink,
              child: Text("Page 2"),
            ),
            Container(
              alignment: Alignment.center,
              color: Colors.purple,
              child: Text("Page 3"),
            ),
          ],
        ),
      ),
    );
  }

  TabBar tabBarim() {
    return TabBar(
      labelColor: Colors.white,
      indicatorColor: Colors.white, //Tabbar sayfalar arasında geçişlerde arka plan rengini değiştirir.
      controller: _tabController,
      tabs: <Widget>[
        Tab(
          child: Text("CHATS"),
        ),
        Tab(
          child: Text("STATUS"),
        ),
        Tab(
          child: Text("CALLS"),
        ),
      ],
    );
  }
}
