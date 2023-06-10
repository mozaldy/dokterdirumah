import 'package:dokter_dirumah/providers/user_provider.dart';
import 'package:dokter_dirumah/views/home_screen/add_disease_screen.dart';
import 'package:dokter_dirumah/model/user.dart' as model;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './home_screen/main_screen.dart';
import './home_screen/profile_screen.dart';
import './home_screen/search_screen.dart';
import '../widgets/static.dart';

class Layout extends StatefulWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int _page = 0;
  late PageController pageController; // for tabs animation
  List<Widget> viewDoctor = [
    const MainScreen(),
    const SearchScreen(),
    const ProfileScreen(),
    const AddDisease(),
  ];
  List<Widget> viewUser = [
    const MainScreen(),
    const SearchScreen(),
    const ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    addData();
  }

  addData() async {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    await userProvider.refreshUser();
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
    pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    model.User user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: user.dokter ? viewDoctor : viewUser,
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
                Icons.person,
                color: (_page == 2) ? backgroundColor : secondaryColor,
              ),
              label: '',
              backgroundColor: backgroundColor),
          if (user.dokter)
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_circle,
                  color: (_page == 3) ? backgroundColor : secondaryColor,
                ),
                label: '',
                backgroundColor: backgroundColor),
        ],
        onTap: navigationTapped,
        currentIndex: _page,
      ),
    );
  }
}
