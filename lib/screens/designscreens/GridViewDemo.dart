import 'package:flutter/material.dart';
class GridViewDemo extends StatefulWidget {
  @override
  _GridViewDemoState createState() => _GridViewDemoState();
}
class _GridViewDemoState extends State<GridViewDemo> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridViewDemo'),
        centerTitle: true,


      ),
      body: Container(
        child: GridView.count(
          crossAxisCount: 3,
         crossAxisSpacing: 4,
         mainAxisSpacing: 15,
          children: <Widget>[
            Card(
              color: Colors.blue,
              child: Stack(
                children: [
                  Center(
                    child: Icon(Icons.wifi,size: 50,color: Colors.white),
                  ),
                  Container(
                    margin: EdgeInsets.only(top:100,left: 80),
                    child: Text('Wi-Fi',style: TextStyle(fontSize: 15,color: Colors.white),),
                  )
                ],
              ),
            ),
            Card(
              color: Colors.blue,
              child: Stack(
                children: [
                  Center(
                    child: Icon(Icons.network_cell,size: 50,color: Colors.white),
                  ),
                  Container(
                    margin: EdgeInsets.only(top:100,left: 50),
                    child: Text('Network',style: TextStyle(fontSize: 15,color: Colors.white),),
                  )
                ],
              ),
            ),
            Card(
              color: Colors.blue,
              child: Stack(
                children: [
                  Center(
                    child: IconButton(
                       icon:Icon( Icons.mobile_friendly_rounded,
                           size: 50,
                           color: Colors.white),
                           onPressed: (){

                           },
                      color: Colors.deepOrangeAccent,
                    ),

                  ),
                  Container(
                    margin: EdgeInsets.only(top:100,left: 50),
                    child: Text('Mobile',style: TextStyle(fontSize: 15,color: Colors.white),),

                  )
                ],
              ),
            ),
            Tooltip(
              waitDuration: Duration(seconds: 2),
              showDuration: Duration(seconds: 4),
              padding: EdgeInsets.all(5),
              height: 35,
              message: 'This is Tooltip Exapmle',
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.9),
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              textStyle: TextStyle(color: Colors.white),
              child: FlatButton(
                child: Icon(Icons.account_box,size: 100,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
