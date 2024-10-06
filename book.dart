// lib/models/book.dart
class Book {
  final String id;
  final String title;
  final String author;
  final int lastReadPage;
  final int totalPages; // New field for total pages
  final String note;
  final bool isFavorite;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.lastReadPage,
    required this.totalPages, // Include total pages in the constructor
    this.note = '',
    this.isFavorite = false,
  });
}
