class TranslationModel {

  late String myProfile;
  late String notification;
  late String notificationNo;
  late String myMessage;
  late String myMessageNo;
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
  late String author;
  late String pagesNum;
  late String edition;
  late String yes;
  late String no;
  late String loginToLibrary;
  late String password;
  late String id;
  late String home;
  late String categories;
  late String saved;
  late String account;
  late String myBorrowBook;
  // late String myReturnBook;
  late String noSave;


  late String cancel;
  late String confirm;
  late String delete;
  late String deleteBook;
  late String edit;
  late String addLibrary;
  late String libraries;
  late String noBooksToPresent;
  late String reload;
  late String orders;
  late String deliveries;
  late String addBook;
  late String upload;

  late String uploadPdf;
  late String libraryDepartment;
  late String bookType;
  late String bookName;
  late String bookEdition;
  late String bookAuthor;
  late String bookPages;
  late String bookCategory;
  late String bookNumber;
  late String bookCopies;
  late String editBook;
  late String save;
  late String name;
  late String code;



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
    notificationNo = json['notificationNo'];
    myMessage = json['myMessage'];
    myMessageNo = json['myMessageNo'];
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
    edition = json['edition'];
    yes = json['yes'];
    no = json['no'];
    loginToLibrary = json['loginToLibrary'];
    password = json['password'];
    id = json['id'];
    available = json['available'];
    unavailable = json['unavailable'];
    bookName = json['bookName'];
    myBorrowBook = json['myBorrowBook'];
    // myReturnBook = json['myReturnBook'];

    home = json['home'];
    categories = json['categories'];
    saved = json['saved'];
    noSave = json['noSave'];
    account = json['account'];


    delete = json['delete'];
    deleteBook = json['deleteBook'];
    edit = json['edit'];
    cancel = json['cancel'];
    confirm = json['confirm'];
    addLibrary = json['addLibrary'];
    libraries = json['libraries'];
    noBooksToPresent = json['noBooksToPresent'];
    reload = json['reload'];
    orders = json['orders'];
    deliveries = json['deliveries'];
    addBook = json['addBook'];
    upload = json['upload'];

    uploadPdf = json['uploadPdf'];
    libraryDepartment = json['libraryDepartment'];
    bookType = json['bookType'];
    bookName = json['bookName'];
    bookEdition = json['bookEdition'];
    bookAuthor = json['bookAuthor'];
    bookPages = json['bookPages'];
    bookCategory = json['bookCategory'];
    bookNumber = json['bookNumber'];
    bookCopies = json['bookCopies'];
    editBook = json['editBook'];
    save = json['save'];
    name = json['name'];
    code = json['code'];

  }
}
