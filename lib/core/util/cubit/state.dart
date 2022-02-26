import 'package:hti_library_admin/core/models/login_model.dart';
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

// home page ---------------------------- start

class HomeLoadingState extends MainState {}

class HomeSuccessState extends MainState {}

class HomeErrorState extends MainState {}

// home page ---------------------------- end

// categories page ---------------------------- start

class CategoriesChangeParentCategoryState extends MainState {
  final int index;

  CategoriesChangeParentCategoryState({
    required this.index,
  });
}

class CategoriesLoadingState extends MainState {}

class CategoriesSuccessState extends MainState {}

class CategoriesErrorState extends MainState {}

// categories page ---------------------------- end

// wishlist page ---------------------------- start
class WishlistLoadingState extends MainState {}

class WishlistSuccessState extends MainState {}

class WishlistErrorState extends MainState {}

// wishlist page ---------------------------- end

// change grid to list ----------------start
class ChangeGridToList extends MainState {}

// change grid to list ----------------end

class SelectSize extends MainState {}

class SelectColor extends MainState {}

class ClearVariationsState extends MainState {}

class Addition extends MainState {}

class Subtraction extends MainState {}

class CartAddition extends MainState {}

class CartSubtraction extends MainState {}

class CartSubTotal extends MainState {}

class FillCartMapState extends MainState {}

class InternetState extends MainState {}

class RemoveFromCartMapState extends MainState {}

class AddToCartMapState extends MainState {}

// Product Details page ---------------------------- start
class ProductDetailsLoading extends MainState {}

class ProductDetailsSuccess extends MainState {}

class ProductDetailsError extends MainState {}

// Product Details page ---------------------------- end

// home page ---------------------------- start

class ChangeHasEndState extends MainState {}

class CategoryProductsLoadingState extends MainState {}

class CategoryProductsLoadingMoreState extends MainState {}

class CategoryProductsSuccessState extends MainState {}

class CategoryProductsErrorState extends MainState {
  final String error;

  CategoryProductsErrorState(this.error);
}

// home page ---------------------------- end

class SignInState extends MainState {}

class SignOutState extends MainState {}

class MyAddressLoadingState extends MainState {}

class MyAddressSuccessState extends MainState {}

class MyAddressErrorState extends MainState {
  final String error;

  MyAddressErrorState(this.error);
}

class AddAddressLoadingState extends MainState {}

class AddAddressSuccessState extends MainState {
  final String message;

  AddAddressSuccessState(this.message);
}

class AddAddressErrorState extends MainState {
  final String error;

  AddAddressErrorState(this.error);
}

class DeleteAddressLoadingState extends MainState {}

class DeleteAddressSuccessState extends MainState {
  final String message;

  DeleteAddressSuccessState(this.message);
}

class DeleteAddressErrorState extends MainState {
  final String error;

  DeleteAddressErrorState(this.error);
}
// get blogs ---------------------------- start

class BlogsLoadingState extends MainState {}

class BlogsSuccessState extends MainState {}

// home blogs ---------------------------- end

// GetAllBrands ---------------------------- start
class GetAllBrandsLoading extends MainState {}

class GetAllBrandsSuccess extends MainState {}

// GetAllBrands ---------------------------- end

// Get Brand Details ---------------------------- start
class GetBrandDetailsLoading extends MainState {}

class GetBrandDetailsSuccess extends MainState {}

// Get Brand Details ---------------------------- end

// Get Blog Details ---------------------------- start
class GetBlogDetailsLoading extends MainState {}

class GetBlogDetailsSuccess extends MainState {}

// Get Blog Details ---------------------------- end

// Search ---------------------------- start
class SearchLoadingState extends MainState {}

class SearchSuccessState extends MainState {}

class SearchErrorState extends MainState {
  final String error;

  SearchErrorState(this.error);
}

// Search ---------------------------- end

// My Account ---------------------------- start
class MyAccountLoadingState extends MainState {}

class MyAccountSuccessState extends MainState {}

class MyAccountErrorState extends MainState {
  final String error;

  MyAccountErrorState(this.error);
}

class UpdateAccountLoadingState extends MainState {}

class SelectedGovernmentState extends MainState {}

class SelectedCityState extends MainState {}

class UpdateAccountSuccessState extends MainState {
  final String message;

  UpdateAccountSuccessState(this.message);
}

class UpdateAccountErrorState extends MainState {
  final String error;

  UpdateAccountErrorState(this.error);
}

// My Account ---------------------------- end

class NotificationLoadingState extends MainState {}

class NotificationSuccessState extends MainState {}

class NotificationErrorState extends MainState {
  final String error;

  NotificationErrorState(this.error);
}

// about us ---------------------------- start
class AboutUsLoadingState extends MainState {}

class AboutUsSuccessState extends MainState {}

class AboutUsErrorState extends MainState {
  final String error;

  AboutUsErrorState(this.error);
}

// about us ---------------------------- end

class ComparesLoadingState extends MainState {}

class ComparesSuccessState extends MainState {}

class ComparesErrorState extends MainState {
  final String error;

  ComparesErrorState(this.error);
}

class AddComparesLoadingState extends MainState {}

class AddComparesSuccessState extends MainState {
  final String message;

  AddComparesSuccessState(this.message);
}

class AddComparesErrorState extends MainState {
  final String error;

  AddComparesErrorState(this.error);
}

class RemoveComparesLoadingState extends MainState {}

class RemoveComparesSuccessState extends MainState {
  final String message;

  RemoveComparesSuccessState(this.message);
}

class RemoveComparesErrorState extends MainState {
  final String error;

  RemoveComparesErrorState(this.error);
}

class ContactUsLoadingState extends MainState {}

class ContactUsSuccessState extends MainState {
  final String message;

  ContactUsSuccessState(this.message);
}

// FAQS start -------------------------
class FAQsLoadingState extends MainState {}

class FAQsSuccessState extends MainState {}
// FAQS end -------------------------

// news letter start -------------------------
class NewsLetterLoadingState extends MainState {}

class NewsLetterSuccessState extends MainState {
  final String message;

  NewsLetterSuccessState(this.message);
}
// news letter end -------------------------

class UsedProductLoadingState extends MainState {}

class UsedProductSuccessState extends MainState {}

class UsedProductErrorState extends MainState {
  final String error;

  UsedProductErrorState(this.error);
}

class AddReviewLoadingState extends MainState {}

class ClearSearchState extends MainState {}

class SelectBrand extends MainState {}

class AddBrandSelected extends MainState {}

class AddCategoriesSelected extends MainState {}

class AddReviewSuccessState extends MainState {
  final String message;

  AddReviewSuccessState(this.message);
}

class AddReviewErrorState extends MainState {
  final String error;

  AddReviewErrorState(this.error);
}

// Get Blog Details ---------------------------- start
class GetOrdersLoading extends MainState {}

class GetOrdersSuccess extends MainState {}

// Get Blog Details ---------------------------- end

// news letter start -------------------------
class GetUsedMarketLoadingState extends MainState {}

class GetUsedMarketSuccessState extends MainState {}
// news letter end -------------------------

// GetUsedMarketDetails ---------------------------- start
class GetUsedMarketDetailsLoading extends MainState {}

class GetUsedMarketDetailsSuccess extends MainState {}

// GetUsedMarketDetails ---------------------------- end

class ChangeShippingAddressIndex extends MainState {}

class ChangePaymentMethodIndex extends MainState {}

// getCheckout ---------------------------- start
class GetCheckoutLoading extends MainState {}

class GetCheckoutSuccess extends MainState {}

// getCheckout ---------------------------- end

// GetOrderDetails ---------------------------- start
class GetOrderDetailsLoading extends MainState {}

class GetOrderDetailsSuccess extends MainState {}

// GetOrderDetails ---------------------------- end

// select profile image

class SelectProfileImage extends MainState {}

class ClearProfileImage extends MainState {}

// ReadNotification ---------------------------- start
class ReadNotificationLoading extends MainState {}

class ReadNotificationSuccess extends MainState {}

class ChangeExpansionTile extends MainState {}

// ReadNotification ---------------------------- end

// ChangePassword ---------------------------- start
class ChangePasswordLoading extends MainState {}

class ChangePasswordSuccess extends MainState {
  final String message;

  ChangePasswordSuccess(this.message);
}

// ChangePassword ---------------------------- end

// createCheckout ---------------------------- start
class CreateCheckoutLoading extends MainState {}

class CreateCheckoutSuccess extends MainState {}

// createCheckout ---------------------------- end
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

class LoginLoading extends MainState {}

class LoginSuccess extends MainState {
  LoginModel loginModel;

  LoginSuccess({required this.loginModel});
}

class LogoutLoading extends MainState {}

class LogoutSuccess extends MainState {}
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

  @override
  List<Object> get props =>
      [
        value,
      ];
}

class TopBorrowLoading extends MainState {}

class TopBorrowSuccess extends MainState {}

class BookDetailsLoading extends MainState {}

class BookDetailsSuccess extends MainState {}

class CategoriesLoading extends MainState {}

class CategoriesSuccess extends MainState {}

class CategoryLoading extends MainState {}

class CategorySuccess extends MainState {}

class NotificationLoading extends MainState {}

class NotificationSuccess extends MainState {}