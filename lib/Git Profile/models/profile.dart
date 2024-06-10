import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile {
  @JsonKey(name: 'login')
  String? name = "";
  int? followers = 0;
  int? following = 0;
  int? public_repos = 0;
  String? blog = "";
  @JsonKey(name: 'avatar_url')
  String? image = "";

  Profile(
    this.name,
    this.followers,
    this.following,
    this.public_repos,
    this.blog,
    this.image,
  );

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
