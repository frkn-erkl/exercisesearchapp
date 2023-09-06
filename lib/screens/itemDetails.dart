import 'package:flutter/material.dart';

class ItemDetailPage extends StatelessWidget {
  final String itemname;
  final String instructions;

  ItemDetailPage(this.instructions, this.itemname);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(itemname),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          instructions,
          style: TextStyle(fontSize: 18.0),
        ),
      ),
    );
  }
}
