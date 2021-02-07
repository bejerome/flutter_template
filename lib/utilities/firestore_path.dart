/*
This class defines all the possible read/write locations from the Firestore database.
In future, any new path can be added here.
This class work together with FirestoreService and FirestoreDatabase.
 */

class FirestorePath {
  static String todo(String uid, String todoId) => 'users/$uid/todos/$todoId';
  static String todos(String uid) => 'users/$uid/todos';
}

class FirestoreUserPath {
  static String userDetails(String uid) => 'users/$uid/user_info';
  static String addUserInfo(String uid, String refId) =>
      'users/$uid/user_info/$refId';
}

class FirestoreCampSitePath {
  static String campingSite(String uid, String siteId) =>
      'users/$uid/camp_sites/$siteId';
  static String campingSites(String uid) =>
      'users/TD9gQMlw8MQVQJK9ApKeReCAGrj1/camp_sites';
}
