import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget imageCasha(link) {
  return CachedNetworkImage(
    imageUrl: link,
    progressIndicatorBuilder: (context, url, downloadProgress) =>
        CircularProgressIndicator(value: downloadProgress.progress),
    errorWidget: (context, url, error) => Icon(Icons.error),
  );
}
