import 'package:flutter/material.dart';
import 'package:flutter_app_environment/flutter_app_environment.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template_riverpod/common/env/environment_config.dart';
import 'package:flutter_template_riverpod/common/routes_factory.dart';
import 'package:flutter_template_riverpod/common/ui/themes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  DebugOptions get _debugOptions =>
      Environment<EnvironmentConfig>.instance().debugOptions;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
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
        title: Environment<EnvironmentConfig>.instance().config.title,
        theme: lightTheme,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: child!,
        ),
      ),
    );
  }
}
