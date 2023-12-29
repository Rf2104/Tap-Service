import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projeto_final/pages/chat_bubble.dart';
import 'package:projeto_final/pages/chat_service.dart';

class ChatPage extends StatefulWidget {
  final String receiverUserID;
  final String receiverUserName;
  final String currentUserID;
  final String currentUserName;
  final String receiverUserPhotoName;
  const ChatPage(
      {super.key,
      required this.receiverUserID,
      required this.receiverUserName,
      required this.currentUserID,
      required this.currentUserName,
      required this.receiverUserPhotoName});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final user = FirebaseAuth.instance.currentUser!;
  final TextEditingController _messageController = TextEditingController();
  final ChatService _chatService = ChatService();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(
          widget.receiverUserID,
          _messageController.text,
          widget.currentUserID,
          widget.currentUserName);
      _messageController.clear();
    }
  }

  final ScrollController _controller = ScrollController();

  void _scrollDown() {
    _controller.jumpTo(_controller.position.maxScrollExtent);
  }

  Future<Widget> _getImage(BuildContext context, String imageName) async {
    return FirebaseStorageService.loadImage(context, imageName).then((value) {
      return Image.network(
        value.toString(),
        fit: BoxFit.cover,
        width: 40, // Defina a largura desejada
        height: 40, // Defina a altura desejada
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(237, 217, 78, 40),
        leading: IconButton(
          iconSize: 30,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Display receiver's photo in the AppBar
            ClipOval(
              child: FutureBuilder(
                future: _getImage(context, widget.receiverUserPhotoName),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Center(child: snapshot.data);
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return const Center(child: Text("Something went wrong!"));
                },
              ),
            ),
            SizedBox(width: 8.0), // Adjust spacing as needed
            Text(widget.receiverUserName),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(color: Color(0xFFF9E0CE)),
        child: Column(
          verticalDirection: VerticalDirection.down,
          children: [
            Expanded(
              child: _buildMessageList(),
            ),
            //message input
            _buildMessageInput(),
          ],
        ),
      ),
    );
  }

  //build Message List
  Widget _buildMessageList() {
    return StreamBuilder(
      stream:
          _chatService.getMessages(widget.receiverUserID, widget.currentUserID),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          WidgetsBinding.instance?.addPostFrameCallback((_) {
            _scrollDown();
          });

          return ListView.builder(
            controller: _controller,
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              return _buildMessageItem(snapshot.data!.docs[index]);
            },
          );
        }
      },
    );
  }

  //build Message Item
  Widget _buildMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    String time = readTimestamp(data['timestamp'].seconds);
    // align message to right or left
    var alignment = data['senderId'] == widget.currentUserID
        ? Alignment.centerRight
        : Alignment.centerLeft;

    return Container(
      alignment: alignment,
      child: Padding(
        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: (data['senderId'] == widget.currentUserID)
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            ChatBubble(message: data['message'], time: time),
          ],
        ),
      ),
    );
  }

  //build Message Input
  Widget _buildMessageInput() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.only(
            bottom: 8.0, left: 8.0, top: 10.0), // Adjust the margin as needed
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _messageController,
                obscureText: false,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade200,
                    ),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  fillColor: Colors.grey[800],
                  filled: true,
                  hintText: 'Type a message',
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: sendMessage,
              icon: const Icon(
                Icons.send,
                size: 35,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String readTimestamp(int timestamp) {
    var now = DateTime.now();
    var format = DateFormat('HH:mm');
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var diff = now.difference(date);
    var time = '';

    if (diff.inSeconds <= 0 ||
        diff.inSeconds > 0 && diff.inMinutes == 0 ||
        diff.inMinutes > 0 && diff.inHours == 0 ||
        diff.inHours > 0 && diff.inDays == 0) {
      time = format.format(date);
    } else if (diff.inDays > 0 && diff.inDays < 7) {
      if (diff.inDays == 1) {
        time = diff.inDays.toString() + ' DAY AGO';
      } else {
        time = diff.inDays.toString() + ' DAYS AGO';
      }
    } else {
      if (diff.inDays == 7) {
        time = (diff.inDays / 7).floor().toString() + ' WEEK AGO';
      } else {
        time = (diff.inDays / 7).floor().toString() + ' WEEKS AGO';
      }
    }

    return time;
  }
}

class FirebaseStorageService extends ChangeNotifier {
  FirebaseStorageService();

  static Future<dynamic> loadImage(BuildContext context, String image) async {
    return await FirebaseStorage.instance.ref().child(image).getDownloadURL();
  }
}
