class ApiRoutes {
  static const String BASE = "http://lms.elkood.com/";
  static const String BASE_URL = "http://lms.elkood.com";
  static const String BASE_API = BASE + "api/";

  /// _____________________AD Sections_________________________________________________
  ///
  /// Get
  static const String GET_ALL_ADS = BASE_API + "Ad/GetAllAds";

  ///____________________Code Sections____________________________
  ///
  /// Get
  static const String GET_STUDENT_CODES = BASE_API + "Code/GetStudentCodes";

  /// Post
  static const String ACTIVE_CODE = BASE_API + "Code/ActivateCode";

  ///_____________________Lesson  Sections_________________________________________________
  ///
  /// Get
  static const String GET_LESSONS = BASE_API + "Lesson/GetApiLessons";

  ///____________________Notification  Sections_________________________________________________
  ///
  /// Get
  static const String GET_API_NOTIFICATIONS =
      BASE_API + "Notification/GetApiNotifications";

  ///____________________Package  Sections_________________________________________________
  ///
  /// Get
  static const String GET_API_PACKAGES = BASE_API + "Package/GetApiPackages";

  ///___________________Settings  Sections_________________________________________________
  ///
  /// Get
  static const String GET_SETTINGS = BASE_API + "Settings/GetSettings";
  static const String CHECK_APP_VERSION = BASE_API + "Settings/CheckAppVersion";
  static const String IOS_STATE = 'https://elkood.com' + "/getup.json";

  ///___________________Subject  Sections_________________________________________________
  ///
  /// Get
  static const String GET_SUBJECTS = BASE_API + "Subject/GetApiSubjects";
  static const String GET_SUBJECTS_EXAM_SESSIONS =
      BASE_API + "Subject/GetSubjectExamSessions";
  static const String GET_PROGRESS_SUBJECTS =
      BASE_API + "Subject/GetProgressSubjects";

  ///___________________Unit  Sections_________________________________________________
  ///
  /// Get
  static const String GET_API_UNITS = BASE_API + "Unit/GetApiUnits";
  static const String GET_API_EXAM_SESSION =
      BASE_API + "Unit/GetApiExamSessions";

  ///___________________User  Sections_________________________________________________
  ///
  /// Get
  static const String GET_USERS = BASE_API + "User/GetUsers";
  static const String CHECK_STUDENT_SECURITY_STAMP =
      BASE_API + "User/CheckStudentSecurityStamp";
  static const String GET_DEFAULT_USER = BASE_API + "User/SignInDefaultStudent";
  static const String IS_USER_BLOCK = BASE_API + "User/IsUserBlocked";
  static const String SET_DEVICE_TOKEN = BASE_API + "User/SetDeviceToken";

  /// Post
  static const String SIGN_UP = BASE_API + "User/SignUp";
  static const String UPDATE_STUDENT = BASE_API + "User/UpdateStudent";
  static const String SIGN_IN = BASE_API + "User/SignIn";

  ///___________________Video  Sections_________________________________________________
  ///
  /// Get
  static const String GET_API_VIDEOS = BASE_API + "Video/GetApiVideosV2";
  static const String WATCH_VIDEOS = BASE_API + "Video/WatchVideo";
  static const String GET_STUDENT_QUESTIONS =
      BASE_API + "Video/GetStudentQuestions";
  static const String GET_VIDEO_QUESTION_DETAILS =
      BASE_API + "Video/GetVideoQuestionDetails";
  static const String GET_QUESTION_BANK =
      BASE_API + "Video/GetApiQuestionBanks";

  /// Post
  static const String ASK_VIDEO_QUESTION = BASE_API + "Video/AskVideoQuestion";
}
