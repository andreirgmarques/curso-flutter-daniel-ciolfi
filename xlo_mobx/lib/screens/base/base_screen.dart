import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/screens/create/create_screen.dart';
import 'package:xlo_mobx/screens/home/home_screen.dart';
import 'package:xlo_mobx/stores/page_store.dart';

class BaseScreen extends StatefulWidget {
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final PageController _pageController = PageController();

  final PageStore _pageStore = GetIt.I<PageStore>();

  @override
  void initState() {
    super.initState();

    reaction(
      (_) => _pageStore.page,
      (page) => _pageController.jumpToPage(page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          HomeScreen(),
          CreateScreen(),
          Container(
            color: Colors.yellow,
          ),
          Container(
            color: Colors.purple,
          ),
          Container(
            color: Colors.brown,
          ),
        ],
      ),
    );
  }
}
