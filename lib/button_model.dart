import 'package:flutter/material.dart';

class ButtonData {
  final IconData icons;
  final String buttonText;
  ButtonData({
    required this.icons,
    required this.buttonText,
  });
}

List<ButtonData> data = [
  ButtonData(icons: Icons.home, buttonText: "Home"),
  ButtonData(icons: Icons.search, buttonText: "Search"),
  ButtonData(icons: Icons.star_border, buttonText: "Favorite"),
  ButtonData(icons: Icons.chat_outlined, buttonText: "Help"),
];
List<ButtonData> data2 = [
  ButtonData(icons: Icons.timer, buttonText: "Timer"),
  ButtonData(icons: Icons.notifications, buttonText: "Notification"),
];
