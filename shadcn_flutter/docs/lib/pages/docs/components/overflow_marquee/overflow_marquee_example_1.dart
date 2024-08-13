import 'package:shadcn_flutter/shadcn_flutter.dart';

class OverflowMarqueeExample1 extends StatelessWidget {
  const OverflowMarqueeExample1({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: OverflowMarquee(
        child: Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        ),
      ),
    );
  }
}
