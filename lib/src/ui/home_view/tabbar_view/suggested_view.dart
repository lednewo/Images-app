import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:images_app/src/ui/home_view/widgets/image_tile.dart';

class SuggestedView extends StatefulWidget {
  const SuggestedView({super.key});

  @override
  State<SuggestedView> createState() => _SuggestedViewState();
}

class _SuggestedViewState extends State<SuggestedView> {
  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      padding: EdgeInsets.all(12),
      itemBuilder: (context, index) {
        return ImageTile(
          index: index,
          imageSource: 'https://picsum.photos/300/500?random8=$index',
          extent: (index % 2) == 0 ? 300 : 150,
        );
      },
    );
  }
}
