import 'package:flutter/services.dart';
import 'package:shadcn_flutter/src/components/focus_outline.dart';

import '../../shadcn_flutter.dart';

class Toggle extends StatefulWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final Widget child;
  final EdgeInsets padding;

  const Toggle({
    Key? key,
    required this.value,
    this.onChanged,
    required this.child,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  }) : super(key: key);

  @override
  _ToggleState createState() => _ToggleState();
}

// toggle button is just ghost button
class _ToggleState extends State<Toggle> {
  bool _hovering = false;
  bool _focusing = false;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return FocusOutline(
      focused: _focusing,
      borderRadius: BorderRadius.circular(themeData.radiusMd),
      child: GestureDetector(
        onTap: () {
          widget.onChanged?.call(!widget.value);
        },
        child: FocusableActionDetector(
          enabled: widget.onChanged != null,
          mouseCursor: widget.onChanged != null
              ? SystemMouseCursors.click
              : SystemMouseCursors.basic,
          onShowFocusHighlight: (value) {
            setState(() {
              _focusing = value;
            });
          },
          onShowHoverHighlight: (value) {
            setState(() {
              _hovering = value;
            });
          },
          actions: {
            ActivateIntent: CallbackAction(
              onInvoke: (Intent intent) {
                widget.onChanged?.call(!widget.value);
                return true;
              },
            ),
          },
          shortcuts: const {
            SingleActivator(LogicalKeyboardKey.enter): ActivateIntent(),
            SingleActivator(LogicalKeyboardKey.space): ActivateIntent(),
          },
          child: AnimatedContainer(
            duration: kDefaultDuration,
            decoration: BoxDecoration(
              color: _hovering || widget.value
                  ? themeData.colorScheme.muted
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(themeData.radiusMd),
            ),
            padding: widget.padding,
            child: mergeAnimatedTextStyle(
              duration: kDefaultDuration,
              style: TextStyle(
                color: _hovering && !widget.value
                    ? themeData.colorScheme.mutedForeground
                    : themeData.colorScheme.foreground,
              ),
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}

enum ButtonShape {
  rectangle,
  circle,
}

abstract class Button extends StatefulWidget {
  static const EdgeInsets normalPadding = EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 8,
  );
  static const EdgeInsets iconPadding = EdgeInsets.all(8);
  static const EdgeInsets badgePadding = EdgeInsets.symmetric(
    horizontal: 10,
    vertical: 2,
  );
  static const TextStyle normalTextStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle badgeTextStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
  final Widget? leading;
  final Widget? trailing;
  final Widget child;
  final VoidCallback? onPressed;
  final MouseCursor mouseCursor;
  final FocusNode? focusNode;
  final bool focusable;
  final EdgeInsets padding;
  final AlignmentGeometry? alignment;
  final double? focusAlign;
  final double? focusRadius;
  final double? focusWidth;
  final TextStyle? textStyle;
  const Button({
    Key? key,
    this.leading,
    this.trailing,
    required this.child,
    this.onPressed,
    this.mouseCursor = SystemMouseCursors.click,
    this.focusNode,
    this.focusable = true,
    this.padding = normalPadding,
    this.alignment,
    this.focusAlign,
    this.focusRadius,
    this.focusWidth,
    this.textStyle = normalTextStyle,
  }) : super(key: key);

  @override
  ButtonState createState();
}

abstract class ButtonState<T extends Button> extends State<T> {
  // bool isHovering = false;
  // bool isFocusing = false;
  bool _hovering = false;
  bool _focusing = false;

  bool get isHovering => _hovering;
  bool get isFocusing => _focusing;

  late FocusNode _focusNode;

  FocusNode get focusNode => _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
  }

  @override
  void didUpdateWidget(covariant T oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.focusNode != oldWidget.focusNode) {
      oldWidget.focusNode?.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return mergeAnimatedTextStyle(
      duration: kDefaultDuration,
      style: widget.textStyle,
      child: GestureDetector(
        onTap: () {
          widget.onPressed?.call();
        },
        child: FocusableActionDetector(
          focusNode: focusNode,
          enabled: widget.onPressed != null,
          mouseCursor: widget.onPressed != null
              ? widget.mouseCursor
              : SystemMouseCursors.basic,
          shortcuts: const {
            SingleActivator(LogicalKeyboardKey.enter): ActivateIntent(),
            SingleActivator(LogicalKeyboardKey.space): ActivateIntent(),
          },
          actions: {
            ActivateIntent: CallbackAction(
              onInvoke: (Intent intent) {
                widget.onPressed?.call();
                return true;
              },
            ),
          },
          onShowFocusHighlight: (value) {
            setState(() {
              _focusing = value;
            });
          },
          onShowHoverHighlight: (value) {
            setState(() {
              _hovering = value;
            });
          },
          child: FocusOutline(
            focused: isFocusing,
            borderRadius: BorderRadius.circular(Theme.of(context).radiusMd),
            align: widget.focusAlign ?? 0,
            width: widget.focusWidth ?? 1,
            radius: widget.focusRadius,
            child: buildButton(context),
          ),
        ),
      ),
    );
  }

  EdgeInsets get padding {
    return widget.padding;
  }

  Widget buildButton(BuildContext context);

  bool get isDisabled => widget.onPressed == null;

  Widget buildContent(BuildContext context, {bool underline = false}) {
    Widget row = IntrinsicWidth(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.leading != null) widget.leading!,
          if (widget.leading != null) const SizedBox(width: 8),
          Expanded(child: underline ? widget.child.underline() : widget.child),
          if (widget.trailing != null) const SizedBox(width: 8),
          if (widget.trailing != null) widget.trailing!,
        ],
      ),
    );
    if (widget.alignment != null) {
      row = Align(
        alignment: widget.alignment!,
        child: row,
      );
    }
    return row;
  }
}

class PrimaryButton extends Button {
  final ButtonShape shape;
  const PrimaryButton({
    Key? key,
    Widget? leading,
    Widget? trailing,
    required Widget child,
    VoidCallback? onPressed,
    MouseCursor mouseCursor = SystemMouseCursors.click,
    FocusNode? focusNode,
    bool focusable = true,
    EdgeInsets padding = Button.normalPadding,
    AlignmentGeometry? alignment,
    TextStyle textStyle = Button.normalTextStyle,
    this.shape = ButtonShape.rectangle,
  }) : super(
          key: key,
          leading: leading,
          trailing: trailing,
          child: child,
          onPressed: onPressed,
          mouseCursor: mouseCursor,
          focusNode: focusNode,
          focusable: focusable,
          padding: padding,
          alignment: alignment,
          textStyle: textStyle,
        );

  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends ButtonState<PrimaryButton> {
  @override
  Widget buildButton(BuildContext context) {
    var themeData = Theme.of(context);
    return AnimatedContainer(
      duration: kDefaultDuration,
      decoration: widget.shape == ButtonShape.rectangle
          ? BoxDecoration(
              color: isDisabled
                  ? themeData.colorScheme.mutedForeground
                  : isHovering
                      ? themeData.colorScheme.primary.withOpacity(0.8)
                      : themeData.colorScheme.primary,
              borderRadius: BorderRadius.circular(themeData.radiusMd),
              border: Border.all(
                color: isDisabled
                    ? themeData.colorScheme.mutedForeground
                    : isHovering
                        ? themeData.colorScheme.primary.withOpacity(0.8)
                        : themeData.colorScheme.primary,
                width: 1,
              ),
            )
          : BoxDecoration(
              color: isDisabled
                  ? themeData.colorScheme.mutedForeground
                  : isHovering
                      ? themeData.colorScheme.primary.withOpacity(0.8)
                      : themeData.colorScheme.primary,
              shape: BoxShape.circle,
              border: Border.all(
                color: isDisabled
                    ? themeData.colorScheme.mutedForeground
                    : isHovering
                        ? themeData.colorScheme.primary.withOpacity(0.8)
                        : themeData.colorScheme.primary,
                width: 1,
              ),
            ),
      padding: padding,
      child: mergeAnimatedTextStyle(
        duration: kDefaultDuration,
        style: TextStyle(
          color: themeData.colorScheme.primaryForeground,
        ),
        child: AnimatedIconTheme.merge(
          duration: kDefaultDuration,
          data: IconThemeData(
            color: themeData.colorScheme.primaryForeground,
          ),
          child: buildContent(context),
        ),
      ),
    );
  }
}

class SecondaryButton extends Button {
  final ButtonShape shape;
  const SecondaryButton({
    Key? key,
    Widget? leading,
    Widget? trailing,
    required Widget child,
    VoidCallback? onPressed,
    MouseCursor mouseCursor = SystemMouseCursors.click,
    FocusNode? focusNode,
    bool focusable = true,
    EdgeInsets padding = Button.normalPadding,
    AlignmentGeometry? alignment,
    TextStyle textStyle = Button.normalTextStyle,
    this.shape = ButtonShape.rectangle,
  }) : super(
          key: key,
          leading: leading,
          trailing: trailing,
          child: child,
          onPressed: onPressed,
          mouseCursor: mouseCursor,
          focusNode: focusNode,
          focusable: focusable,
          padding: padding,
          alignment: alignment,
          textStyle: textStyle,
        );

  @override
  _SecondaryButtonState createState() => _SecondaryButtonState();
}

class _SecondaryButtonState extends ButtonState<SecondaryButton> {
  @override
  Widget buildButton(BuildContext context) {
    var themeData = Theme.of(context);
    return AnimatedContainer(
      duration: kDefaultDuration,
      decoration: widget.shape == ButtonShape.rectangle
          ? BoxDecoration(
              color: isDisabled
                  ? themeData.colorScheme.primaryForeground
                  : isHovering
                      ? themeData.colorScheme.secondary.withOpacity(0.8)
                      : themeData.colorScheme.secondary,
              borderRadius: BorderRadius.circular(themeData.radiusMd),
            )
          : BoxDecoration(
              color: isDisabled
                  ? themeData.colorScheme.primaryForeground
                  : isHovering
                      ? themeData.colorScheme.secondary.withOpacity(0.8)
                      : themeData.colorScheme.secondary,
              shape: BoxShape.circle,
            ),
      padding: padding,
      child: mergeAnimatedTextStyle(
        duration: kDefaultDuration,
        style: TextStyle(
          color: isDisabled
              ? themeData.colorScheme.mutedForeground
              : themeData.colorScheme.secondaryForeground,
        ),
        child: AnimatedIconTheme.merge(
          duration: kDefaultDuration,
          data: IconThemeData(
            color: isDisabled
                ? themeData.colorScheme.mutedForeground
                : themeData.colorScheme.secondaryForeground,
          ),
          child: buildContent(context),
        ),
      ),
    );
  }
}

class OutlineButton extends Button {
  final ButtonShape shape;
  const OutlineButton({
    Key? key,
    Widget? leading,
    Widget? trailing,
    required Widget child,
    VoidCallback? onPressed,
    MouseCursor mouseCursor = SystemMouseCursors.click,
    FocusNode? focusNode,
    bool focusable = true,
    EdgeInsets padding = Button.normalPadding,
    AlignmentGeometry? alignment,
    TextStyle textStyle = Button.normalTextStyle,
    this.shape = ButtonShape.rectangle,
  }) : super(
          key: key,
          leading: leading,
          trailing: trailing,
          child: child,
          onPressed: onPressed,
          mouseCursor: mouseCursor,
          focusNode: focusNode,
          focusable: focusable,
          padding: padding,
          alignment: alignment,
          textStyle: textStyle,
        );

  @override
  _OutlineButtonState createState() => _OutlineButtonState();
}

class _OutlineButtonState extends ButtonState<OutlineButton> {
  @override
  Widget buildButton(BuildContext context) {
    var themeData = Theme.of(context);
    return AnimatedContainer(
      duration: kDefaultDuration,
      decoration: widget.shape == ButtonShape.rectangle
          ? BoxDecoration(
              color: isDisabled
                  ? Colors.transparent
                  : isHovering
                      ? themeData.colorScheme.muted.withOpacity(0.8)
                      : Colors.transparent,
              border: Border.all(
                color: isDisabled
                    ? themeData.colorScheme.muted
                    : isHovering
                        ? themeData.colorScheme.muted.withOpacity(0.8)
                        : themeData.colorScheme.muted,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(themeData.radiusMd),
            )
          : BoxDecoration(
              color: isDisabled
                  ? Colors.transparent
                  : isHovering
                      ? themeData.colorScheme.muted.withOpacity(0.8)
                      : Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(
                color: isDisabled
                    ? themeData.colorScheme.muted
                    : isHovering
                        ? themeData.colorScheme.muted.withOpacity(0.8)
                        : themeData.colorScheme.muted,
                width: 1,
              ),
            ),
      padding: padding,
      child: mergeAnimatedTextStyle(
        duration: kDefaultDuration,
        style: TextStyle(
          color: isDisabled
              ? themeData.colorScheme.mutedForeground
              : themeData.colorScheme.foreground,
        ),
        child: AnimatedIconTheme.merge(
          duration: kDefaultDuration,
          data: IconThemeData(
            color: isDisabled
                ? themeData.colorScheme.mutedForeground
                : themeData.colorScheme.foreground,
          ),
          child: buildContent(context),
        ),
      ),
    );
  }
}

class GhostButton extends Button {
  final ButtonShape shape;
  const GhostButton({
    Key? key,
    Widget? leading,
    Widget? trailing,
    required Widget child,
    VoidCallback? onPressed,
    MouseCursor mouseCursor = SystemMouseCursors.click,
    FocusNode? focusNode,
    bool focusable = true,
    EdgeInsets padding = Button.normalPadding,
    AlignmentGeometry? alignment,
    TextStyle textStyle = Button.normalTextStyle,
    this.shape = ButtonShape.rectangle,
  }) : super(
          key: key,
          leading: leading,
          trailing: trailing,
          child: child,
          onPressed: onPressed,
          mouseCursor: mouseCursor,
          focusNode: focusNode,
          focusable: focusable,
          padding: padding,
          alignment: alignment,
          textStyle: textStyle,
        );

  @override
  _GhostButtonState createState() => _GhostButtonState();
}

class _GhostButtonState extends ButtonState<GhostButton> {
  @override
  Widget buildButton(BuildContext context) {
    var themeData = Theme.of(context);
    return AnimatedContainer(
      duration: kDefaultDuration,
      decoration: widget.shape == ButtonShape.rectangle
          ? BoxDecoration(
              color: isHovering && !isDisabled
                  ? themeData.colorScheme.muted.withOpacity(0.8)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(themeData.radiusMd),
            )
          : BoxDecoration(
              color: isHovering && !isDisabled
                  ? themeData.colorScheme.muted.withOpacity(0.8)
                  : Colors.transparent,
              shape: BoxShape.circle,
            ),
      padding: padding,
      child: mergeAnimatedTextStyle(
        duration: kDefaultDuration,
        style: TextStyle(
          color: isDisabled
              ? themeData.colorScheme.mutedForeground
              : themeData.colorScheme.foreground,
        ),
        child: AnimatedIconTheme.merge(
          duration: kDefaultDuration,
          data: IconThemeData(
            color: isDisabled
                ? themeData.colorScheme.mutedForeground
                : themeData.colorScheme.foreground,
          ),
          child: buildContent(context),
        ),
      ),
    );
  }
}

class LinkButton extends Button {
  const LinkButton({
    Key? key,
    Widget? leading,
    Widget? trailing,
    required Widget child,
    VoidCallback? onPressed,
    MouseCursor mouseCursor = SystemMouseCursors.click,
    FocusNode? focusNode,
    bool focusable = true,
    EdgeInsets padding = Button.normalPadding,
    AlignmentGeometry? alignment,
  }) : super(
          key: key,
          leading: leading,
          trailing: trailing,
          child: child,
          onPressed: onPressed,
          mouseCursor: mouseCursor,
          focusNode: focusNode,
          focusable: focusable,
          padding: padding,
          alignment: alignment,
        );

  @override
  _LinkButtonState createState() => _LinkButtonState();
}

class _LinkButtonState extends ButtonState {
  @override
  Widget buildButton(BuildContext context) {
    var themeData = Theme.of(context);
    return AnimatedContainer(
      duration: kDefaultDuration,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(themeData.radiusMd),
      ),
      padding: padding,
      child: mergeAnimatedTextStyle(
        duration: kDefaultDuration,
        style: TextStyle(
          color: isDisabled
              ? themeData.colorScheme.mutedForeground
              : themeData.colorScheme.foreground,
        ),
        child: AnimatedIconTheme.merge(
          duration: kDefaultDuration,
          data: IconThemeData(
            color: isDisabled
                ? themeData.colorScheme.mutedForeground
                : themeData.colorScheme.foreground,
          ),
          child: buildContent(context, underline: isHovering),
        ),
      ),
    );
  }
}

class TabButton extends Button {
  const TabButton({
    Key? key,
    Widget? leading,
    Widget? trailing,
    required Widget child,
    VoidCallback? onPressed,
    MouseCursor mouseCursor = SystemMouseCursors.click,
    FocusNode? focusNode,
    bool focusable = true,
    EdgeInsets padding = Button.normalPadding,
    AlignmentGeometry? alignment,
    TextStyle textStyle = Button.normalTextStyle,
  }) : super(
          key: key,
          leading: leading,
          trailing: trailing,
          child: child,
          onPressed: onPressed,
          mouseCursor: mouseCursor,
          focusNode: focusNode,
          focusable: focusable,
          padding: padding,
          alignment: alignment,
          focusRadius: 0,
          focusAlign: 2,
          focusWidth: 2,
          textStyle: textStyle,
        );

  @override
  _StaticButtonState createState() => _StaticButtonState();
}

class _StaticButtonState extends ButtonState {
  @override
  Widget buildButton(BuildContext context) {
    return AnimatedContainer(
      duration: kDefaultDuration,
      padding: padding,
      child: buildContent(context),
    );
  }
}

class DenseButton extends Button {
  const DenseButton({
    Key? key,
    Widget? leading,
    Widget? trailing,
    required Widget child,
    VoidCallback? onPressed,
    MouseCursor mouseCursor = SystemMouseCursors.click,
    FocusNode? focusNode,
    bool focusable = true,
    EdgeInsets padding = EdgeInsets.zero,
    AlignmentGeometry? alignment,
    TextStyle textStyle = Button.normalTextStyle,
  }) : super(
          key: key,
          leading: leading,
          trailing: trailing,
          child: child,
          onPressed: onPressed,
          mouseCursor: mouseCursor,
          focusNode: focusNode,
          focusable: focusable,
          padding: padding,
          alignment: alignment,
          textStyle: textStyle,
        );

  @override
  _DenseButtonState createState() => _DenseButtonState();
}

class _DenseButtonState extends ButtonState {
  @override
  Widget buildButton(BuildContext context) {
    return AnimatedContainer(
      duration: kDefaultDuration,
      padding: padding,
      child: mergeAnimatedTextStyle(
        duration: kDefaultDuration,
        style: TextStyle(
          color: !isHovering
              ? Theme.of(context).colorScheme.primary.withOpacity(0.8)
              : Theme.of(context).colorScheme.foreground,
        ),
        child: AnimatedIconTheme.merge(
          duration: kDefaultDuration,
          data: IconThemeData(
            color: !isHovering
                ? Theme.of(context).colorScheme.primary.withOpacity(0.8)
                : Theme.of(context).colorScheme.foreground,
          ),
          child: buildContent(context),
        ),
      ),
    );
  }
}

class TextButton extends Button {
  const TextButton({
    Key? key,
    Widget? leading,
    Widget? trailing,
    required Widget child,
    VoidCallback? onPressed,
    MouseCursor mouseCursor = SystemMouseCursors.click,
    FocusNode? focusNode,
    bool focusable = true,
    EdgeInsets padding = Button.normalPadding,
    AlignmentGeometry? alignment,
    TextStyle textStyle = Button.normalTextStyle,
  }) : super(
          key: key,
          leading: leading,
          trailing: trailing,
          child: child,
          onPressed: onPressed,
          mouseCursor: mouseCursor,
          focusNode: focusNode,
          focusable: focusable,
          padding: padding,
          alignment: alignment,
          textStyle: textStyle,
        );

  @override
  _TextButtonState createState() => _TextButtonState();
}

class _TextButtonState extends ButtonState {
  @override
  Widget buildButton(BuildContext context) {
    return AnimatedContainer(
      duration: kDefaultDuration,
      padding: padding,
      child: mergeAnimatedTextStyle(
        duration: kDefaultDuration,
        style: TextStyle(
          color: isHovering && !isDisabled
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.mutedForeground,
        ),
        child: buildContent(context),
      ),
    );
  }
}

class DestructiveButton extends Button {
  final ButtonShape shape;
  const DestructiveButton({
    Key? key,
    Widget? leading,
    Widget? trailing,
    required Widget child,
    VoidCallback? onPressed,
    MouseCursor mouseCursor = SystemMouseCursors.click,
    FocusNode? focusNode,
    bool focusable = true,
    EdgeInsets padding = Button.normalPadding,
    AlignmentGeometry? alignment,
    TextStyle textStyle = Button.normalTextStyle,
    this.shape = ButtonShape.rectangle,
  }) : super(
          key: key,
          leading: leading,
          trailing: trailing,
          child: child,
          onPressed: onPressed,
          mouseCursor: mouseCursor,
          focusNode: focusNode,
          focusable: focusable,
          padding: padding,
          alignment: alignment,
          textStyle: textStyle,
        );

  @override
  _DestructiveButtonState createState() => _DestructiveButtonState();
}

class _DestructiveButtonState extends ButtonState<DestructiveButton> {
  @override
  Widget buildButton(BuildContext context) {
    var themeData = Theme.of(context);
    return AnimatedContainer(
      duration: kDefaultDuration,
      decoration: widget.shape == ButtonShape.rectangle
          ? BoxDecoration(
              color: isDisabled
                  ? themeData.colorScheme.primaryForeground
                  : isHovering
                      ? themeData.colorScheme.destructive.withOpacity(0.8)
                      : themeData.colorScheme.destructive,
              borderRadius: BorderRadius.circular(themeData.radiusMd),
            )
          : BoxDecoration(
              color: isDisabled
                  ? themeData.colorScheme.primaryForeground
                  : isHovering
                      ? themeData.colorScheme.destructive.withOpacity(0.8)
                      : themeData.colorScheme.destructive,
              shape: BoxShape.circle,
            ),
      padding: padding,
      child: mergeAnimatedTextStyle(
        duration: kDefaultDuration,
        style: TextStyle(
          color: isDisabled
              ? themeData.colorScheme.mutedForeground
              : themeData.colorScheme.destructiveForeground,
        ),
        child: AnimatedIconTheme.merge(
          duration: kDefaultDuration,
          data: IconThemeData(
            color: isDisabled
                ? themeData.colorScheme.mutedForeground
                : themeData.colorScheme.destructiveForeground,
          ),
          child: buildContent(context),
        ),
      ),
    );
  }
}
