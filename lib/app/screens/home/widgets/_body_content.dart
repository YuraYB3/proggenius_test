part of '../home_screen.dart';

const String _pressText = 'Press on the button to open a link:';
const String _openLinkText = 'open link';

class _BodyContent extends StatelessWidget {
  const _BodyContent({
    required this.onOpenLinkPressed,
    super.key,
  });

  final VoidCallback onOpenLinkPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(_pressText),
          ElevatedButton(
            onPressed: onOpenLinkPressed,
            child: Text(_openLinkText),
          )
        ],
      ),
    );
  }
}
