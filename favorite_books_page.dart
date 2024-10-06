// lib/screens/favorite_books_page.dart
import 'package:flutter/material.dart';
import '../models/book.dart';
import '../widgets/book_tile.dart';

class FavoriteBooksPage extends StatelessWidget {
  final List<Book> books;

  FavoriteBooksPage({required this.books});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Books'),
      ),
      body: books.isEmpty
          ? Center(child: Text('No favorite books found.'))
          : ListView.builder(
              itemCount: books.length,
              itemBuilder: (context, index) {
                return BookTile(
                  book: books[index],
                  onEdit: () {
                    // Define your onEdit functionality here
                  },
                  onDelete: () {
                    // Define your onDelete functionality here
                  },
                  onToggleFavorite: () {
                    // Define your onToggleFavorite functionality here
                  },
                );
              },
            ),
    );
  }
}
