import 'package:flutter/material.dart';

class MyTab extends StatelessWidget {
  final CustomTab tab;
  final bool isSelected;

  const MyTab({super.key, required this.tab, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            isSelected ? tab.selectedIcon : tab.icon,
          ),
          Text(tab.text,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 9,
                color: isSelected ? Colors.orange : Colors.blue,
              ))
        ],
      ),
    );
  }
}

class CustomTab {
  final String text;
  final IconData icon;
  final IconData selectedIcon;

  CustomTab(
      {required this.text, required this.icon, required this.selectedIcon});
}