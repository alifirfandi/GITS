import 'package:flutter/material.dart';
import 'package:re_tugas2/widgets/chat_row.dart';

List<Map<String, String>> dummy = [
  {'name': 'Person 1', 'image': 'assets/21.jpg', 'phone': '0891-1234-5678'},
  {'name': 'Person 2', 'image': 'assets/22.jpg', 'phone': '0892-2234-5678'},
  {'name': 'Person 3', 'image': 'assets/23.jpg', 'phone': '0893-3234-5678'},
  {'name': 'Person 4', 'image': 'assets/24.jpg', 'phone': '0842-4234-5678'},
  {'name': 'Person 5', 'image': 'assets/25.jpg', 'phone': '0812-5234-5678'},
  {'name': 'Person 6', 'image': 'assets/26.jpg', 'phone': '0874-6234-5678'},
  {'name': 'Person 7', 'image': 'assets/27.jpg', 'phone': '0812-7234-5678'},
  {'name': 'Person 8', 'image': 'assets/28.jpg', 'phone': '0842-9234-5678'},
  {'name': 'Person 9', 'image': 'assets/29.jpg', 'phone': '0819-6234-5678'},
  {'name': 'Person 10', 'image': 'assets/30.jpg', 'phone': '0819-2234-5678'},
];

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.2),
      appBar: AppBar(
        title: const Text('Add Contact'),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          width: 500,
          child: ListView.builder(
            itemCount: dummy.length,
            itemBuilder: (context, index) {
              return ChatRow(
                imageProfile: dummy[index]['image']!,
                name: dummy[index]['name']!,
                phone: dummy[index]['phone']!,
              );
            },
          ),
        ),
      ),
    );
  }
}
