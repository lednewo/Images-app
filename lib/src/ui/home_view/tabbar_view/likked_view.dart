import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class LikkedView extends StatelessWidget {
  final List<int> favoriteItems;

  const LikkedView({
    super.key,
    required this.favoriteItems,
  });

  @override
  Widget build(BuildContext context) {
    return favoriteItems.isEmpty
        ? Center(
            child: Text(
              'Nenhum item adicionado',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          )
        : ListView.builder(
            itemCount: favoriteItems.length,
            itemBuilder: (context, index) {
              int itemIndex = favoriteItems[index];
              return SizedBox(
                width: 300,
                height: 250,
                child: Row(
                  children: [
                    CachedNetworkImage(
                      imageUrl:
                          'https://picsum.photos/300/500?random1=$itemIndex',
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ],
                ),
              );
            },
          );
  }
}
