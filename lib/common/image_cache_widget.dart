import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

class ImageCacheWidget extends StatelessWidget {
  final String imgUrl;
  final double width;

  const ImageCacheWidget({Key key, this.imgUrl, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imgUrl,
      width: width,
      fit: BoxFit.cover,
    );
  }
}
