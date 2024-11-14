import '../../app_exporter.dart';
import 'components/upload_link_btn.dart';
import 'components/link_loader.dart';
import 'data/providers.dart';
import 'link_disposer.dart';
import 'link_text.dart';

class LinkBody extends ConsumerWidget {
  const LinkBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final linkStream = ref.watch(linkStreamProvider);

    return LinkDisposer(
      child: linkStream.when(
        loading: LinkLoader.new,
        error: (error, stackTrace) => ErrorDisplay(
          error: error,
          stackTrace: stackTrace,
        ),
        data: (_) {
          final links = ref.watch(linksListProvider);

          return CustomScrollView(
            slivers: [
              const SliverSpacing(of: spacing16),
              if (links.isEmpty)
                SliverFillRemaining(
                  child: EmptyList(
                    actionButton: UploadLinkButton(),
                    emptyPage: EmptyPage(
                      title: 'Store Your Links Safely',
                      description:
                          "You don't have any links stored yet. Store your links here and access them from anywhere.",
                    ),
                  ),
                )
              else
                SliverFillRemaining(
                  child: ExpandedScrollingColumn(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BoldTitleWithDescription(
                        boldTitle: BoldTitle(
                          title: "Here is Your First Link",
                          fontSize: 30,
                        ),
                        description:
                            "You can now access your links from anywhere.",
                        descFontSize: 20,
                        textAlign: TextAlign.center,
                      ),

                      Spacing(of: spacing32),

                      /// blue link text
                      const LinkText(),
                    ],
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
