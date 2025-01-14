import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../components/widgets/centered_circular_progress_indicator_widget.dart';
import '../../extensions/build_context_extensions.dart';
import '../cache/image_cache_manager.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PackageInfo>(
      future: PackageInfo.fromPlatform(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CenteredCircularProgressIndicatorWidget();
        }
        final fChanWords = context.fChanWords();
        return ListView(
          children: [
            _settingsSection(
              fChanWords.settingsCategoryStorage,
            ),
            _settingsClickableItem(
              fChanWords.settingsItemClearImageCache,
              Icon(Icons.image_not_supported_outlined),
              () => ImageCacheManager().emptyCache(),
            ),
            _settingsSection(
              fChanWords.settingsCategoryInfo,
            ),
            _settingsClickableItem(
              fChanWords.settingItemBugReport,
              Icon(Icons.bug_report),
              () => launch('https://github.com/fartem/fchan/issues'),
            ),
            _settingsInfoItem(
              fChanWords.settingItemAuthor,
              'fartem',
              Icon(Icons.person),
              () => launch('https://github.com/fartem'),
            ),
            _settingsInfoItem(
              fChanWords.settingItemVersion,
              snapshot.data.version,
              Icon(Icons.info_outline),
              null,
            ),
          ],
        );
      },
    );
  }

  Widget _settingsSection(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 15,
        ),
      ),
    );
  }

  Widget _settingsClickableItem(
    String title,
    Icon leading,
    Function onTap,
  ) {
    return ListTile(
      title: Text(title),
      leading: leading,
      onTap: onTap,
    );
  }

  Widget _settingsInfoItem(
    String title,
    String subtitle,
    Icon leading,
    Function onTap,
  ) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      leading: leading,
      onTap: onTap,
    );
  }
}
