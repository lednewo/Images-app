import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:images_app/src/ui/home_view/widgets/image_tile.dart';
import 'package:images_app/src/util/colors/app_colors.dart';

const double imageSlideHeight = 320;

class ExploreView extends StatefulWidget {
  const ExploreView({super.key});

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  var selectedSlideIndex = 0;

  bool _isVisible = true;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (_isVisible &&
            _scrollController.position.pixels >= imageSlideHeight) {
          setState(() {
            _isVisible = false;
          });
        }
      }

      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (!_isVisible) {
          setState(() {
            _isVisible = true;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isVisible ? Colors.black : AppColors().colorBg,
      body: SafeArea(
        top: !_isVisible,
        child: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: Colors.black,
                expandedHeight: imageSlideHeight,
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    children: [
                      PageView.builder(
                        itemCount: 5,
                        onPageChanged: (value) {
                          setState(() {
                            selectedSlideIndex = value;
                          });
                        },
                        itemBuilder: (context, index) {
                          return Stack(
                            fit: StackFit.expand,
                            children: [
                              CachedNetworkImage(
                                imageUrl:
                                    'https://picsum.photos/300/500?random2=slide_$index',
                                fit: BoxFit.cover,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        Colors.black,
                                        Colors.transparent
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      stops: [0.001, 1]),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      Positioned(
                        bottom: 20,
                        right: 0,
                        left: 0,
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          children: List.generate(
                            5,
                            (index) {
                              return AnimatedContainer(
                                duration: Duration(microseconds: 600),
                                width: 10,
                                height: 10,
                                margin: EdgeInsets.symmetric(horizontal: 6),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: index == selectedSlideIndex
                                      ? Colors.white
                                      : Colors.grey,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: SliverAppBar(
                  backgroundColor: _isVisible
                      ? AppColors().colorBg
                      : AppColors().colorBg.withAlpha(200),
                  centerTitle: true,
                  floating: true,
                  snap: true,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(12))),
                  title: TextButton.icon(
                    onPressed: () {},
                    label: Text(
                      'Search',
                      style: TextStyle(color: AppColors().colorComponents),
                    ),
                    icon: Icon(Icons.search_rounded),
                    style: ButtonStyle(
                      foregroundColor:
                          WidgetStatePropertyAll(AppColors().colorComponents),
                      iconSize: WidgetStatePropertyAll(24),
                    ),
                  ),
                ),
              ),
            ];
          },
          body: Container(
            color: AppColors().colorBg,
            child: MasonryGridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              padding: EdgeInsets.all(12),
              itemBuilder: (context, index) {
                return ImageTile(
                  index: index,
                  imageSource:
                      'https://picsum.photos/300/500?random=img_$index',
                  extent: (index % 2) == 0 ? 300 : 150,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
