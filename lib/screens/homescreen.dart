import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_firebase/screens/designscreens/tabView.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final db = Firestore.instance;
  String task, age;

  void showDialogScreen(bool isUpdate, DocumentSnapshot ds) {

    GlobalKey<FormState> formkey = GlobalKey<FormState>();
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: isUpdate ? Text('Update Data') : Text('Add Data'),
            content: Form(
              key: formkey,
              child: Container(
                height: 150,
                child: Column(
                  children: [
                    TextFormField(
                      autofocus: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: 'Name'),
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Please add Name';
                        } else
                          return null;
                      },
                      onChanged: (val) {
                        task = val;
                      },
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      autofocus: true,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: 'Age'),
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Please add Age';
                        } else
                          return null;
                      },
                      onChanged: (val) {
                        age = val;
                      },
                    ),
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              RaisedButton(
                  padding: EdgeInsets.only(
                      left: 55.0, right: 55.0, top: 13, bottom: 13),
                  color: Colors.red,
                  splashColor: Colors.white,
                  child: Text('Add'),
                  onPressed: () {

                    if(isUpdate){
                      db.collection('taskDemo').document(ds.documentID).updateData({'task':task,'age':age,'time':DateTime.now()});
                    }
                    else{
                      db.collection('taskDemo').add(
                          {'task': task, 'age': age, 'time': DateTime.now()});

                    }
                    Navigator.pop(context);

                  })
            ],
          );
        });
  }
//  searchData(str) async {
//
//    db.collection('taskDemo').document(task.documentID).clear();
//    await  .forEach((element) {
//      if (element.name.toLowerCase().contains(str.toLowerCase()))
//        search.add(element);
//    });
//    notifyListeners();
//    print('User List:${users.length}');
//    print('Search List:${search.length}');
//  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialogScreen(false, null),
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder:(context) {
            return TabView();
          },)),
        ),
        backgroundColor:  Color.fromRGBO(150, 170, 105, 5),
        title: Text('Show Data Screen'),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: () {
//              signOutUser().whenComplete(() =>
//                  Navigator.of(context).pushReplacement(
//                      MaterialPageRoute(
//                          builder: (context) => LogInScreen())));
//              print('SignOut Clicked.');
//              Navigator.push(
//                  context, MaterialPageRoute(builder: (context) => LogInScreen()));
            },
          )
        ],
        centerTitle: true,

      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                onChanged: (str) {
                 // viewModel.searchData(str);
                },
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(
                    Icons.search,
                    //color: textStyleField.colorUse(),
                  ),
                ),
              ),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: db.collection('taskDemo').orderBy('time').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot ds = snapshot.data.documents[index];
                        return Container(
                          color: Colors.grey,
                          child: Card(
                            elevation: 10,
                            child: ListTile(
                              title: Text('Name:  ${ds['task']}'),
                              subtitle: Text('Age:     ${ds['age']}'),
                              trailing: IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  db
                                      .collection('taskDemo')
                                      .document(ds.documentID)
                                      .delete();
                                },
                              ),
                              onTap: () {
                                showDialogScreen(true, ds);
                              },
                            ),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return CircularProgressIndicator();
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
