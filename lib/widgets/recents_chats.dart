import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alilo/models/message_model.dart';
import 'package:flutter_alilo/screens/chat_screen.dart';

class RecentsChats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Container(

        margin: EdgeInsets.only(bottom: 5.0,right: 10.0),
        padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child:ListView.builder(

          itemCount: chats.length,
          itemBuilder: (BuildContext context ,int index){
            final Message chat = chats[index] ;


          return GestureDetector(
            onTap: ()=> Navigator.push(context,MaterialPageRoute(
              builder: (_) => ChatScreen(
                user: chat.sender,
              ),
            ),
            ),


            child: Container(
               
              
              padding: EdgeInsets.symmetric(horizontal: 3.0,vertical: 1.0),

              margin: EdgeInsets.only(top: 5.0,bottom: 5.0),
              decoration: new BoxDecoration(
                color: chat.unread ? Color(0xFFFFEFEE) : Colors.white ,
                borderRadius: new BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[

                  Row(
                    children: <Widget>[
                      CircleAvatar(radius: 35.0,
                        backgroundImage: AssetImage(chat.sender.imageUrl),
                      ),
                      SizedBox(
                        width: 10.0
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(chat.sender.name,
                            style: TextStyle(
                                color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0),

                           ),
                          Container(
                            width: MediaQuery.of(context).size.width*0.45,
                            child: Text(
                              chat.text,
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15.0),
                                  overflow: TextOverflow.ellipsis,

                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(chat.time,
                        style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0),


                      ),

                      chat.unread
                     ? Container(
                        padding: EdgeInsets.only(left: 8.0,top:3.0),

                          width: 40.0,
                          height: 20.0,
                          decoration: new BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius:BorderRadius.circular(30.0),

                            ),



                          child: Text('New',

                          style: TextStyle(

                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,

                          ),
                          ),
                      )

                      :Text(''),

                    ],
                  ),
                ],
              ),
            ),
          );
          },
         ),
        ),
       );
  }
}
