// lib/screens/book_detail_page.dart
import 'package:flutter/material.dart';
import '../models/book.dart'; // Import the Book model

class BookDetailPage extends StatelessWidget {
  final Book book;

  BookDetailPage({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Author: ${book.author}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text('Description: ${book.note}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text('Last Read Page: ${book.lastReadPage}',
                style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
