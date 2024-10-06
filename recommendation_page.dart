// lib/screens/recommendation_page.dart
import 'package:flutter/material.dart';
import '../models/book.dart';

class RecommendationPage extends StatelessWidget {
  final List<Book> books;

  RecommendationPage({Key? key, required this.books}) : super(key: key);

  final List<Map<String, String>> recommendedBooks = [
    {'title': 'Pride and Prejudice', 'author': 'Jane Austen'},
    {'title': 'To Kill a Mockingbird', 'author': 'Harper Lee'},
    {'title': 'The Great Gatsby', 'author': 'F. Scott Fitzgerald'},
    {'title': '1984', 'author': 'George Orwell'},
    {'title': 'Moby Dick', 'author': 'Herman Melville'},
    {'title': 'War and Peace', 'author': 'Leo Tolstoy'},
    {'title': 'The Catcher in the Rye', 'author': 'J.D. Salinger'},
    {'title': 'The Lord of the Rings', 'author': 'J.R.R. Tolkien'},
    {
      'title': 'Harry Potter and the Sorcerer\'s Stone',
      'author': 'J.K. Rowling'
    },
    {'title': 'The Alchemist', 'author': 'Paulo Coelho'},
    {'title': 'The Book Thief', 'author': 'Markus Zusak'},
    {'title': 'Brave New World', 'author': 'Aldous Huxley'},
    {'title': 'The Road', 'author': 'Cormac McCarthy'},
    {'title': 'The Hobbit', 'author': 'J.R.R. Tolkien'},
    {'title': 'The Picture of Dorian Gray', 'author': 'Oscar Wilde'},
    {'title': 'Little Women', 'author': 'Louisa May Alcott'},
    {'title': 'Fahrenheit 451', 'author': 'Ray Bradbury'},
    {'title': 'The Diary of a Young Girl', 'author': 'Anne Frank'},
    {'title': 'The Fault in Our Stars', 'author': 'John Green'},
    {'title': 'The Hunger Games', 'author': 'Suzanne Collins'},
    {'title': 'The Kite Runner', 'author': 'Khaled Hosseini'},
    {'title': 'Gone Girl', 'author': 'Gillian Flynn'},
    {'title': 'A Game of Thrones', 'author': 'George R.R. Martin'},
    {'title': 'The Handmaid\'s Tale', 'author': 'Margaret Atwood'},
    {'title': 'Where the Crawdads Sing', 'author': 'Delia Owens'},
    {'title': 'The Glass Castle', 'author': 'Jeannette Walls'},
    {'title': 'Educated', 'author': 'Tara Westover'},
    {'title': 'Circe', 'author': 'Madeline Miller'},
    {'title': 'The Night Circus', 'author': 'Erin Morgenstern'},
    {'title': 'Big Little Lies', 'author': 'Liane Moriarty'},
    {'title': 'The Silent Patient', 'author': 'Alex Michaelides'},
    {'title': 'Dune', 'author': 'Frank Herbert'},
    {'title': 'Station Eleven', 'author': 'Emily St. John Mandel'},
    {'title': 'The Vanishing Half', 'author': 'Brit Bennett'},
    {'title': 'Anxious People', 'author': 'Fredrik Backman'},
    {
      'title': 'The Seven Husbands of Evelyn Hugo',
      'author': 'Taylor Jenkins Reid'
    },
    {'title': 'Normal People', 'author': 'Sally Rooney'},
    {'title': 'The Invisible Life of Addie LaRue', 'author': 'V.E. Schwab'},
    {'title': 'The Midnight Library', 'author': 'Matt Haig'},
    {'title': 'Malibu Rising', 'author': 'Taylor Jenkins Reid'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recommendations'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0), // Adjust padding as needed
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // Change to 4 columns
          crossAxisSpacing: 8.0, // Space between columns
          mainAxisSpacing: 8.0, // Space between rows
        ),
        itemCount: recommendedBooks.length,
        itemBuilder: (context, index) {
          final book = recommendedBooks[index];
          return Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(
                  8.0), // Smaller padding for smaller blocks
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    book['title']!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14, // Adjusted font size for smaller blocks
                      color: Colors.pinkAccent, // Cute color
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 4), // Smaller spacing
                  Text(
                    book['author']!,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontStyle: FontStyle.italic,
                      fontSize: 12, // Adjusted font size
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
