import 'package:book_stack/constants/custom_colors.dart';
import 'package:book_stack/globals.dart';
import 'package:book_stack/locator.dart';
import 'package:book_stack/models/old_book_model.dart';
import 'package:book_stack/screens/authentication/sign_in/sign_up_screen.dart';
import 'package:book_stack/screens/authentication/sign_up/sign_in_screen.dart';
import 'package:book_stack/screens/dashboard/book_details_screen.dart';
import 'package:book_stack/screens/dashboard/bottom_navigation_screen.dart';
import 'package:book_stack/screens/dashboard/reading_screen.dart';
import 'package:book_stack/screens/onboarding/onboading_page_view.dart';
import 'package:book_stack/utils/environment_config.dart';
import 'package:book_stack/utils/navigator_handler.dart';
import 'package:book_stack/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadEnvFile(path: ".env");
  await dotenv.load(fileName: ".env");
  await setupLocator();
  Global.environmentVariables = EnvironmentVariables(
    apiBaseUrl: dotenv.env['BASE_URL']!,
    clientKey: dotenv.env['CLIENT_KEY'] ?? "654321",
    versionName: dotenv.env['VERSION_NAME']!,
    agent: dotenv.env['AGENT_ID'] ?? "flutter_mobile",
    apiTimeoutInSeconds: int.parse(dotenv.env['API_TIMEOUT_IN_SECONDS']!),
    tokenValidityInMinutes: int.parse(dotenv.env['TOKEN_VALIDITY_IN_MINUTES']!),
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    List<OldBookModel> books = initializeBookModels();
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        navigatorKey: locator<NavigationHandler>().navigatorKey,
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: 'Mulish',
          // colorScheme: ColorScheme.fromSeed(seedColor: CustomColors.whiteColor)
          //     .copyWith(background: CustomColors.whiteColor),
        ),
        home:
            // const SignUpScreen(),

            const OnboardingPageViewScreen(),

        // const ReadingScreen(),

        // const BottomNavigationScreen(),
        routes: appRoutes,
      ),
    );
  }
}
