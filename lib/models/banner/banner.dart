import 'package:sheba_plus/models/executor/created_by.dart';

/**
 * Created by mahabubshozib on 12/26/24.
 * Author: Md Mahabub Hossain Shozib
 */

class Banner {
  final int id;
  final String? description;
  final String? image;
  final int position;
  final bool active;
  final String? link;
  final String? buttonName;
  final String? bannerType;
  final num createdAt;
  final num? updatedAt;
  final Executor? createdBy;
  final Executor? updatedBy;

  Banner({
    this.id = 0,
    required this.description,
    this.image,
    required this.position,
    required this.active,
    this.link,
    this.buttonName,
    this.bannerType,
    required this.createdAt,
    this.updatedAt,
    required this.createdBy,
    this.updatedBy,
  });

  factory Banner.fromJson(Map<String, dynamic> json) {
    return Banner(
      id: json['id'],
      description: json['description'],
      image: json['image'],
      position: json['position'],
      active: json['active'],
      link: json['link'],
      buttonName: json['buttonName'],
      bannerType: json['bannerType'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      createdBy: Executor.fromJson(json['createdBy']),
      updatedBy: json['updatedBy'] != null
          ? Executor.fromJson(json['updatedBy'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'image': image,
      'position': position,
      'active': active,
      'link': link,
      'buttonName': buttonName,
      'bannerType': bannerType,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'createdBy': createdBy?.toJson(),
      'updatedBy': updatedBy?.toJson(),
    };
  }
}
