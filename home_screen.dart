// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import '../models/book.dart';
import 'add_book_screen.dart';
import 'search_page.dart';
import 'recommendation_page.dart'; // Make sure to import this
import 'favorite_books_page.dart';
import '../widgets/book_tile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback onThemeToggle;

  const HomeScreen({Key? key, required this.onThemeToggle}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Book> books = [];
  String searchQuery = '';

  void addBook(Book book) {
    setState(() {
      books.add(book);
    });
  }

  void editBook(String id, Book updatedBook) {
    setState(() {
      books = books.map((book) => book.id == id ? updatedBook : book).toList();
    });
  }

  void deleteBook(String id) {
    setState(() {
      books.removeWhere((book) => book.id == id);
    });
  }

  void toggleFavorite(String id) {
    setState(() {
      books = books.map((book) {
        if (book.id == id) {
          return Book(
            id: book.id,
            title: book.title,
            author: book.author,
            lastReadPage: book.lastReadPage,
            totalPages: book.totalPages,
            note: book.note,
            isFavorite: !book.isFavorite,
          );
        }
        return book;
      }).toList();
    });
  }

  List<Book> get filteredBooks {
    if (searchQuery.isEmpty) return books;
    return books
        .where((book) =>
            book.title.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();
  }

  List<Book> get favoriteBooks {
    return books.where((book) => book.isFavorite).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BookNest',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent[200],
        actions: [
          IconButton(
            icon: FaIcon(FontAwesomeIcons.search),
            onPressed: () {
              showSearch(context: context, delegate: BookSearch(books: books));
            },
          ),
          IconButton(
            icon: FaIcon(FontAwesomeIcons.heart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        FavoriteBooksPage(books: favoriteBooks)),
              );
            },
          ),
          // Dark/Light mode toggle button
          IconButton(
            icon: Icon(
              Theme.of(context).brightness == Brightness.dark
                  ? Icons.wb_sunny // Sun icon for light mode
                  : Icons.nightlight_round, // Moon icon for dark mode
            ),
            onPressed: widget.onThemeToggle, // Call the toggle function
          ),
          IconButton(
            icon: FaIcon(
                FontAwesomeIcons.bookOpen), // New button for recommendations
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        RecommendationPage(books: books)), // Pass the books
              );
            },
          ),
        ],
      ),
      body: books.isEmpty
          ? Center(child: Text('No books available. Please add some!'))
          : ListView.builder(
              itemCount: filteredBooks.length,
              itemBuilder: (context, index) {
                return BookTile(
                  book: filteredBooks[index],
                  onEdit: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddBookScreen(
                          book: filteredBooks[index],
                          onSave: (book) =>
                              editBook(filteredBooks[index].id, book),
                        ),
                      ),
                    );
                  },
                  onDelete: () => deleteBook(filteredBooks[index].id),
                  onToggleFavorite: () =>
                      toggleFavorite(filteredBooks[index].id),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddBookScreen(onSave: addBook),
            ),
          );
        },
        child: FaIcon(FontAwesomeIcons.plus),
      ),
    );
  }
}
