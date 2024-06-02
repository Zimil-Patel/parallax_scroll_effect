import 'package:flutter/material.dart';
import 'package:parallax_scroll_effect/components/video_card.dart';

import '../utils/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (value) => setState(() {
                selectedIndex = value;
              }),
              itemCount: 5,
              itemBuilder: (context, index) => VideoCard(
                videoPath: videos[index],
                isSelected: selectedIndex == index,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
