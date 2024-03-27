// Interface for items with a name and price
abstract class Item {
  final String name;
  final double price;

  const Item(this.name, this.price);

  // Abstract method to be implemented by concrete item types
  String getDetails();
}

// Class representing a Book item, inheriting from Item
class Book extends Item {
  final String author;

  const Book(String name, double price, this.author) : super(name, price);

  @override
  String getDetails() {
    return 'Book: $name by $author ($price)';
  }
}

// Class representing a Movie item, inheriting from Item
class Movie extends Item {
  final String director;

  const Movie(String name, double price, this.director) : super(name, price);

  @override
  String getDetails() {
    return 'Movie: $name by $director ($price)';
  }
}

// Function to read item data from a file (replace with actual file reading logic)
List<Map<String, dynamic>> readItemDataFromFile() {
  // Simulate reading data from a file
  return [
    {
      'type': 'book',
      'name': 'The Hitchhiker\'s Guide to the Galaxy',
      'price': 15.99,
      'author': 'Douglas Adams'
    },
    {
      'type': 'movie',
      'name': 'The Shawshank Redemption',
      'price': 9.99,
      'director': 'Frank Darabont'
    },
  ];
}

// Function to create an Item object based on data
Item createItemFromData(Map<String, dynamic> data) {
  switch (data['type']) {
    case 'book':
      return Book(data['name'] as String, data['price'] as double,
          data['author'] as String);
    case 'movie':
      return Movie(data['name'] as String, data['price'] as double,
          data['director'] as String);
    default:
      throw Exception('Invalid item type: ${data['type']}');
  }
}

void main() {
  // Read item data from a file (replace with actual file reading logic)
  final items = readItemDataFromFile();

  // Loop through items and print details using a loop
  for (final itemData in items) {
    final item = createItemFromData(itemData);
    print(item.getDetails());
  }
}
