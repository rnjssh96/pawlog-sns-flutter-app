import 'package:pawlog/entity/entity.dart';
import 'package:pawlog/model/model.dart';
import 'package:pawlog/util/api/api.dart';

class UserRepository {
  Future<User> fetchUserInfo(String userHash) async {
    UserEntity userEntity;
    try {
      userEntity = await UserAPIClient.fetchUserInfo(userHash);
      // UserLocalStorage.writeUserInfo(userEntity);
    } catch (_) {
      // userEntity = await UserLocalStorage.readUserInfo();
    }

    return User.fromEntity(userEntity);
  }

  static Future<List<Friend>> fetchFriends(int userID) async {
    List<FriendEntity> friendEntities;
    try {
      friendEntities = await UserAPIClient.fetchFriends(userID);
      // UserLocalStorage.writeUserInfo(userEntity);
    } catch (_) {
      // userEntity = await UserLocalStorage.readUserInfo();
    }

    return friendEntities.map((entity) => Friend.fromEntity(entity)).toList();
  }

  static Future<List<ChatHeader>> fetchChatHeaders(int userID) async {
    List<ChatHeaderEntity> chatHeaderEntities;
    try {
      chatHeaderEntities = await UserAPIClient.fetchChatHeaders(userID);
      // UserLocalStorage.writeUserInfo(userEntity);
    } catch (_) {
      // userEntity = await UserLocalStorage.readUserInfo();
    }

    return chatHeaderEntities
        .map((entity) => ChatHeader.fromEntity(entity))
        .toList();
  }

  static Future<Profile> fetchUserProfile(
    int userID,
    int requestinUserID,
  ) async {
    ProfileEntity profileEntity;
    try {
      profileEntity = await UserAPIClient.fetchUserProfile(
        userID,
        requestinUserID,
      );
      // UserLocalStorage.writeUserInfo(userEntity);
    } catch (_) {
      // userEntity = await UserLocalStorage.readUserInfo();
    }

    return Profile.fromEntity(profileEntity);
  }

  static Future<List<Story>> fetchUserStories(
    int userID,
    int requestingUserID,
  ) async {
    List<StoryEntity> storyEntities;
    try {
      storyEntities = await StoryAPIClient.loadUserStories(
        userID,
        requestingUserID,
      );
      // UserLocalStorage.writeUserInfo(userEntity);
    } catch (_) {
      // userEntity = await UserLocalStorage.readUserInfo();
    }

    return storyEntities.map((entity) => Story.fromEntity(entity)).toList();
  }

  static Future<UserSearchResult> searchUserByEmail(String email) async {
    final entity = await UserAPIClient.searchUserByEmail(email);

    return entity == null ? null : UserSearchResult.fromEntity(entity);
  }
}
