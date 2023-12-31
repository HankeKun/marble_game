import 'package:flutter/material.dart';
import 'package:marble_game/constants/color_value.dart';
import 'package:marble_game/generated/l10n.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: ColorValue.background,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: ColorValue.lightText,
        ),
        title: Text(
          lang.about,
          style: TextStyle(color: ColorValue.lightText),
          maxLines: 1,
          overflow: TextOverflow.fade,
        ),
        centerTitle: true,
        backgroundColor: ColorValue.appBar,
        scrolledUnderElevation: 0.0,
      ),
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      lang.developer,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: theme.primaryColor),
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      "${lang.development}: ${lang.severin}",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: theme.primaryColor),
                    ),
                    Text(
                      "${lang.design}: ${lang.edonisa}",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: theme.primaryColor),
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      lang.description,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: theme.primaryColor),
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      lang.descriptionText,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: theme.primaryColor),
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      lang.music,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: theme.primaryColor),
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      "${lang.backgroundMusic}: ${lang.backgroundMusicTitle}",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: theme.primaryColor),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
