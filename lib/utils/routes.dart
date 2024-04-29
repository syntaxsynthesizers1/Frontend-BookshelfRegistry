import 'package:book_stack/screens/authentication/sign_in/sign_up_screen.dart';
import 'package:book_stack/screens/authentication/sign_up/sign_in_screen.dart';
import 'package:book_stack/screens/dashboard/bottom_navigation_screen.dart';
import 'package:book_stack/screens/more/profile_screen.dart';
import 'package:book_stack/screens/more/referral_screen.dart';
import 'package:book_stack/screens/more/security_screen.dart';
import 'package:book_stack/screens/more/wallet_screen.dart';
import 'package:book_stack/screens/onboarding/onboading_page_view.dart';

var appRoutes = {
  OnboardingPageViewScreen.routeName: (context) =>
      const OnboardingPageViewScreen(),
  ProfileScreen.routeName: (context) => const ProfileScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  BottomNavigationScreen.routeName: (context) => const BottomNavigationScreen(),
  WalletScreen.routeName: (context) => const WalletScreen(),
  ReferralScreen.routeName: (context) => const ReferralScreen(),
  SecurityScreen.routeName: (context) => const SecurityScreen(),
};
