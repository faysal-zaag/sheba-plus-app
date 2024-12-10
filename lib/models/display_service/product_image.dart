/**
 * Created by mahabubshozib on 12/10/24.
 * Author: Md Mahabub Hossain Shozib
 */

class ProductImage {
  final int id;
  final String image;

  ProductImage({
     this.id = 0,
     this.image = '',
  });


  factory ProductImage.fromJson(Map<String, dynamic> json) {
    return ProductImage(
      id: json['id'] as int,
      image: json['image'] as String,
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
    };
  }
}
