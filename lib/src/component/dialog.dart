import 'package:shadcn_flutter/shadcn_flutter.dart';

class Dialog extends StatefulWidget {
  final Widget? leading;
  final Widget? trailing;
  final Widget? title;
  final Widget? content;
  final List<Widget>? actions;
  final double? surfaceBlur;
  final double? surfaceOpacity;
  final Color? barrierColor;
  final EdgeInsetsGeometry? padding;

  const Dialog({
    super.key,
    this.leading,
    this.title,
    this.content,
    this.actions,
    this.trailing,
    this.surfaceBlur,
    this.surfaceOpacity,
    this.barrierColor,
    this.padding,
  });

  @override
  State<Dialog> createState() => _DialogState();
}

class _DialogState extends State<Dialog> {
  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    var scaling = themeData.scaling;
    return ModalBackdrop(
      borderRadius: themeData.radiuses.r6Circular,
      barrierColor: widget.barrierColor ?? Colors.black.withValues(alpha: 0.8),
      surfaceClip: ModalBackdrop.shouldClipSurface(widget.surfaceOpacity ?? themeData.surfaceOpacity),
      child: ModalContainer(
        fillColor: themeData.colorScheme.popover,
        filled: true,
        borderRadius: themeData.radiuses.r6Circular,
        borderWidth: 1 * scaling,
        borderColor: themeData.colorScheme.muted,
        padding: widget.padding ?? EdgeInsets.all(24 * scaling),
        surfaceBlur: widget.surfaceBlur ?? themeData.surfaceBlur,
        surfaceOpacity: widget.surfaceOpacity ?? themeData.surfaceOpacity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Flexible(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (widget.leading != null) widget.leading!.icon8().iconMutedForeground(),
                  if (widget.title != null || widget.content != null)
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (widget.title != null) widget.title!.text4().textW6(),
                          if (widget.content != null) widget.content!.text2().textMuted(),
                        ],
                      ).gap(8 * scaling),
                    ),
                  if (widget.trailing != null) widget.trailing!.icon8().iconMutedForeground(),
                ],
              ).gap(16 * scaling),
            ),
            if (widget.actions != null && widget.actions!.isNotEmpty)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                // children: widget.actions!,
                children: join(widget.actions!, SizedBox(width: 8 * scaling)).toList(),
              ),
          ],
        ).gap(16 * scaling),
      ),
    );
  }
}
