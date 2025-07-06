part of '../home_screen.dart';

const String _pressText = 'Press on the button to open a link :)';
const String _openLinkText = 'open link';

class _BodyContent extends StatelessWidget {
  const _BodyContent({
    required this.onOpenLinkPressed,
    super.key,
  });

  final VoidCallback onOpenLinkPressed;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = TextTheme.of(context);

    return Center(
      child: Column(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _pressText,
            style: textTheme.bodyLarge,
          ),
          Icon(
            Icons.arrow_downward,
            size: 120,
            color: colorScheme.primaryFixedDim,
          ),
          ElevatedButton(
            onPressed: onOpenLinkPressed,
            child: Text(
              _openLinkText,
            ),
          )
        ],
      ),
    );
  }
}
