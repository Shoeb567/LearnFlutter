import 'package:flutter/material.dart';
import 'package:flutter_app_firebase/screens/cldScreene/DataBaseDemo/UserServices.dart';
import 'package:flutter_app_firebase/screens/designscreens/tabView.dart';


import 'package:provider/provider.dart';

class ShowDatabaseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserServices>(
        create: (BuildContext context) {
          return UserServices();
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: ('Database DemoApp'),
          home: ShowData(),
        ));
  }
}

class ShowData extends StatefulWidget {
  @override
  _ShowDataState createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {

//  List<User> search = List();
  void showBottomModal(BuildContext ctx, String id, String name, int age) {

    final TextEditingController _updateNameController = TextEditingController();

    final TextEditingController _updateAgeController = TextEditingController();
    _updateNameController.text = name;
    _updateAgeController.text = age.toString();
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        var viewModel = Provider.of<UserServices>(context);
        return Container(
            height: 700,
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Text(
                      'Update User Data',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 30, left: 20, right: 20),
                    child: TextField(
                      controller: _updateNameController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: 'Name'),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: TextField(
                      controller: _updateAgeController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: 'Age'),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: RaisedButton(
                      child: Text('Update User'),
                      onPressed: () {

                          viewModel.updateUser(
                              id,
                              _updateNameController.text,
                              int.parse(
                                _updateAgeController.text,
                              ));

//                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ShowData()));
                      },
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<UserServices>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLite Demo'),
        centerTitle: true,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder:(context) {
            return TabView();
          },)),
        ),
        backgroundColor:  Color.fromRGBO(150, 170, 105, 5),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0.0,
        child: Icon(Icons.add),
        backgroundColor:  Color.fromRGBO(150, 170, 105, 5),
        onPressed: () {
          setState(() {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return AddData();
            }));
          });
        },
      ),
      body: Container(
        child: Column(
          children: <Widget>[
//            Consumer<UserServices>(
//                builder: (context, itemAddNotifier, _) {
            Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  onChanged: (str) {
                    viewModel.searchData(str);
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
              // });
            //}),

            Expanded(
//                child: Consumer<UserServices>(
//                    builder: (context, listdata, _) {
//                      print('Update List');
                    //  listdata.fetchUsers();
                           child: ListView.builder(
                                itemCount:  viewModel.search.length,
                                itemBuilder: (ctx, idx) {
                                  print('Listview Builder');
                                  return Card(
                                    elevation: 3,
                                    child: ListTile(
                                      title: Text(
                                          'Name::  ${ viewModel.search[idx].name}'),
                                      subtitle: Text(
                                          'Age::        ${viewModel.search[idx].age}'),
                                      trailing: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          IconButton(
                                            icon: Icon(Icons.delete),
                                            onPressed: () {

                                                viewModel
                                                    .deleteUser(
                                                    viewModel.search[idx].id);
                                                //viewModel.search.removeAt(idx);

                                            },
                                          ),
                                          IconButton(
                                              icon: Icon(Icons.edit),
                                              onPressed: () {
                                                showBottomModal(
                                                  context,
                                                  viewModel.search[idx].id,
                                                  viewModel.search[idx].name,
                                                  viewModel.search[idx].age,
                                                );
                                              }),
                                        ],
                                      ),
                                    ),
                                  );
                              //  });

                            //  });
                         // });
                    })
            ),
          ],
        ),
      ),
    );
  }
}

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<UserServices>(context);
    print('Build Screen');
    return Scaffold(
        appBar: AppBar(
          backgroundColor:  Color.fromRGBO(150, 170, 105, 5),
          title: Text('AddData in Database'),
          centerTitle: true,

        ),
        body: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Name'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: TextField(
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Age'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: RaisedButton.icon(
                  color:  Color.fromRGBO(150, 170, 105, 5),
                  onPressed: () async {
                    print('Data Added');

                      await viewModel.saveUser(
                          _nameController.text, int.parse(_ageController.text));
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ShowData()));
                    _nameController.clear();
                    _ageController.clear();
                  },
                  icon: Icon(Icons.add),
                  label: Text('Add User'),
                ),
              ),
            ],
          ),
        ));
  }
}
