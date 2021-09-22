import 'package:flutter/material.dart';

class ChatRow extends StatefulWidget {
  final String imageProfile;
  final String name;
  final String phone;
  const ChatRow({
    Key? key,
    required this.imageProfile,
    required this.name,
    required this.phone,
  }) : super(key: key);

  @override
  State<ChatRow> createState() => _ChatRowState();
}

class _ChatRowState extends State<ChatRow> {
  bool? checkBox = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
      color: Colors.white,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(widget.imageProfile),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(widget.phone)
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 12),
            child: IconButton(
              icon: const Icon(Icons.person_add),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${widget.name} berhasil ditambah'),
                    action: SnackBarAction(
                      label: 'Close',
                      onPressed: () {},
                    ),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
