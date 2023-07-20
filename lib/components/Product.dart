import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Product {
  final String image, title, description;
  final int price, id;
  final Color color;
  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    required this.color,
  });
}

List<Product> products = [
  Product(
    id: 1,
    image: "images/menu/1.png",
    title: "Risoles Mayo",
    description: "Taruh deskripsi produk disini, terimakasih.",
    price: 15000,
    color: Color.fromARGB(255, 12, 52, 36),
  ),
  Product(
    id: 2,
    image: "images/menu/1.png",
    title: "Risoles Rogout",
    description: "Taruh deskripsi produk disini, terimakasih.",
    price: 10000,
    color: Color.fromARGB(255, 12, 52, 36),
  ),
  Product(
    id: 3,
    image: "images/menu/1.png",
    title: "Sosis Solo",
    description: "Taruh deskripsi produk disini, terimakasih.",
    price: 12000,
    color: Color.fromARGB(255, 12, 52, 36),
  ),
  Product(
    id: 4,
    image: "images/menu/1.png",
    title: "Kroket",
    description: "Taruh deskripsi produk disini, terimakasih.",
    price: 10000,
    color: Color.fromARGB(255, 12, 52, 36),
  ),
  Product(
    id: 5,
    image: "images/menu/1.png",
    title: "Pastel",
    description: "Taruh deskripsi produk disini, terimakasih.",
    price: 12000,
    color: Color.fromARGB(255, 12, 52, 36),
  ),
  Product(
    id: 6,
    image: "images/menu/1.png",
    title: "Bitterballen",
    description: "Taruh deskripsi produk disini, terimakasih.",
    price: 15000,
    color: Color.fromARGB(255, 12, 52, 36),
  ),
  Product(
    id: 7,
    image: "images/menu/1.png",
    title: "Pisang Nugget",
    description: "Taruh deskripsi produk disini, terimakasih.",
    price: 12000,
    color: Color.fromARGB(255, 12, 52, 36),
  ),
  Product(
    id: 8,
    image: "images/menu/1.png",
    title: "Cwie Mie Malang",
    description: "Taruh deskripsi produk disini, terimakasih.",
    price: 18000,
    color: Color.fromARGB(255, 12, 52, 36),
  ),
];

final formatter = NumberFormat.simpleCurrency(locale: "id_ID");
