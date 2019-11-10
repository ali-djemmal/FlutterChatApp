import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_alilo/models/message_model.dart';
import 'package:flutter_alilo/models/user_model.dart';

class ChatScreen extends StatefulWidget {



final User user ;

ChatScreen({this.user});





  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  _buildMessage(Message message, bool isMe) {
    bool islike = message.isLiked ;
    final Container mes = Container(
        padding: EdgeInsets.symmetric(
        horizontal: 25.0,
        vertical: 15.0),
        margin:
    isMe ? EdgeInsets.only(
    top: 7.0,
    left: 33.0,
    bottom: 7.0 ,
    right: 10.0)
        :EdgeInsets.only(
    top: 7.0,

    bottom: 7.0,
    left: 10.0),
    width: MediaQuery.of(context).size.width*0.75,

    decoration: new BoxDecoration(
    color: isMe ? Colors.black12 :Color(0xFFFFEFEE),
    borderRadius: isMe
    ? BorderRadius.only(
    topLeft: Radius.circular(15.0),
    bottomRight: Radius.circular(15.0),
    )
        : BorderRadius.only(
    topRight: Radius.circular(15.0),
    bottomLeft: Radius.circular(15.0),

    ),
    ),

    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
    Text(message.time,

    style: TextStyle(
    fontWeight: FontWeight.w600,
    color : Colors.blueGrey,
    ),
    ),
    Text(message.text, style: TextStyle(
    fontWeight: FontWeight.w600,
    color : Colors.blueGrey,
    ),),
    ],
    ),
    );


if(isMe){
  return mes ;
}







    return Row(
      children: <Widget>[
       mes,// container

      GestureDetector(
        onTap: (){
          if(islike){
            islike = false ;
          }else{
            islike= true ;
          }
        },
        child: !isMe ?  IconButton(
              icon: islike
                  ? Icon(Icons.favorite)
              : Icon(Icons.favorite_border),
              iconSize: 30.0,
              color: islike
              ? Colors.redAccent
              : Colors.blueGrey ,
              onPressed: (){}
          ):SizedBox.shrink(),
      ),

      ],
    );
  }
  _buildMessageComposer(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.photo),
            iconSize: 25.0,
              color: Theme.of(context).primaryColor,
              onPressed: (){},
          )
,
          Expanded(child:TextField(
            textCapitalization: TextCapitalization.sentences,
            onChanged: (value){

            },
            decoration: InputDecoration.collapsed(
              hintText: 'Send a message...'
            ),

          ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 25.0,
            color:Colors.red,
            onPressed: (){},
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(



        title: Container(
          padding: EdgeInsets.only(left: 80.0),
          child: Text(widget.user.name,
            style: TextStyle(
              fontSize: 22.0,
              color: Colors.white,

              fontWeight: FontWeight.bold,
            ),

          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.more_horiz),
              iconSize: 30.0,
              color: Colors.white,
              onPressed: (){}
          ),

        ],


      ),
      body:  GestureDetector(
        onTap: ()=> FocusScope.of(context).unfocus(),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(

                      decoration: new BoxDecoration(
                        color: Colors.white,
                        borderRadius: new BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                      ),


                child: ClipRRect(
                  borderRadius: new BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  child: ListView.builder(
                    reverse: true,
                    padding: EdgeInsets.only(top: 15.0),
                    itemCount: messages.length,
                      itemBuilder:(BuildContext  context,int index) {
                      final Message message = messages[index] ;
                      final bool isMe = message.sender.id == currentUser.id ;
                    return _buildMessage(message,isMe);
                  }),
                ),

                    ),

            ),
            _buildMessageComposer(),
          ],
        ),
      ),

    );
  }




}
