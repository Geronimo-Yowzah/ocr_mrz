import 'package:flutter/material.dart';
import 'package:ocr_mrz/pages/home_page.dart';
import 'package:ocr_mrz/pages/tesseract.dart';
import 'package:ocr_mrz/widget/my_tab.dart';

class TabPage extends StatefulWidget {
  const TabPage({super.key});

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<CustomTab> myTabs = <CustomTab>[
    CustomTab(
        text: 'Home',
        icon: Icons.home_outlined,
        selectedIcon: Icons.home),
    CustomTab(
        text: 'Tesseract',
        icon: Icons.scanner_outlined,
        selectedIcon: Icons.scanner),
    CustomTab(
        text: 'History',
        icon: Icons.history_outlined,
        selectedIcon: Icons.history),
    CustomTab(
        text: 'About',
        icon: Icons.info_outline,
        selectedIcon: Icons.info),
  ];

  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: TabBarView(
          controller: _tabController,
          children: const [
            HomePage(),
            TesseractPage(),
            // AboutPage(),
          ],
        ),
        bottomNavigationBar: SizedBox(
          height: 83,
          child: TabBar(
            labelColor: Colors.blue,
            controller: _tabController,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            tabs: myTabs.map((CustomTab tab) {
              return MyTab(
                  tab: tab, isSelected: myTabs.indexOf(tab) == selectedIndex);
            }).toList(),
          ),
        ));
  }
}