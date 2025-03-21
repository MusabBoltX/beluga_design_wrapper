import 'package:example/Widget/cutomTabBar.dart';
import 'package:flutter/material.dart';
import 'package:example/Widget/tab_row.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  // late PageController _pageController;
  // double _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
    //  _pageController = PageController();


    // Add animation listener to catch in-between states
    _tabController.animation?.addListener(() {
      // if (_tabController.animation != null &&
      //     _currentIndex != _tabController.animation!.value) {
      //   setState(() {
      //     _currentIndex = _tabController.animation!.value;
      //   });
      // }
         _handleTabAnimation();
    });
  }
    void _handleTabAnimation() {
    // Force rebuild whenever animation changes
    setState(() {});
  }

  @override
  void dispose() {
    // _tabController.animation?.removeListener(_handleTabAnimation);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentPosition = _tabController.animation?.value ?? _tabController.index.toDouble();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: CustomTabBar(
          //  height: 36,
          tabs: [
            Tab(
              child: TabUtil.myTab(
                text: "Review",
                count: 3,
                isSelected: (currentPosition - 0).abs() < 0.5,  // Pass selected state
              ),
            ),
            Tab(
              child: TabUtil.myTab(
                text: "Approved",
                count: 2,
                isSelected: (currentPosition - 1).abs() < 0.5,
              ),
            ),
            Tab(
              child: TabUtil.myTab(
                text: "Rejected",
                count: 2,
                isSelected: (currentPosition - 2).abs() < 0.5,
              ),
            ),
          ],

          tabViews: const [
            Center(child: Text("Review Screen")),
            Center(child: Text("Approved Screen")),
            Center(child: Text("Rejected Screen")),
          ],
          tabController: _tabController, // Pass controller
        ),
      ),
    );
  }
}
