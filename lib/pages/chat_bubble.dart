import "package:flutter/material.dart";

class ChatBubble extends StatelessWidget{
  final String message;
  final String time;

  const ChatBubble({Key? key, required this.message, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(message, style: const TextStyle(color: Colors.white, fontSize: 16)),
          Text(time, style: const TextStyle(color: Colors.grey, fontSize: 10)),
        ],
      ),
    );
  }
}