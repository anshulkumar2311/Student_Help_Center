import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stu_help/Screens/HomeScreen.dart';
import 'package:stu_help/Screens/Welcome/welcome_screen.dart';
import '../constants.dart';

final _firestore = FirebaseFirestore.instance;
User? loggedInUser;
bool isSwitched = false;

class ChatScreen extends StatefulWidget {
  static const String id = "/chat";
  
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextContoller = TextEditingController();
  final _auth = FirebaseAuth.instance;

  String messageText = '';

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser?.email);
      }
    } catch (e) {
      print(e);
    }
  }

  void messagesStream() async {
    await for (var snapshot in _firestore.collection("messages").snapshots()) {
      for (var message in snapshot.docs) {
        print(message.data);
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: null,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  var ret = showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(content: StatefulBuilder(
                          builder: (BuildContext context, StateSetter setState) {
                            return Container(
                              height: MediaQuery.of(context).size.height/2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text("Anonymous Chat",style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),),
                                      SizedBox(width: 20,),
                                      Container(
                                        height: MediaQuery.of(context).size.height / 3,
                                        child: Center(
                                          child: Switch(
                                            value: isSwitched,
                                            onChanged: (value) {
                                              setState(() {
                                                isSwitched = value;
                                                print(isSwitched);
                                              });
                                            },
                                            activeTrackColor: Colors.lightGreenAccent,
                                            activeColor: Colors.green,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Close",style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),),
                                      SizedBox(width:130,),
                                      InkWell(
                                        child: Icon(
                                          Icons.close
                                        ),
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                                        },
                                      )
                                    ],
                                  )
                                ],
                              ),
                            );
                          }));
                    },
                  );
                  // _auth.signOut();
                  // Navigator.pop(context);
                }),
          ],
          title: Text('⚡  Anonymous Chat'),
          backgroundColor: kPrimaryColor,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              MessagesStream(),
              Container(
                decoration: kMessageContainerDecoration,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: messageTextContoller,
                        onChanged: (value) {
                          messageText = value;
                        },
                        decoration: kMessageTextFieldDecoration,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        messageTextContoller.clear();
                        _firestore.collection("messages").add({
                          "text":  messageText,
                          "sender":isSwitched ? "" : loggedInUser?.email,
                          "time": DateTime.now()
                        });
                      },
                      child: Text(
                        'Send',
                        style: kSendButtonTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MessagesStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection("messages").snapshots(),
      // ignore: missing_return
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final messages = snapshot.data?.docs;
        List<MessageBubble> messageBubbles = [];
        for (var message in messages!) {
          final messageText = message['text'];
          final messageSender = message["sender"];
          final messageTime = message["time"];
          final currentUsser = loggedInUser?.email;
          final messageBubble = MessageBubble(
            sender: messageSender,
            text: messageText,
            time: messageTime,
            isMe: currentUsser == messageSender,
            isSwitched: isSwitched,
          );
          messageBubbles.add(messageBubble);
          messageBubbles.sort((a, b) => b.time.compareTo(a.time));
        }
        return Expanded(
          child: ListView(
            shrinkWrap: true,
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
            children: messageBubbles,
          ),
        );
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  final String sender;
  final String text;
  final Timestamp time;
  final bool isMe;
  final bool isSwitched;
  MessageBubble(
      {required this.sender,
      required this.text,
      required this.isMe,
      required this.time,
      required this.isSwitched
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
              "$sender ${time.toDate()}",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          Material(
            borderRadius: isMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  )
                : BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
            elevation: 5.0,
            color: isMe ? Colors.lightBlueAccent : Colors.purpleAccent,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

