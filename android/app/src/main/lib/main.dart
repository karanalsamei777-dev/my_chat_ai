import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: ChatScreen(), debugShowCheckedModeBanner: false));

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<String> _messages = ["مرحباً بك في شات_ai!"];
  final _controller = TextEditingController();

  void _send() {
    if (_controller.text.trim().isEmpty) return;
    setState(() {
      _messages.add("أنت: ${_controller.text}");
      _messages.add("الذكاء الاصطناعي: تم استلام رسالتك بنجاح!");
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('شات_ai'), backgroundColor: Colors.black87),
      backgroundColor: Colors.grey[900],
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (_, i) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(_messages[i], style: const TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(hintText: 'اكتب رسالة...', hintStyle: TextStyle(color: Colors.grey)),
                ),
              ),
              IconButton(icon: const Icon(Icons.send, color: Colors.blue), onPressed: _send),
            ],
          )
        ],
      ),
    );
  }
}
