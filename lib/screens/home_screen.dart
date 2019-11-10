import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_alilo/widgets/category_selector.dart';
import 'package:flutter_alilo/widgets/favorite_contacts.dart';
import 'package:flutter_alilo/widgets/recents_chats.dart';

class HomeScreen extends StatefulWidget {
  final String title;
  HomeScreen({Key key, this.title}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {




  @override
  Widget build(BuildContext context) {

  return Scaffold(
    backgroundColor: Theme.of(context).primaryColor,
    appBar: AppBar(
            leading:
             IconButton(
                icon: Icon(Icons.menu),
                iconSize: 30.0,
                color: Colors.white,
                onPressed: (){}
                ),

    title: Text('Chats',
    style: TextStyle(
      fontSize: 28.0,
      fontWeight: FontWeight.bold,
    ),
    textAlign: TextAlign.center,
    ),

    elevation: 0.0,
    actions: <Widget>[
      IconButton(
          icon: Icon(Icons.search),
          iconSize: 30.0,
          color: Colors.white,
          onPressed: (){}
      ),

    ],
  ),
    body: Column(
      children: <Widget>[
        CategorySelector(),
        Expanded(

         child: Container(

          decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
             ),
           child: Column(
             children: <Widget>[
               FavoriteContacts(),
               RecentsChats(),

             ],
             
             ),
            ),
           ),
          ],
         ),
        );
  }
  }



