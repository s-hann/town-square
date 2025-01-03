import 'package:activity_repository/activity_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';
import 'package:town_square/core/route/app_router.dart';
import 'package:town_square/core/theme/typography.dart';
import 'package:town_square/features/app/bloc/app_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => const ActivityRepository(),
      child: BlocProvider(
        create: (_) => AppBloc(),
        child: const _AppView(),
      ),
    );
  }
}

class _AppView extends StatelessWidget {
  const _AppView();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF35BAF8),
        ),
        textTheme: screenWidth > 1000
            ? AppTypography.appTypographyDesktop(context)
            : AppTypography.appTypographyMobile(context),
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
        ),
      ),
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        scrollbars: false,
      ),
      builder: (_, child) {
        return ToastificationWrapper(child: child!);
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
