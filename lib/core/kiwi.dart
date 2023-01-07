import 'package:kiwi/kiwi.dart';
import 'package:thimar/screens/balance/bloc/bloc.dart';
import 'package:thimar/screens/my_wallet/all_transaction/bloc/bloc.dart';

import '../edit_pass/bloc/bloc.dart';
import '../screens/account_activation/bloc/bloc.dart';
import '../screens/auth/code_activation/bloc/bloc.dart';
import '../screens/auth/forget_password/bloc/bloc.dart';
import '../screens/auth/login/bloc/bloc.dart';
import '../screens/auth/new_password/bloc/bloc.dart';
import '../screens/auth/register/bloc/bloc.dart';
import '../screens/home/pages/feeds/bloc/bloc.dart';
import '../screens/home/pages/my_account/bloc/bloc.dart';
import '../screens/home/pages/my_notification/bloc/bloc.dart';
import '../screens/home/pages/my_order/bloc/bloc.dart';
import '../screens/my_cart/bloc/bloc.dart';
import '../screens/my_personal_data/bloc/bloc.dart';
import '../screens/my_wallet/bloc/bloc.dart';
import '../screens/product_details/bloc.dart';
import '../search/bloc/bloc.dart';


Future<void> initKiwi() async{
  KiwiContainer container = KiwiContainer();
  container.registerFactory((container) => LoginBloc());
  container.registerFactory((container) => RegisterBloc());
  container.registerFactory((container) => VerificationBloc());
  container.registerFactory((container) => ForgetPasswordBloc());
  container.registerFactory((container) => ConfirmForgetPassCodeBloc());
  container.registerFactory((container) => NewPasswordBloc());
  container.registerFactory((container) => EditPasswordBloc());
  // container.registerFactory((container) => ThimarBloc());
  container.registerFactory((container) => FeedsBloc());
   container.registerFactory((container) => OrderBloc());
   container.registerFactory((container) => MyAccountBloc());
   container.registerFactory((container) => NotificationBloc());
  container.registerFactory((container) => WalletBloc());
  container.registerFactory((container) => BalanceBloc());
  container.registerFactory((container) => AllTransactionBloc());
  container.registerFactory((container) => SearchBloc());
  container.registerFactory((container) => CartBloc());
  container.registerFactory((container) => ProductDetailsBloc());
   container.registerFactory((container) => ProfileBloc());
}