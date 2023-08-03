class BookList {
  String imageUrl;
  String writers;
  String title;

  BookList(
      {required this.imageUrl, required this.writers, required this.title});
}

List<BookList> bookLists = [
  BookList(
      imageUrl: 'assets/images/tranding_book_1.png' '',
      writers: 'Guy Kawasaki',
      title: 'Enchancement'),
  BookList(
      imageUrl: 'assets/images/tranding_book_2.png' '',
      writers: 'Aron',
      title: 'lore'),
  BookList(
      imageUrl: 'assets/images/tranding_book_3.png' '',
      writers: 'Spancer Jhonson',
      title: 'Who move Chase'),
];
