import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sheba_plus/utils/constant/app_border_radius.dart';
import 'package:sheba_plus/utils/constant/app_images.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  final double height;
  final double width;
  final String? imageUrl;
  final Widget? child;
  final bool imageColorFilter;
  final bool isCircular;

  const CustomCachedNetworkImage({
    super.key,
    required this.height,
    required this.width,
    required this.imageUrl,
    this.child,
    this.imageColorFilter = false,
    this.isCircular = false,
  });

  @override
  Widget build(BuildContext context) {
    return imageUrl != null ? _buildNetworkImage() : _buildPlaceholderImage();
  }

  // Builds the cached network image with optional color filter
  Widget _buildNetworkImage() {
    return CachedNetworkImage(
      imageUrl: imageUrl ?? "",
      imageBuilder: (context, imageProvider) => _buildImageContainer(imageProvider),
      placeholder: (context, url) => _buildImagePlaceholder(),
      errorWidget: (context, url, error) => _buildImagePlaceholder(),
    );
  }

  // Builds the container for network image
  Widget _buildImageContainer(ImageProvider imageProvider) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: isCircular ? null : AppBorderRadius.circularRadius2,
        image: DecorationImage(
          colorFilter: _getColorFilter(),
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }

  // Returns the color filter for darkening the image
  ColorFilter _getColorFilter() {
    return ColorFilter.mode(
      Colors.black.withOpacity(imageColorFilter ? 0.5 : 0.5), // Adjust darkness
      BlendMode.darken,
    );
  }

  // Builds a placeholder or error image when the network image is unavailable
  Widget _buildImagePlaceholder() {
    return Image.asset(
      AppImages.megaSell,
      height: height,
      width: width,
      fit: BoxFit.cover,
    );
  }

  // Builds a default image when imageUrl is null
  Widget _buildPlaceholderImage() {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: isCircular ? null : AppBorderRadius.circularRadius2,
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.5),
            BlendMode.darken,
          ),
          image: AssetImage(AppImages.placeHolder),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
