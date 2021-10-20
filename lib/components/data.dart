import 'package:pro_app/models/product.dart';

class AppData {
  static List<Product> productList = [
    Product(
        id: 1,
        name: 'Pubg',
        price: 20,
        isSelected: true,
        isliked: false,
        image: 'assets/images/pubgLogo.png',
        category: "Trending Now"),
    Product(
        id: 2,
        name: 'FreeFire',
        price: 15.00,
        isliked: false,
        image: 'assets/images/freefireLogo.png',
        category: "Trending Now"),
    Product(
        id: 2,
        name: 'Bigo Live',
        price: 35.00,
        isliked: false,
        image: 'assets/images/bigoLogo.png',
        category: "Trending Now"),
    Product(
        id: 2,
        name: 'Likee',
        price: 25.00,
        isliked: false,
        image: 'assets/images/likeeLogo.png',
        category: "Trending Now"),
  ];
  static List<Product> cartList = [
    Product(
        id: 1,
        name: 'Pubg',
        price: 25.00,
        isSelected: true,
        isliked: false,
        image: 'assets/images/pubgLogo.png',
        category: "Trending Now"),
    Product(
        id: 2,
        name: 'Likee',
        price: 24.00,
        isliked: false,
        image: 'assets/images/likeeLogo.png',
        category: "Trending Now"),
    Product(
        id: 1,
        name: 'FreeFire',
        price: 10.00,
        isliked: false,
        image: 'assets/images/freefireLogo.png',
        category: "Trending Now"),
    Product(
        id: 2,
        name: 'Bigo live',
        price: 24.00,
        isSelected: true,
        isliked: false,
        image: 'assets/images/bigoLogo.png',
        category: "Trending Now"),
  ];
  static String description =
      "Clean lines, versatile and timeless—the people shoe returns with the Nike Air Max 90. Featuring the same iconic Waffle sole, stitched overlays and classic TPU accents you come to love, it lets you walk among the pantheon of Air. ßNothing as fly, nothing as comfortable, nothing as proven. The Nike Air Max 90 stays true to its OG running roots with the iconic Waffle sole, stitched overlays and classic TPU details. Classic colours celebrate your fresh look while Max Air cushioning adds comfort to the journey.";
}
