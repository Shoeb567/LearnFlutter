

import 'package:flutter/material.dart';
import 'package:flutter_app_firebase/screens/GetandDelete/GetApiDemo.dart';
import 'package:flutter_app_firebase/screens/JsonParse/GetpiData.dart';
import 'package:flutter_app_firebase/screens/JsonParse/JsonParseDemo.dart';
import 'package:flutter_app_firebase/screens/JsonParse/PutMethod.dart';
import 'package:flutter_app_firebase/screens/cldScreene/DataBaseDemo/ShowData.dart';
import 'package:flutter_app_firebase/screens/designscreens/listView.dart';
import 'package:flutter_app_firebase/screens/designscreens/tabView.dart';
import 'package:flutter_app_firebase/screens/homescreen.dart';


class TabViewAPIDemo extends StatefulWidget {
  // final User value;

  //TabView({Key key, this.value});

  @override
  _TabViewAPIDemoState createState() => _TabViewAPIDemoState();
}

Color primarycolor = Color(0xff109618);

class _TabViewAPIDemoState extends State<TabViewAPIDemo> {
  final getemail;

  _TabViewAPIDemoState({this.getemail});




  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          key: _scaffoldKey,
          endDrawerEnableOpenDragGesture: false,
          appBar: AppBar(
            backgroundColor:  Color.fromRGBO(150, 170, 105, 5),
            title: Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              //child: gogleAppBar(),
            ),
            leading: new IconButton(
              icon: new Icon(Icons.arrow_back),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder:(context) {
                return TabView();
              },)),
            ),

            bottom: TabBar(
              indicatorPadding: EdgeInsets.only(top: 5),
              labelColor: Colors.redAccent,
              unselectedLabelColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  // bottomRight: Radius.circular(10),
                  // bottomLeft: Radius.circular(10)
                ),
                color: Colors.white,
              ),
              isScrollable: true,
              onTap: (index) {
                setState(() {
                  switch (index) {
                    case 0:
                      primarycolor = Color.fromRGBO(150, 170, 105, 5);
                      break;
                    case 1:
                      primarycolor =Color.fromRGBO(150, 170, 105, 5);
                      break;
                    case 2:
                      primarycolor = Color.fromRGBO(150, 170, 105, 5);
                      break;
                    case 3:
                      primarycolor = Color.fromRGBO(150, 170, 105, 5);
                      break;
                    case 4:
                      primarycolor = Color.fromRGBO(150, 170, 105, 5);
                      break;
                  }
                });
              },
              //unselectedLabelColor: Colors.white.withOpacity(0.3),
              //indicatorColor: Colors.white,
              //indicatorWeight: 5,
              tabs: [
                Tab(
//                    icon: Icon(
//                      Icons.list,
//                      color: Colors.white,
//                    ),
                    text: '  API Fatch  '),

                Tab(
//                    icon: Icon(
//                      Icons.credit_card,
//                      color: Colors.white,
//                    ),
                    text: '  Post API  '),
                Tab(
                  //    icon: Icon(Icons.app_registration, color: Colors.white),
                    text: '  Put API  '),
                Tab(
                  //    icon: Icon(Icons.app_registration, color: Colors.white),
                    text: ' Delete API  '),

              ],
            ),
          ),
          body: TabBarView(
            children: [
              JsonParseDemo(),
              PostApiData(),
              PutMethod(),
              GetApiDemo(),
              //Mapdata()
            ],
          ),
          drawer: Drawer(
            child: Container(
              /*  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.grey,Colors.orange],
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,

                    )
                ),*/
              child: ListView(
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: <Color>[
                        Colors.purpleAccent,
                        Colors.deepOrangeAccent
                      ]),
                    ),
                    otherAccountsPictures: [
                      CircleAvatar(
                        // backgroundImage: AssetImage('images/logo.jpg'),
                        backgroundColor: Colors.white,
                        child: Text('S',
                            style:
                            TextStyle(fontSize: 20, color: Colors.black45)),

                      )
                    ],
                    accountName: Text('Welcome',style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                    ),),
                    // accountEmail: Text(widget.value.demomail),
                    accountEmail: Text('Shoeb Shaikh'),
                    currentAccountPicture: GestureDetector(

                      child: new CircleAvatar(
                          backgroundImage: AssetImage('images/flutter.png')),


                      //backgroundColor: Colors.orangeAccent,
                      //child: Text('S',style: TextStyle(fontSize: 40)),
                    ),
                  ),
                  ListTile(
                    //subtitle: Text('Choose One'),
                    leading: Icon(Icons.api),

                    title: Text('Api Fatch'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => new ListViewDemo()));
                    },
                  ),
                  ListTile(
//                    leading: CircleAvatar(
//                      backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgJ_8d9MZOee_n3p3uSqAw7Z4d9MVMD44lWw&usqp=CAU'),
//                    ),
                    leading: Icon(Icons.data_usage),
                    title: Text('Databse with SQLite'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => new ShowDatabaseApp()));
                    },
                  ),
                  ListTile(

//                    leading: CircleAvatar(
//                      backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8WsnzMhW0-XYU8gpM55RxqcH78rv9diMbGQ&usqp=CAU'),
//                    ),
                    leading: Icon(Icons.dashboard),
                    title: Text('Database with Firebase'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    },
                  ),
                  ListTile(
//                    leading: CircleAvatar(
//                      backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwzPRYAqSVasWids88z437BkTnLCEQz9nOCA&usqp=CAU'),
//                    ),
                    leading: Icon(Icons.logout),
                    title: Text('LogOut'),
                    onTap: () {
                      //  Navigator.pop(context);
//                      Navigator.push(context,
//                          MaterialPageRoute(builder: (context) => MyApp()));
                    },
                  ),
//                  ListTile(
//                    leading:CircleAvatar(
//                      backgroundImage: NetworkImage('https://icons-for-free.com/iconfiles/png/512/exit+to+icon-1320183325651831323.png'),
//                      backgroundColor: Colors.white,
//                    ) ,
//                    title: Text('Close NavigationBar'),
//                    onTap: () => Navigator.of(context).pop(),
//                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
