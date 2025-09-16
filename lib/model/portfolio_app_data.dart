// Data models
import 'package:flutter/cupertino.dart';

class PortfolioAppData {
  final String name;
  final IconData? icon;
  final String description;
  final String? image;
  final String? downloadUrl;

  PortfolioAppData({
    required this.name,
     this.icon,
    required this.description,
    this.image,
    this.downloadUrl,
  });
}