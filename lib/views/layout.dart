import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './home_screen.dart';
import '../widgets/static.dart';


class Layout extends StatefulWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int _page = 0;
  late PageController pageController; // for tabs animation
  List<Widget> homeScreenItems = [
  const HomeScreen(),
  // const SearchScreen(),
  // const AddPostScreen(),
  // ProfileScreen(
  //   uid: FirebaseAuth.instance.currentUser!.uid,
  // ),
];

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {
    //Animating Page
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: homeScreenItems,
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: primaryColor,
        items: <BottomNavigationBarItem>[

          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: (_page == 0) ? backgroundColor : secondaryColor,
            ),
            label: '',
            backgroundColor: backgroundColor,
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: (_page == 1) ? backgroundColor : secondaryColor,
              ),
              label: '',
              backgroundColor: backgroundColor),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle,
                color: (_page == 2) ? backgroundColor : secondaryColor,
              ),
              label: '',
              backgroundColor: backgroundColor),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: (_page == 3) ? backgroundColor : secondaryColor,
            ),
            label: '',
            backgroundColor: backgroundColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: (_page == 4) ? backgroundColor : secondaryColor,
            ),
            label: '',
            backgroundColor: backgroundColor,
          ),
        ],
        onTap: navigationTapped,
        currentIndex: _page,
      ),
    );
  }
}