import 'package:flutter/material.dart';
import './pages/contacts.dart';
import 'models/person.dart';
import 'utils/strings.dart';

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

  static List<Person> allPeople;
  @override
  Widget build(BuildContext context) {
    allPeople = createSourceOfTheList();
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
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Contacts()));
          },
          child: Icon(
            Icons.chat,
            color: Colors.white,
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            buildList(),
            Container(
              alignment: Alignment.center,
              color: Colors.pink,
              child: Text("STATUS"),
            ),
            Container(
              alignment: Alignment.center,
              color: Colors.purple,
              child: Text("CALLS"),
            ),
          ],
        ),
      ),
    );
  }

  TabBar tabBarim() {
    return TabBar(
      labelColor: Colors.white,
      indicatorColor: Colors
          .white, //Tabbar sayfalar arasında geçişlerde arka plan rengini değiştirir.
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

  List<Person> createSourceOfTheList() {
    List<Person> people = [];

    for (int i = 0; i < 7; i++) {
      String smallPicture =
          Strings.PERSON_NAME[i].toLowerCase() + "${i + 1}.png";

      Person add = Person(
          Strings.PERSON_NAME[i], Strings.PERSON_MESSAGE[i], smallPicture);
      people.add(add);
    }
    return people;
  }

  buildList() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return oneLineList(context, index);
      },
      itemCount: allPeople.length,
    );
  }

  oneLineList(BuildContext context, int index) {
    Person currentPerson = allPeople[index];
    return Padding(
      padding: EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          border: Border(
            bottom: BorderSide(width: 1.0,),
            top: BorderSide(width: 1.0,),
            right: BorderSide(width: 1.0,),
            left: BorderSide(width: 1.0,),
          ),
        ),
        child: Card(
          margin: EdgeInsets.all(3.0),
          elevation: 4.0,
          child: ListTile(
            leading: Image.asset(
              "assets/images/" + currentPerson.smallPicture,
              width: 55.0,
              height: 55.0,
            ),
            title: Text(currentPerson.personName,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),),
            subtitle: Padding(
              padding: EdgeInsets.all(3.0),
              child: Text(
                currentPerson.personMessage,
                style: TextStyle(
                    fontFamily: 'Rock',
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            trailing: Text(
              "Yesterday",
              style: TextStyle(fontFamily: 'Rock', fontSize: 17.0),
            ),
          ),
        ),
      ),
    );
  }
}
