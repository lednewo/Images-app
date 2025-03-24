import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:images_app/src/ui/conta_view/conta_view.dart';
import 'package:images_app/src/ui/explore_view/explore_view.dart';
import 'package:images_app/src/ui/home_view/home_view.dart';
import 'package:images_app/src/util/colors/app_colors.dart';
import 'package:images_app/src/util/controller/page_view_controller.dart';
import 'package:images_app/src/util/enums/pages_enum.dart';

class AppBottomBase extends StatefulWidget {
  const AppBottomBase({super.key});

  @override
  State<AppBottomBase> createState() => _AppBottomBaseState();
}

class _AppBottomBaseState extends State<AppBottomBase> {
  bool _isVisible = true;
  late List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages = [
      HomeView(
        afterScrollResult: afterScrollResult,
      ),
      ExploreView(),
      ContaView(),
    ];
  }

  afterScrollResult(bool visibility) {
    setState(() {
      _isVisible = visibility;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<PagesEnum>(
      valueListenable: PageViewController.pageselected,
      builder: (context, page, __) {
        return Scaffold(
          backgroundColor: AppColors().colorBg,
          body: _pages[page.index],
          bottomNavigationBar: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: _isVisible ? 80 : 0,
            color: AppColors().colorComponents,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 25, top: 10),
              child: GNav(
                onTabChange: (index) {
                  PageViewController.pageselected.value =
                      PagesEnum.values[index];
                },
                backgroundColor: AppColors().colorComponents,
                color: AppColors().colorBg,
                activeColor: AppColors().colorComponents,
                tabBackgroundColor: AppColors().colorBg,
                padding: const EdgeInsets.all(6),
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                gap: 3,
                iconSize: 32,
                textStyle:
                    TextStyle(color: AppColors().colorComponents, fontSize: 16),
                tabs: [
                  GButton(
                    icon: Icons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.explore_sharp,
                    text: 'Explore',
                  ),
                  GButton(
                    icon: Icons.account_box_outlined,
                    text: 'Conta',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
