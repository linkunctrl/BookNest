// lib/screens/add_book_screen.dart
import 'package:flutter/material.dart';
import '../models/book.dart';

class AddBookScreen extends StatefulWidget {
  final Book? book;
  final Function(Book) onSave;

  AddBookScreen({Key? key, this.book, required this.onSave}) : super(key: key);

  @override
  _AddBookScreenState createState() => _AddBookScreenState();
}

class _AddBookScreenState extends State<AddBookScreen> {
  late TextEditingController _titleController;
  late TextEditingController _authorController;
  late TextEditingController _lastReadPageController;
  late TextEditingController _noteController;
  late TextEditingController
      _totalPagesController; // Controller for total pages

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.book?.title);
    _authorController = TextEditingController(text: widget.book?.author);
    _lastReadPageController =
        TextEditingController(text: widget.book?.lastReadPage.toString());
    _noteController = TextEditingController(text: widget.book?.note);
    _totalPagesController = TextEditingController(
        text: widget.book?.totalPages.toString()); // Initialize total pages
  }

  @override
  void dispose() {
    _titleController.dispose();
    _authorController.dispose();
    _lastReadPageController.dispose();
    _noteController.dispose();
    _totalPagesController.dispose(); // Dispose the controller for total pages
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.book == null ? 'Add Book' : 'Edit Book'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _authorController,
              decoration: InputDecoration(labelText: 'Author'),
            ),
            TextField(
              controller: _lastReadPageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Last Read Page'),
            ),
            TextField(
              controller: _noteController,
              decoration: InputDecoration(labelText: 'Note'),
            ),
            TextField(
              controller: _totalPagesController, // New field for total pages
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Total Pages'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final book = Book(
                  id: widget.book?.id ?? DateTime.now().toString(),
                  title: _titleController.text,
                  author: _authorController.text,
                  lastReadPage: int.parse(_lastReadPageController.text),
                  note: _noteController.text,
                  totalPages:
                      int.parse(_totalPagesController.text), // Get total pages
                );
                widget.onSave(book);
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
