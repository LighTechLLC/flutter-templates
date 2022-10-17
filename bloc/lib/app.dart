import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template_bloc/common/env/config.dart';
import 'package:template_bloc/common/env/debug_options.dart';
import 'package:template_bloc/common/env/environment.dart';
import 'package:template_bloc/common/routes_factory.dart';
import 'package:template_bloc/common/ui/themes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  DebugOptions get _debug => Environment<Config>.instance().config.debugOptions;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        showPerformanceOverlay: _debug.showPerformanceOverlay,
        debugShowMaterialGrid: _debug.debugShowMaterialGrid,
        checkerboardRasterCacheImages: _debug.checkerboardRasterCacheImages,
        checkerboardOffscreenLayers: _debug.checkerboardOffscreenLayers,
        showSemanticsDebugger: _debug.showSemanticsDebugger,
        debugShowCheckedModeBanner: _debug.debugShowCheckedModeBanner,
        initialRoute: RoutesFactory.initialRoute,
        onGenerateRoute: RoutesFactory().getGeneratedRoutes,
        title: 'Template Bloc',
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
