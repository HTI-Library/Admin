class TranslationModel {

  late String myProfile;
  late String notification;
  late String myMessage;
  late String calender;
  late String setting;
  late String changeLanguage;
  late String language;
  late String arabic;
  late String english;
  late String themes;
  late String light;
  late String dark;
  late String info;
  late String privacyPolicy;
  late String getHelp;
  late String aboutUs;
  late String logOut;
  late String topBorrowBooks;
  late String search;
  late String recentlyReturned;
  late String htiMaterial;
  late String graduationProjects;
  late String available;
  late String unavailable;
  late String borrow;
  late String read;
  late String overview;
  late String moreEditionOfThisBook;
  late String moreBooksFromThisCategory;
  late String moreBooksFromThisAuthor;
  late String doYouWantToLogout;
  late String bookName;
  late String author;
  late String pagesNum;
  late String yes;
  late String no;
  late String loginToLibrary;
  late String password;
  late String id;


  late String logIn;



  TranslationModel.fromJson(Map<String, dynamic> json) {
    changeLanguage = json['changeLanguage'];
    logIn = json['logIn'];
    arabic = json['arabic'];
    english = json['english'];
    setting = json['setting'];
    language = json['language'];
    themes = json['themes'];
    myProfile = json['myProfile'];
    notification = json['notification'];
    myMessage = json['myMessage'];
    calender = json['calender'];
    info = json['info'];
    privacyPolicy = json['privacyPolicy'];
    getHelp = json['getHelp'];
    aboutUs = json['aboutUs'];
    logOut = json['logOut'];
    search = json['search'];
    dark = json['dark'];
    light = json['light'];
    topBorrowBooks = json['topBorrowBooks'];
    recentlyReturned = json['recentlyReturned'];
    htiMaterial = json['htiMaterial'];
    graduationProjects = json['graduationProjects'];
    borrow = json['borrow'];
    read = json['read'];
    overview = json['overview'];
    moreEditionOfThisBook = json['moreEditionOfThisBook'];
    moreBooksFromThisCategory = json['moreBooksFromThisCategory'];
    moreBooksFromThisAuthor = json['moreBooksFromThisAuthor'];
    doYouWantToLogout = json['doYouWantToLogout'];
    author = json['author'];
    pagesNum = json['pagesNum'];
    yes = json['yes'];
    no = json['no'];
    loginToLibrary = json['loginToLibrary'];
    password = json['password'];
    id = json['id'];
    available = json['available'];
    unavailable = json['unavailable'];
    bookName = json['bookName'];

  }
}
