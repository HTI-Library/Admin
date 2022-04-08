import 'package:meta/meta.dart';

@immutable
abstract class MainState {}

class Empty extends MainState {}

class Loading extends MainState {}

class Loaded extends MainState {}

class LanguageLoaded extends MainState {}

class BottomChanged extends MainState {}

class SliderIndicator extends MainState {
  final int index;

  SliderIndicator({
    required this.index,
  });
}

class ThemeLoaded extends MainState {}

class ChangeModeState extends MainState {}

class ChangeLanguageState extends MainState {}

class Error extends MainState {
  final String error;

  Error(this.error);
}

class CategoriesChangeParentCategoryState extends MainState {
  final int index;

  CategoriesChangeParentCategoryState({
    required this.index,
  });
}

class InternetState extends MainState {}

class SignInState extends MainState {}

///--------------------------------------------------------------------------------------------- HTI
// enableLoginButton ---------------------------- start
class EnableLoginButtonState extends MainState {}

// enableLoginButton ---------------------------- end

// ------------ change photo ------------ //
class ChangeImageLoadingState extends MainState {}

class ChangeImageSuccessState extends MainState {}

class ChangeImageErrorState extends MainState {
  final String? error;

  ChangeImageErrorState(this.error);
}

class CreateUserLoading extends MainState {}

class CreateUserSuccess extends MainState {}

class GetAllUsersLoading extends MainState {}

class GetAllUsersSuccess extends MainState {}

class DeleteUserLoading extends MainState {}

class DeleteUserSuccess extends MainState {}

class GetAllBooksLoading extends MainState {}

class GetAllBooksSuccess extends MainState {}

class DeleteBookLoading extends MainState {}

class DeleteBookSuccess extends MainState {}

class GetAllCategoriesLoading extends MainState {}

class GetAllCategoriesSuccess extends MainState {}

class CreateBookLoading extends MainState {}

class CreateBookSuccess extends MainState {}

class SearchLoading extends MainState {}

class SearchSuccess extends MainState {}

class SelectMonth extends MainState {
  final int value;

  SelectMonth({
    required this.value,
  });
}

class SelectDay extends MainState {
  final int value;

  SelectDay({
    required this.value,
  });

  List<Object> get props => [
        value,
      ];
}

class EditBookLoading extends MainState {}

class EditBookSuccess extends MainState {}

class CreateLibraryLoading extends MainState {}

class CreateLibrarySuccess extends MainState {}

class EditLibraryLoading extends MainState {}

class EditLibrarySuccess extends MainState {}

class GetAllLibrariesLoading extends MainState {}

class GetAllLibrariesSuccess extends MainState {}

class DeleteLibraryLoading extends MainState {}

class DeleteLibrarySuccess extends MainState {}

class CreateTypeLoading extends MainState {}

class CreateTypeSuccess extends MainState {}

class EditTypeLoading extends MainState {}

class EditTypeSuccess extends MainState {}

class GetAllTypesLoading extends MainState {}

class GetAllTypesSuccess extends MainState {}

class DeleteTypeLoading extends MainState {}

class DeleteTypeSuccess extends MainState {}

class DeleteCategoryLoading extends MainState {}

class DeleteCategorySuccess extends MainState {}

class CreateCategoryLoading extends MainState {}

class CreateCategorySuccess extends MainState {}

class BookDetailsLoading extends MainState {}

class BookDetailsSuccess extends MainState {}

class GetBooksInBorrowLoading extends MainState {}

class GetBooksInBorrowSuccess extends MainState {}

class StartBorrowTimeLoading extends MainState {}

class StartBorrowTimeSuccess extends MainState {}

class ReturnBorrowLoading extends MainState {}

class ReturnBorrowSuccess extends MainState {}

class GetCatBooksLoading extends MainState {}

class GetCatBooksSuccess extends MainState {}

class EditCatLoading extends MainState {}

class EditCatSuccess extends MainState {}

class PickImageSuccessState extends MainState {}

class ClearImageSuccessState extends MainState {}

class PickPdfSuccess extends MainState {}

class ClearPickedPdfSuccess extends MainState {}



