import 'package:flutter/material.dart';
class CardView extends StatefulWidget {
  @override
  _CardViewState createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  cardDecorate(){
    return  RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),

      side: BorderSide(
          color: Colors.black.withOpacity(0.50),
          width: 2,

      ),

    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text('CardView'),
//        centerTitle: true,
//        backgroundColor: Colors.blue,
//      ),
      body: Container(
          width: 400,

        ////  height: 0,
          margin: EdgeInsets.all(20),
          child: Column(
            children:<Widget> [
              Column(
                children: [

                  Card(

                    shape:cardDecorate(),
                    shadowColor: Colors.red,
                    color: Colors.cyanAccent,
                    elevation: 10,
                    child: Column(

                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
//                        Image.asset(
//                          'images/background.jpg',
//                          fit: BoxFit.cover,
//                          height: 170,
//                          width: 400,
//
//                        ),

                        const ListTile(
                          leading: Icon(Icons.account_balance,size: 35,color: Colors.black),

                          title: Text('Aamir Qureshi'),
                          subtitle: Text('Gujarat University'),
                        ),
                        ButtonBar(
                          children:<Widget> [
                            RaisedButton(
                                color: Colors.blue,

                                child: Text('Details'),
                                onPressed: (){}),
                            RaisedButton(
                                color: Colors.blue,
                                child: Text('Pay Fess'),
                                onPressed: (){}),
                            IconButton(
                                icon: Icon(Icons.share),
                                onPressed: (){})
                          ],
                       )
                    ],
                    ),

                  ),
                ],
              ),
              Card(
                shape:cardDecorate(),

                shadowColor: Colors.red,
                color: Colors.cyanAccent,
                elevation: 10,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      leading: Icon(Icons.account_balance,size: 35,color: Colors.black,),
                      title: Text('Shoeb Shaikh'),
                      subtitle: Text('Gls University'),
                    ),
                    ButtonBar(
                      children:<Widget> [
                        RaisedButton(
                            color: Colors.blue,

                            child: Text('Details'),
                            onPressed: (){}),
                        RaisedButton(
                            color: Colors.blue,
                            child: Text('Pay Fess'),
                            onPressed: (){}),
                        IconButton(
                            icon: Icon(Icons.share),
                            onPressed: (){})
                      ],
                    )
                  ],
                ),
              ),
              Card(
                shape:cardDecorate(),
                shadowColor: Colors.red,
                color: Colors.cyanAccent,
                elevation: 10,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      leading: Icon(Icons.account_balance,size: 35,color: Colors.black,),
                      title: Text('Jay Pithva'),
                      subtitle: Text('Gls University'),
                    ),
                    ButtonBar(
                      children:<Widget> [
                        RaisedButton(
                            color: Colors.blue,

                            child: Text('Details'),
                            onPressed: (){}),
                        RaisedButton(
                            color: Colors.blue,
                            child: Text('Pay Fess'),
                            onPressed: (){}),
                        IconButton(
                            icon: Icon(Icons.share),
                            onPressed: (){})
                      ],
                    ),

                  ],
                ),
              ),
              Card(
                shape:cardDecorate(),
                shadowColor: Colors.red,
                color: Colors.cyanAccent,
                elevation: 10,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      leading: Icon(Icons.account_balance,size: 35,color: Colors.black,),
                      title: Text('Ankit Kumar'),
                      subtitle: Text('Gls University'),
                    ),
                    ButtonBar(
                      children:<Widget> [
                        RaisedButton(
                            color: Colors.blue,

                            child: Text('Details'),
                            onPressed: (){}),
                        RaisedButton(
                            color: Colors.blue,
                            child: Text('Pay Fess'),
                            onPressed: (){}),
                        IconButton(
                            icon: Icon(Icons.share),
                            onPressed: (){})
                      ],
                    ),

                  ],
                ),
              ),
            ],
          ),

      ),
    );

  }
}
