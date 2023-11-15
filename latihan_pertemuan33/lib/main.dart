
import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class ChatMessage {
  String username;
  String message;
  ChatMessage({required this.username, required this.message});
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat Message Conversation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
       
      ),
      home: HomePage(),
    );
  }
}


class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  
  final List<ChatMessage> _chatMessages = [];


  Stream<ChatMessage> _chat() async* {
    await Future<void>.delayed(const Duration(seconds: 3));
    yield ChatMessage(username: 'Haru', message: "heiii");

    await Future<void>.delayed(const Duration(seconds: 3));
    yield ChatMessage(username: "Momo", message: "hei helloo");

    await Future<void>.delayed(const Duration(seconds: 3));
    yield ChatMessage(
        username: "Haru", message: "Apakah kamu melihat kucingku🐈‍?");

    await Future<void>.delayed(const Duration(seconds: 3));
    yield ChatMessage(
        username: "Momo", message: "si cipu? tadi aku melihatnya di bawah meja");

    await Future<void>.delayed(const Duration(seconds: 3));
    yield ChatMessage(
        username: "Haru", message: "ooo okeyyy");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Message Conversation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: StreamBuilder(
          stream: _chat(),
          builder: (context, AsyncSnapshot<ChatMessage> snapshot) {
            if (snapshot.hasData) {
              _chatMessages.add(snapshot.data!);

              return ListView.builder(
                itemCount: _chatMessages.length,
                itemBuilder: (context, index) {
                  final ChatMessage chatItem = _chatMessages[index];
                  return ListTile(
                    // user name
                    leading: Text(
                      chatItem.username,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    // message
                    title: Text(
                      chatItem.message,
                      style: TextStyle(
                          fontSize: 20,
                        
                          color: chatItem.username == 'Haru'
                              ? Color.fromARGB(255, 240, 43, 142)
                              : Color.fromARGB(255, 134, 193, 229)),
                    ),
                  );
                },
              );
            }
            return const LinearProgressIndicator();
          },
        ),
      ),
    );
  }
}