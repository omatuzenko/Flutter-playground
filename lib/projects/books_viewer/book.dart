class Book {
  String title;
  String writer;
  String price;
  String image;
  double rating;
  int pages;
  String description =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum id neque libero. Donec finibus sem viverra, luctus nisi ac, semper enim. Vestibulum in mi feugiat, mattis erat suscipit, fermentum quam. Mauris non urna sed odio congue rhoncus. Aliquam a dignissim ex. Suspendisse et sem porta, consequat dui et, placerat tortor. Sed elementum nunc a blandit euismod. Cras condimentum faucibus dolor. Etiam interdum egestas sagittis. Aliquam vitae molestie eros. Cras porta felis ac eros pellentesque, sed lobortis mi eleifend. Praesent ut.";

  Book(this.title, this.writer, this.price, this.image, this.rating, this.pages);

  static List<Book> hardcodedBooks() {
    return [
      Book('Graphic Design Masterclass', 'John Smith', '€25.99', 'assets/images/booksviewer/indesign.jpg', 4.5, 123),
      Book('Digital Art Essentials', 'Emily Johnson', '€19.99', 'images/booksviewer/corel.jpg', 4.0, 150),
      Book('Web Development for Beginners', 'Michael Davis', '€12.99', 'images/booksviewer/drafter.jpg', 4.2, 180),
      Book('Photography Basics', 'Sarah White', '€29.99', 'images/booksviewer/max_3d.jpeg', 4.7, 210),
      Book('Video Editing with Premiere Pro', 'David Wilson', '€35.99', 'images/booksviewer/maya.jpeg', 4.8, 200),
      Book('3D Modeling with Blender', 'Laura Turner', '€18.99', 'images/booksviewer/photoshop.jpg', 4.4, 220),
      Book('UI/UX Design Fundamentals', 'Daniel Brown', '€29.99', 'images/booksviewer/premier.jpg', 4.6, 160),
      Book('Game Development with Unity', 'Chris Anderson', '€42.99', 'images/booksviewer/sketchup.jpeg', 4.9, 250),
      Book('JavaScript Programming Guide', 'Jessica Clark', '€14.99', 'images/booksviewer/webmaster.jpeg', 4.3, 190),
    ];
  }
}
