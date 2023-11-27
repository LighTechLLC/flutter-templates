import 'package:flutter/material.dart';
import 'package:flutter_app_environment/flutter_app_environment.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template_riverpod/common/env/environment_config.dart';
import 'package:flutter_template_riverpod/common/logger/logger.dart';
import 'package:flutter_template_riverpod/common/routes_factory.dart';
import 'package:flutter_template_riverpod/common/ui/themes.dart';

class App extends StatelessWidget {
  const App({super.key});

  DebugOptions get _debugOptions =>
      Environment<EnvironmentConfig>.instance().debugOptions;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      useInheritedMediaQuery: true,
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        showPerformanceOverlay: _debugOptions.showPerformanceOverlay,
        debugShowMaterialGrid: _debugOptions.debugShowMaterialGrid,
        checkerboardRasterCacheImages:
            _debugOptions.checkerboardRasterCacheImages,
        checkerboardOffscreenLayers: _debugOptions.checkerboardOffscreenLayers,
        showSemanticsDebugger: _debugOptions.showSemanticsDebugger,
        debugShowCheckedModeBanner: _debugOptions.debugShowCheckedModeBanner,
        initialRoute: RoutesFactory.initialRoute,
        onGenerateRoute: RoutesFactory().getGeneratedRoutes,
        title: 'Template Bloc',
        theme: lightTheme,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.noScaling,
          ),
          child: ProviderScope(
            observers: [Logger()],
            child: child!,
          ),
        ),
      ),
    );
  }
}
