import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:projeto_final/pages/chat_page.dart';
import 'package:projeto_final/pages/chat_service.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({Key? key});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late String _currentUserId;
  late String _currentUserName;
  late List<String> _currentUserDms;
  bool check = false;

  Future<Widget> _getImage(BuildContext context, String imageName) async {
    return FirebaseStorageService.loadImage(context, imageName).then((value) {
      return Image.network(
        value.toString(),
        fit: BoxFit.cover,
        width: 100, // Defina a largura desejada
        height: 100, // Defina a altura desejada
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final physicalScreenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(children: [
      Expanded(
          child: SingleChildScrollView(
              child: Center(
                  child: Container(
        width: physicalScreenSize.width,
        height: physicalScreenSize.height,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(color: Color(0xFFF9E0CE)),
        child: _buildUserList(),
      ))))
    ]));
  }

  Widget _buildUserList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('users').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

       for (DocumentSnapshot doc in snapshot.data!.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

        if (data.containsValue(_auth.currentUser!.email)) {
          _currentUserId = doc.id;
          _currentUserName = data['name'];
          _currentUserDms = data['dms'].cast<String>();
          check = true;
          break; // Exit the loop once the condition is met
        } else {
          check = false;
        }
      }
        return Stack(
          children: [
            Positioned(
              left: 25,
              top: 45,
              child: Container(
                width: 300,
                height: 60,
                child: Text(
                  'Messages',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 30,
                    color: const Color(0xff707070),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                )
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 60),
              child: ListView(
                children: snapshot.data!.docs
                    .map<Widget>((doc) => _buildUserListItem(doc))
                    .toList(),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildUserListItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
    print(check);

    //display only users in dms array
    if (_currentUserDms.contains(doc.id)) {
      return ListTile(
        contentPadding: EdgeInsets.only(left: 20, top: 10),
        leading: ClipOval(
          child: FutureBuilder(
            future: _getImage(context, data['image']),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Container(
                  width: 50,
                  height: 50,
                  child: snapshot.data as Widget,
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(),
                );
              }
              return Container();
            },
          ),
        ),
        title: Text(data['name'], style: TextStyle(fontSize: 18)),
        subtitle: Text(data['email']),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                receiverUserID: doc.id,
                receiverUserName: data['name'],
                currentUserID: _currentUserId,
                currentUserName: _currentUserName,
                receiverUserPhotoName: data['image'],
              ),
            ),
          );
        },
      );
    } else {
      return Container();
    }
  }
}

class FirebaseStorageService extends ChangeNotifier {
  FirebaseStorageService();

  static Future<dynamic> loadImage(BuildContext context, String image) async {
    return await FirebaseStorage.instance.ref().child(image).getDownloadURL();
  }
}
