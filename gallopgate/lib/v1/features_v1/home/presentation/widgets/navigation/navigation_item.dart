import 'package:flutter/material.dart';

class NavigationItem {
  
  const NavigationItem({
    required this.label,
    required this.icon,
    required this.iconSelected
  });

  final IconData icon;
  final IconData iconSelected;
  final String label;

}