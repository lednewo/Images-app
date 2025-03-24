import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:images_app/src/ui/home_view/tabbar_view/suggested_view.dart';
import 'package:images_app/src/util/colors/app_colors.dart';

class HomeView extends StatefulWidget {
  final Function(bool) afterScrollResult;
  const HomeView({super.key, required this.afterScrollResult});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool _isVisible = true;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (_isVisible) {
          _isVisible = false;
          widget.afterScrollResult(_isVisible);
        }
      }

      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (!_isVisible) {
          _isVisible = true;
          widget.afterScrollResult(_isVisible);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().colorBg,
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                floating: true,
                snap: true,
                centerTitle: true,
                title: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors().colorComponents),
                  child: Icon(Icons.person, color: AppColors().colorBg),
                ),
                bottom: TabBar(
                  tabs: [
                    Tab(text: 'Suggested'),
                    Tab(text: 'Liked'),
                    Tab(text: 'Library'),
                  ],
                  indicatorColor: AppColors().colorComponents,
                  indicatorWeight: 4,
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              SuggestedView(),
              SizedBox(),
              SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
