import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:images_app/src/ui/home_view/widgets/image_tile.dart';

class SuggestedView extends StatelessWidget {
  final List<bool> favoriteStatus;
  final Function(int) toggleFavorite;

  const SuggestedView({
    super.key,
    required this.favoriteStatus,
    required this.toggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      padding: const EdgeInsets.all(12),
      itemCount: favoriteStatus.length,
      itemBuilder: (context, index) {
        return ImageTile(
          onTap: () => toggleFavorite(index),
          index: index,
          icon: favoriteStatus[index]
              ? Icon(Icons.favorite)
              : Icon(Icons.favorite_border_outlined),
          imageSource: 'https://picsum.photos/300/500?random1=$index',
          extent: (index % 2) == 0 ? 300 : 150,
        );
      },
    );
  }
}
