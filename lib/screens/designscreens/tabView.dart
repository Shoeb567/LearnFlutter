

import 'package:flutter/material.dart';
import 'package:flutter_app_firebase/screens/Provider/AddDataList.dart';
import 'package:flutter_app_firebase/screens/Provider/ProviderDemo.dart';
import 'package:flutter_app_firebase/screens/apiscreens/tabviewapiscreens.dart';
import 'package:flutter_app_firebase/screens/cldScreene/DataBaseDemo/ShowData.dart';
import 'package:flutter_app_firebase/screens/cldScreene/fatchclgscreen.dart';
import 'package:flutter_app_firebase/screens/cldScreene/profilepage.dart';
import 'package:flutter_app_firebase/screens/designscreens/GridViewDemo.dart';
import 'package:flutter_app_firebase/screens/designscreens/cardView.dart';

import 'package:flutter_app_firebase/screens/designscreens/listView.dart';
import 'package:flutter_app_firebase/screens/designscreens/mapwithList.dart';
import 'package:flutter_app_firebase/screens/designscreens/progressbar.dart';
import 'package:flutter_app_firebase/screens/designscreens/registraionForm.dart';
import 'package:flutter_app_firebase/screens/homescreen.dart';
import 'package:flutter_app_firebase/screens/loginscreen.dart';
//import 'cardView.dart';
//import 'listView.dart';
//import 'login.dart';
//import 'registraionForm.dart';
//import 'package:flutter_app/main.dart';
//import 'Drawer.dart';
//import 'GridViewDemo.dart';

class TabView extends StatefulWidget {
 // final User value;

  //TabView({Key key, this.value});

  @override
  _TabViewState createState() => _TabViewState();
}

Color primarycolor = Color(0xff109618);

class _TabViewState extends State<TabView> {
  final getemail;

  _TabViewState({this.getemail});

  /*gogleAppBar1() {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
                  child:Drawer(

                      /*decoration: BoxDecoration(
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
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black45)),
                              )
                            ],
                            accountName: Text(
                              'Welcome',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            // accountEmail: Text(widget.value.demomail),
                            accountEmail: Text('Shoeb Shaikh'),
                            currentAccountPicture: GestureDetector(
                              child: new CircleAvatar(
                                  backgroundImage:
                                      AssetImage('images/flutter.png')),

                              //backgroundColor: Colors.orangeAccent,
                              //child: Text('S',style: TextStyle(fontSize: 40)),
                            ),
                          ),
                          ListTile(
                            subtitle: Text('Choose One'),
                            leading: Icon(
                              Icons.list,
                              color: Colors.black,
                            ),
                            title: Text('TextViewDemo'),
                            onTap: () {
                              //Navigator.pop(context);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => new ListViewDemo()));
                            },
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.credit_card,
                              color: Colors.black,
                            ),
                            title: Text('CardViewDemo'),
                            onTap: () {
                              //  Navigator.pop(context);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => new CardView()));
                            },
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.login,
                              color: Colors.black,
                            ),
                            title: Text('LogIn'),
                            onTap: () {
                              // Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LogInScreen()));
                            },
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.home,
                              color: Colors.black,
                            ),
                            title: Text('HomePage'),
                            onTap: () {
                              //  Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyApp()));
                            },
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.close,
                              color: Colors.black,
                            ),
                            title: Text('Close NavigationBar'),
                            onTap: () => Navigator.of(context).pop(),
                          ),
                        ],
                      ),
                    ),


          ),
          Container(
            child: Text(
            'Search',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Container(
            child: IconButton(
              icon: Icon(Icons.mic),
              color: Colors.grey,
              onPressed: (){},
            ),
          ),
        ],
      ),
    );
  }*/

  gogleAppBar() {
    return Container(

      child: Container(
        padding: EdgeInsets.only(),
       // color:Colors.white,
        
        child: TextFormField(

          autocorrect: true,
          decoration: InputDecoration(
            hintText: 'Search...',
            hintStyle: TextStyle(color: Colors.grey),
            filled: true,
            fillColor: Colors.white70,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              borderSide: BorderSide(color: Colors.white, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: Colors.white),
            ),


//            prefixIcon: IconButton(
//                tooltip: 'Menu',
//                icon: Icon(Icons.menu),
//                color: Colors.grey,
//                onPressed: () {
//                  setState((){
//                    _scaffoldKey.currentState.openDrawer();
//                    Drawer(
//                      child: Container(
//                        /*  decoration: BoxDecoration(
//                    gradient: LinearGradient(
//                      colors: [Colors.grey,Colors.orange],
//                      begin: Alignment.bottomRight,
//                      end: Alignment.topLeft,
//
//                    )
//                ),*/
//                        child: ListView(
//                          children: <Widget>[
//                            UserAccountsDrawerHeader(
//                              decoration: BoxDecoration(
//                                gradient: LinearGradient(colors: <Color>[
//                                  Colors.purpleAccent,
//                                  Colors.deepOrangeAccent
//                                ]),
//                              ),
//                              otherAccountsPictures: [
//                                CircleAvatar(
//                                  // backgroundImage: AssetImage('images/logo.jpg'),
//                                  backgroundColor: Colors.white,
//                                  child: Text('S',
//                                      style: TextStyle(
//                                          fontSize: 20, color: Colors.black45)),
//                                )
//                              ],
//                              accountName: Text(
//                                'Welcome',
//                                style: TextStyle(
//                                    fontSize: 16,
//                                    fontWeight: FontWeight.bold,
//                                    color: Colors.black),
//                              ),
//                              // accountEmail: Text(widget.value.demomail),
//                              accountEmail: Text('Shoeb Shaikh'),
//                              currentAccountPicture: GestureDetector(
//                                child: new CircleAvatar(
//                                    backgroundImage:
//                                    AssetImage('images/flutter.png')),
//
//                                //backgroundColor: Colors.orangeAccent,
//                                //child: Text('S',style: TextStyle(fontSize: 40)),
//                              ),
//                            ),
//                            ListTile(
//                              subtitle: Text('Choose One'),
//                              leading: CircleAvatar(
//                                backgroundImage: NetworkImage(
//                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_LzlW2cDPaIY4KyXNZzbV4I6vxLKARvU18A&usqp=CAU'),
//                              ),
//                              title: Text('TextViewDemo'),
//                              onTap: () {
//                                //Navigator.pop(context);
////                                Navigator.of(context).push(MaterialPageRoute(
////                                    builder: (context) => new ListViewDemo()));
//                              },
//                            ),
//                            ListTile(
//                              leading: CircleAvatar(
//                                backgroundImage: NetworkImage(
//                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgJ_8d9MZOee_n3p3uSqAw7Z4d9MVMD44lWw&usqp=CAU'),
//                              ),
//                              title: Text('CardViewDemo'),
//                              onTap: () {
//                                //  Navigator.pop(context);
////                                Navigator.of(context).push(MaterialPageRoute(
////                                    builder: (context) => new CardView()));
//                              },
//                            ),
//                            ListTile(
//                              leading: CircleAvatar(
//                                backgroundImage: NetworkImage(
//                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8WsnzMhW0-XYU8gpM55RxqcH78rv9diMbGQ&usqp=CAU'),
//                              ),
//                              title: Text('LogIn'),
//                              onTap: () {
//                                // Navigator.pop(context);
////                                Navigator.push(
////                                    context,
////                                    MaterialPageRoute(
////                                        builder: (context) => LogInScreen()));
//                              },
//                            ),
//                            ListTile(
//                              leading: CircleAvatar(
//                                backgroundImage: NetworkImage(
//                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwzPRYAqSVasWids88z437BkTnLCEQz9nOCA&usqp=CAU'),
//                              ),
//                              title: Text('HomePage'),
//                              onTap: () {
//                                //  Navigator.pop(context);
////                                Navigator.push(
////                                    context,
////                                    MaterialPageRoute(
////                                        builder: (context) => MyApp()));
//                              },
//                            ),
//                            ListTile(
//                              leading: CircleAvatar(
//                                backgroundImage: NetworkImage(
//                                    'https://icons-for-free.com/iconfiles/png/512/exit+to+icon-1320183325651831323.png'),
//                                backgroundColor: Colors.white,
//                              ),
//                              title: Text('Close NavigationBar'),
//                              onTap: () => Navigator.of(context).pop(),
//                            ),
//                          ],
//                        ),
//                      ),
//                    );
//                  });
//                }),
            suffixIcon: IconButton(
              tooltip: 'Mic',
              icon: Icon(Icons.mic),
              color: Colors.grey,
              onPressed: () {},
            ),
          ),
//          style: TextStyle(color: Colors.grey),
        ),

    ));
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          key: _scaffoldKey,
          endDrawerEnableOpenDragGesture: false,
          appBar: AppBar(
            backgroundColor:  Color.fromRGBO(150, 170, 105, 5),
            title: Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: gogleAppBar(),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.supervised_user_circle,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>ProfileView() ));
                },
              )
            ],

            // elevation: 20,
            //titleSpacing: 5,
//            actions: [
//              IconButton(icon: Icon(Icons.search), onPressed: () {}),
//            ],

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
                    text: '  TextView Demo  '),

                Tab(
//                    icon: Icon(
//                      Icons.credit_card,
//                      color: Colors.white,
//                    ),
                    text: '  Student Details  '),
                Tab(
                  //    icon: Icon(Icons.app_registration, color: Colors.white),
                    text: '  CardViewDemo  '),
                Tab(
                  //    icon: Icon(Icons.app_registration, color: Colors.white),
                    text: '  Progree Indicators  '),
                Tab(
                  //    icon: Icon(Icons.app_registration, color: Colors.white),
                    text: '  Map with List Demo  ')
              ],
            ),
          ),
          body: TabBarView(
            children: [
              RegisterForm(),
              ListViewDemo(),
              CardView(),
              LinearProgressIndicatorApp(),
              Mapdata()
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
                          backgroundImage:NetworkImage('https://www.thestudentcircle.com/sub-subject-icon/MjAyMC0wNi0xMyAwNDoxNTozNA==_flutter-logo-round.png')),


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
                          builder: (context) => new TabViewAPIDemo()));
                    },
                  ),
                  ListTile(
//                    leading: CircleAvatar(
//                      backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgJ_8d9MZOee_n3p3uSqAw7Z4d9MVMD44lWw&usqp=CAU'),
//                    ),
                    leading: Icon(Icons.data_usage),
                    title: Text('Providers'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => new HomeApp()));
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
//                      backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8WsnzMhW0-XYU8gpM55RxqcH78rv9diMbGQ&usqp=CAU'),
//                    ),
                    leading: Icon(Icons.supervised_user_circle),
                    title: Text('All Userss Data'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FatchScreen()));
                    },
                  ),
                  ListTile(
//                    leading: CircleAvatar(
//                      backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwzPRYAqSVasWids88z437BkTnLCEQz9nOCA&usqp=CAU'),
//                    ),
                    leading: Icon(Icons.logout),
                    title: Text('LogOut'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LogInScreen()));
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
