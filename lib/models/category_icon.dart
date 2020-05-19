import 'package:flutter/material.dart';

class CategoryIcon {
  String name;
  IconData icon;

  CategoryIcon(this.name, this.icon);
}

List<CategoryIcon> category_icons = [
  CategoryIcon('airplanemode_active', Icons.airplanemode_active),
  CategoryIcon('directions_boat', Icons.directions_boat),
  CategoryIcon('directions_bus', Icons.directions_bus),
  CategoryIcon('directions_transit', Icons.directions_transit),
  CategoryIcon('directions_car', Icons.directions_car),
  CategoryIcon('directions_bike', Icons.directions_bike),
  CategoryIcon('directions_walk', Icons.directions_walk),
  CategoryIcon('priority_high', Icons.priority_high),
];
