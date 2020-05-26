import 'package:flutter/material.dart';

class CategoryIcon {
  String name;
  IconData icon;

  CategoryIcon(this.name, this.icon);
}

List<CategoryIcon> category_icons = [
  //travel
  CategoryIcon('airplanemode_active', Icons.airplanemode_active),
  CategoryIcon('location_city', Icons.location_city),
  CategoryIcon('directions_boat', Icons.directions_boat),
  CategoryIcon('directions_bus', Icons.directions_bus),
  CategoryIcon('directions_transit', Icons.directions_transit),
  CategoryIcon('directions_car', Icons.directions_car),
  CategoryIcon('directions_bike', Icons.directions_bike),
  CategoryIcon('directions_walk', Icons.directions_walk),
  //locations
  CategoryIcon('restaurant', Icons.restaurant),
  CategoryIcon('local_pizza', Icons.local_pizza),
  CategoryIcon('fastfood', Icons.fastfood),
  CategoryIcon('local_bar', Icons.local_bar),
  CategoryIcon('local_hotel', Icons.local_hotel),
  CategoryIcon('local_hospital', Icons.local_hospital),
  CategoryIcon('local_mall', Icons.local_mall),
  CategoryIcon('local_movies', Icons.local_movies),
  //activities
  CategoryIcon('beach_access', Icons.beach_access),
  CategoryIcon('casino', Icons.casino),
  CategoryIcon('fitness_center', Icons.fitness_center),
  CategoryIcon('golf_course', Icons.golf_course),
  CategoryIcon('pool', Icons.pool),
  CategoryIcon('event', Icons.event),
  CategoryIcon('nature', Icons.nature),
  CategoryIcon('landscape', Icons.landscape),
  //general
  CategoryIcon('wc', Icons.wc),
  CategoryIcon('cake', Icons.cake),
  CategoryIcon('business_center', Icons.business_center),
  CategoryIcon('people', Icons.people),
  //not selected
  CategoryIcon('priority_high', Icons.priority_high),
];
