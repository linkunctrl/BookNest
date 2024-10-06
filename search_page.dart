// lib/screens/search_page.dart
import 'package:flutter/material.dart';
import '../models/book.dart';

class BookSearch extends SearchDelegate<Book?> {
  final List<Book> books;

  BookSearch({required this.books});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = books
        .where((book) => book.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return results.isEmpty
        ? Center(child: Text('No results found'))
        : ListView.builder(
            itemCount: results.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(results[index].title),
                subtitle: Text('Author: ${results[index].author}'),
                onTap: () {
                  // Add navigation to book detail page if needed
                },
              );
            },
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = books
        .where((book) => book.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return suggestions.isEmpty
        ? Center(child: Text('No suggestions'))
        : ListView.builder(
            itemCount: suggestions.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(suggestions[index].title),
                subtitle: Text('Author: ${suggestions[index].author}'),
                onTap: () {
                  // Add navigation to book detail page if needed
                },
              );
            },
          );
  }
}
