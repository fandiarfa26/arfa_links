import 'dart:js' as js;

import 'package:arfa_links/src/assets/assets.gen.dart';
import 'package:arfa_links/src/presentation/controllers/dark_mode_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final width = MediaQuery.of(context).size.width;
    double maxWidth = width > 768 ? 768 : width;

    final isDarkMode = ref.watch(darkModeProvider);

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(LineIcons.link),
        title: const Text('ArfaLinks'),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(darkModeProvider.notifier).state = !isDarkMode;
            },
            icon: Icon(isDarkMode ? LineIcons.sun : LineIcons.moon),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: SizedBox(
              width: maxWidth,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: colorScheme.primary),
                    width: maxWidth,
                    child: Column(
                      children: [
                        const SizedBox(height: 36),
                        Builder(builder: (context) {
                          double width = 150.0;
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(0.5 * width),
                            child: Assets.images.me.image(
                              width: width,
                              fit: BoxFit.fitWidth,
                            ),
                          );
                        }),
                        const SizedBox(height: 24),
                        Text(
                          'M. Fandi Arfabuma',
                          style: textTheme.headlineSmall?.copyWith(color: colorScheme.onPrimary),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Software Engineer\nFront-end Development Enthusiast\nFocus in Flutter & Dart',
                          style: textTheme.titleMedium?.copyWith(color: colorScheme.onPrimary),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 36),
                  Card(
                    child: ListTile(
                      leading: const Icon(LineIcons.linkedinIn),
                      title: const Text('LinkedIn'),
                      subtitle: const Text('/arfabuma'),
                      trailing: const Icon(LineIcons.chevronRight),
                      onTap: () {
                        js.context.callMethod('open', ['https://www.linkedin.com/in/arfabuma/']);
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  Card(
                    child: ListTile(
                      leading: const Icon(LineIcons.github),
                      title: const Text('Github'),
                      subtitle: const Text('@fandiarfa26'),
                      trailing: const Icon(LineIcons.chevronRight),
                      onTap: () {
                        js.context.callMethod('open', ['https://github.com/fandiarfa26']);
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  Card(
                    child: ListTile(
                      leading: const Icon(LineIcons.instagram),
                      title: const Text('Instagram'),
                      subtitle: const Text('@fandiarfa'),
                      trailing: const Icon(LineIcons.chevronRight),
                      onTap: () {
                        js.context.callMethod('open', ['https://www.instagram.com/fandiarfa/']);
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  Card(
                    child: ListTile(
                      leading: const Icon(LineIcons.audioFileAlt),
                      title: const Text('Tiktok'),
                      subtitle: const Text('@arfa_dev'),
                      trailing: const Icon(LineIcons.chevronRight),
                      onTap: () {
                        js.context.callMethod('open', ['https://www.tiktok.com/@arfa_dev']);
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  Card(
                    child: ListTile(
                      leading: const Icon(LineIcons.globe),
                      title: const Text('Personal Web'),
                      subtitle: const Text('fandiarfa26.vercel.app'),
                      trailing: const Icon(LineIcons.chevronRight),
                      onTap: () {
                        js.context.callMethod('open', ['https://fandiarfa26.vercel.app/']);
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  Card(
                    child: ListTile(
                      leading: const Icon(LineIcons.googlePlay),
                      title: const Text('Play Store'),
                      subtitle: const Text('not available'),
                      trailing: const Icon(LineIcons.chevronRight),
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(height: 8),
                  Card(
                    child: ListTile(
                      leading: const Icon(LineIcons.iosAppStore),
                      title: const Text('App Store'),
                      subtitle: const Text('not available'),
                      trailing: const Icon(LineIcons.chevronRight),
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(height: 36),
                  Text(
                    'Build with Flutter\n2023',
                    style: textTheme.labelLarge,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
