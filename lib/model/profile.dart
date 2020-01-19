import 'package:equatable/equatable.dart';

import 'package:pawlog/entity/entity.dart';

class Profile extends Equatable {
  final int userID;
  final String email;
  final String name;
  final String imageURL;
  final String intro;

  final int stories;
  final int followers;
  final int followings;

  final int isFollowing;

  const Profile._({
    this.userID,
    this.email,
    this.name,
    this.imageURL,
    this.intro,
    this.stories,
    this.followers,
    this.followings,
    this.isFollowing,
  });

  @override
  List<Object> get props => [email];

  factory Profile.fromEntity(ProfileEntity entity) {
    return Profile._(
      userID: entity.userID,
      email: entity.email,
      name: entity.name,
      imageURL: entity.imageURL,
      intro: entity.intro,
      stories: entity.stories,
      followers: entity.followers,
      followings: entity.followings,
      isFollowing: entity.isFollowing,
    );
  }
}
