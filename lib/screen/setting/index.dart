import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/components/com_bottom_navigation_bar.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/storage/index.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ScreenSetting extends StatelessWidget {
  const ScreenSetting({super.key});

  static const double rowHeight = 40;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: PackageInfo.fromPlatform(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            final data = snapshot.data!;
            return Scaffold(
              appBar: AppBar(
                title: Text(AppLocalizations.of(context)!.setting_setting),
              ),
              body: Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: rowHeight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(AppLocalizations.of(context)!.setting_language),
                          PopupMenuButton(
                            icon: const Icon(Icons.language),
                            tooltip: AppLocalizations.of(context)!
                                .setting_language_tooltip,
                            onSelected: (languageCode) {
                              final locale = Locale(languageCode);
                              context.read<AppState>().setLocale(locale);
                              Storage.setLocale(locale);
                            },
                            itemBuilder: (BuildContext content) => [
                              ('English', 'en'),
                              ('简体中文', 'zh'),
                            ]
                                .map(
                                  (item) => PopupMenuItem(
                                    value: item.$2,
                                    child: Text(item.$1),
                                  ),
                                )
                                .toList(),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: rowHeight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(AppLocalizations.of(context)!.setting_theme),
                          PopupMenuButton(
                            icon: const Icon(Icons.palette_outlined),
                            tooltip: AppLocalizations.of(context)!
                                .setting_theme_tooltip,
                            onSelected: (color) {
                              context.read<AppState>().setColor(color);
                              Storage.setThemeColor(color);
                            },
                            itemBuilder: (BuildContext context) => [
                              ('Blue', Colors.blue),
                              ('Green', Colors.green),
                              ('Pink', Colors.pink),
                              ('Purple', Colors.purple),
                            ]
                                .map(
                                  (item) => PopupMenuItem(
                                    value: item.$2,
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.palette_outlined,
                                          color: item.$2,
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 4.0),
                                          child: Text(
                                            item.$1,
                                            style: TextStyle(
                                              color: item.$2,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                                .toList(),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: rowHeight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) => AboutDialog(
                                applicationName: data.appName,
                                applicationVersion: data.version,
                              ),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Text(AppLocalizations.of(context)!.setting_about)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              bottomNavigationBar: const ComBottomNavigationBar(
                currentIndex: 1,
              ),
            );
          }
          return const Center();
        });
  }
}
