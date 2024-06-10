// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      json['login'] as String?,
      json['followers'] as int?,
      json['following'] as int?,
      json['public_repos'] as int?,
      json['blog'] as String?,
      json['avatar_url'] as String?,
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'login': instance.name,
      'followers': instance.followers,
      'following': instance.following,
      'public_repos': instance.public_repos,
      'blog': instance.blog,
      'avatar_url': instance.image,
    };
