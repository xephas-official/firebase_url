import '../../app_exporter.dart';
import 'data/providers.dart';

class LinkText extends ConsumerWidget {
  const LinkText({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final link = ref.watch(appLinkProvider);

    return Padding(
      padding: padding16,
      child: Column(
        children: [
          Text(
            link.url,
            textAlign: TextAlign.center,
            style: mediumBoldTextStyle.copyWith(
              color: appBlue,
              fontSize: 16,
              decoration: TextDecoration.underline,
              decorationColor: appBlue,
            ),
          ),

          // added on
          Spacing(of: spacing16),

          ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(
                color: appBlack,
                width: 1,
              ),
            ),
            title: Text(
              'Uploaded on: ${link.createdAt.toDate()}',
              style: mediumBoldTextStyle.copyWith(
                color: appBlack,
                fontSize: 12,
              ),
            ),
            subtitle: Text(
              'ID: ${link.id}',
              style: mediumBoldTextStyle.copyWith(
                color: appBlack,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
