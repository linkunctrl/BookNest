// lib/widgets/book_tile.dart
import 'package:flutter/material.dart';
import '../models/book.dart';

class BookTile extends StatelessWidget {
  final Book book;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback onToggleFavorite;

  const BookTile({
    Key? key,
    required this.book,
    required this.onEdit,
    required this.onDelete,
    required this.onToggleFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double progress = book.lastReadPage / book.totalPages; // Calculate progress

    return Card(
      elevation: 4,
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(book.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Author: ${book.author}'),
            Text(
                'Last Read Page: ${book.lastReadPage} / ${book.totalPages}'), // Display total pages
            if (book.note.isNotEmpty) Text('Note: ${book.note}'),
            // Add a progress indicator
            LinearProgressIndicator(
              value: progress.isNaN ? 0 : progress, // Handle division by zero
              minHeight: 5,
              backgroundColor: Colors.grey[300],
              color: Colors
                  .pinkAccent, // You can choose a color that fits your theme
            ),
          ],
        ),
        trailing: Wrap(
          spacing: 12, // Space between icons
          children: <Widget>[
            IconButton(
              icon: Icon(
                book.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: book.isFavorite ? Colors.red : null,
              ),
              onPressed: onToggleFavorite,
            ),
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: onEdit,
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
