import 'package:shadcn_flutter/shadcn_flutter.dart';

class ItemPicker<T> extends StatelessWidget {
  final ItemChildDelegate<T> items;
  final ItemPickerBuilder<T> builder;
  final T? value;
  final ValueChanged<T?>? onChanged;
  final ItemPickerLayout layout;
  final Widget? placeholder;
  final Widget? dialogTitle;
  final PromptMode mode;
  final BoxConstraints? constraints;
  const ItemPicker({
    super.key,
    required this.items,
    required this.builder,
    this.value,
    this.onChanged,
    this.layout = ItemPickerLayout.grid,
    this.placeholder,
    this.dialogTitle,
    this.mode = PromptMode.dialog,
    this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = ShadcnLocalizations.of(context);
    return ObjectFormField(
        value: value,
        placeholder: placeholder ?? const SizedBox.shrink(),
        builder: builder,
        dialogTitle: dialogTitle,
        onChanged: onChanged,
        mode: mode,
        decorate: false,
        editorBuilder: (context, handler) {
          if (mode == PromptMode.dialog) {
            final theme = Theme.of(context);
            final padding = MediaQuery.paddingOf(context);
            return ModalBackdrop(
              borderRadius: theme.borderRadiusXl,
              child: ModalContainer(
                borderRadius: theme.borderRadiusXl,
                padding: EdgeInsets.zero,
                child: IntrinsicWidth(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (dialogTitle != null || placeholder != null)
                        Padding(
                          padding: EdgeInsets.all(16.0 * theme.scaling) +
                              EdgeInsets.only(top: padding.top),
                          child: dialogTitle ?? placeholder,
                        ),
                      ConstrainedBox(
                        constraints: constraints ??
                            BoxConstraints.tightFor(
                              width: 320 * theme.scaling,
                              height: 320 * theme.scaling,
                            ),
                        child: MediaQuery(
                          data: MediaQuery.of(context).copyWith(
                            padding: padding.copyWith(top: 0) +
                                const EdgeInsets.only(
                                        bottom: 8.0, left: 8.0, right: 8.0) *
                                    theme.scaling,
                          ),
                          child: ItemPickerDialog<T>(
                            items: items,
                            builder: builder,
                            layout: layout,
                            value: handler.value,
                            onChanged: (value) {
                              handler.value = value;
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(16.0 * theme.scaling),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Button.secondary(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(localizations.buttonCancel),
                            ),
                            if (onChanged != null)
                              Button.primary(
                                onPressed: () {
                                  Navigator.of(context).pop(
                                      ObjectFormFieldDialogResult(
                                          handler.value));
                                },
                                child: Text(localizations.buttonSave),
                              ),
                          ].joinSeparator(SizedBox(width: 8.0 * theme.scaling)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            final theme = Theme.of(context);
            final mediaQuery = MediaQuery.of(context);
            return SurfaceCard(
              padding: EdgeInsets.zero,
              child: ConstrainedBox(
                constraints: constraints ??
                    BoxConstraints(
                      maxWidth: 320 * theme.scaling,
                      maxHeight: 320 * theme.scaling,
                    ),
                child: MediaQuery(
                  data: mediaQuery.copyWith(
                      padding: mediaQuery.padding +
                          EdgeInsets.all(8.0 * theme.scaling)),
                  child: ItemPickerDialog<T>(
                    items: items,
                    builder: builder,
                    value: handler.value,
                    layout: layout,
                    onChanged: (value) {
                      handler.value = value;
                    },
                  ),
                ),
              ),
            );
          }
        });
  }
}

abstract class ItemChildDelegate<T> {
  const ItemChildDelegate();
  int? get itemCount;
  T? operator [](int index);
}

class ItemList<T> extends ItemChildDelegate<T> {
  final List<T> items;
  const ItemList(this.items);
  @override
  int get itemCount => items.length;
  @override
  T operator [](int index) => items[index];
}

class ItemBuilder<T> extends ItemChildDelegate<T> {
  @override
  final int? itemCount;
  final T? Function(int index) itemBuilder;
  const ItemBuilder({this.itemCount, required this.itemBuilder});

  @override
  T? operator [](int index) => itemBuilder(index);
}

typedef ItemPickerBuilder<T> = Widget Function(BuildContext context, T item);

abstract class ItemPickerLayout {
  static const ListItemPickerLayout list = ListItemPickerLayout();
  static const GridItemPickerLayout grid = GridItemPickerLayout();
  const ItemPickerLayout();
  Widget build(
      BuildContext context, ItemChildDelegate items, ItemPickerBuilder builder);
}

class ListItemPickerLayout extends ItemPickerLayout {
  const ListItemPickerLayout();
  @override
  Widget build(BuildContext context, ItemChildDelegate items,
      ItemPickerBuilder builder) {
    final padding = MediaQuery.paddingOf(context);
    return MediaQuery.removePadding(
      context: context,
      removeBottom: true,
      removeLeft: true,
      removeRight: true,
      removeTop: true,
      child: ListView.builder(
        itemCount: items.itemCount,
        padding: padding,
        itemBuilder: (context, index) {
          var item = items[index];
          if (item == null) {
            return null;
          }
          return builder(context, item);
        },
      ),
    );
  }
}

class GridItemPickerLayout extends ItemPickerLayout {
  final int crossAxisCount;
  const GridItemPickerLayout({this.crossAxisCount = 4});

  ItemPickerLayout call({int crossAxisCount = 4}) {
    return GridItemPickerLayout(crossAxisCount: crossAxisCount);
  }

  @override
  Widget build(BuildContext context, ItemChildDelegate items,
      ItemPickerBuilder builder) {
    final theme = Theme.of(context);
    final padding = MediaQuery.paddingOf(context);
    return MediaQuery.removePadding(
      context: context,
      removeBottom: true,
      removeLeft: true,
      removeRight: true,
      removeTop: true,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 4.0 * theme.scaling,
          crossAxisSpacing: 4.0 * theme.scaling,
        ),
        padding: padding,
        itemCount: items.itemCount,
        itemBuilder: (context, index) {
          var item = items[index];
          if (item == null) {
            return null;
          }
          return builder(context, item);
        },
      ),
    );
  }
}

Future<T?> showItemPicker<T>(
  BuildContext context, {
  required ItemChildDelegate<T> items,
  required ItemPickerBuilder<T> builder,
  T? initialValue,
  ItemPickerLayout layout = const GridItemPickerLayout(),
  AlignmentGeometry? alignment,
  AlignmentGeometry? anchorAlignment,
  BoxConstraints? constraints,
  Offset? offset,
}) {
  final theme = Theme.of(context);
  return showPopover<T>(
    context: context,
    alignment: alignment ?? AlignmentDirectional.topStart,
    anchorAlignment: anchorAlignment ?? AlignmentDirectional.bottomStart,
    offset: offset ?? Offset(0, 8.0 * theme.scaling),
    builder: (context) {
      final theme = Theme.of(context);
      final mediaQuery = MediaQuery.of(context);
      return SurfaceCard(
        padding: EdgeInsets.zero,
        child: ConstrainedBox(
          constraints: constraints ??
              BoxConstraints(
                maxWidth: 320 * theme.scaling,
                maxHeight: 320 * theme.scaling,
              ),
          child: MediaQuery(
            data: mediaQuery.copyWith(
                padding:
                    mediaQuery.padding + EdgeInsets.all(8.0 * theme.scaling)),
            child: ItemPickerDialog<T>(
              items: items,
              builder: builder,
              value: initialValue,
              layout: layout,
              onChanged: (value) {
                closeOverlay<T>(context, value);
              },
            ),
          ),
        ),
      );
    },
  ).future;
}

Future<T?> showItemPickerDialog<T>(
  BuildContext context, {
  required ItemChildDelegate<T> items,
  required ItemPickerBuilder<T> builder,
  ItemPickerLayout layout = const GridItemPickerLayout(),
  T? initialValue,
  BoxConstraints? constraints,
  required Widget title,
}) {
  return showDialog<T>(
    context: context,
    builder: (context) {
      final theme = Theme.of(context);
      final padding = MediaQuery.paddingOf(context);
      return ModalBackdrop(
        borderRadius: theme.borderRadiusXl,
        child: ModalContainer(
          borderRadius: theme.borderRadiusXl,
          padding: EdgeInsets.zero,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.all(16.0 * theme.scaling) +
                    EdgeInsets.only(top: padding.top),
                child: title,
              ),
              ConstrainedBox(
                constraints: constraints ??
                    BoxConstraints(
                      maxWidth: 320 * theme.scaling,
                      maxHeight: 320 * theme.scaling,
                    ),
                child: MediaQuery(
                  data: MediaQuery.of(context).copyWith(
                    padding: padding.copyWith(top: 0) +
                        const EdgeInsets.only(
                                bottom: 8.0, left: 8.0, right: 8.0) *
                            theme.scaling,
                  ),
                  child: ItemPickerDialog<T>(
                    items: items,
                    builder: builder,
                    layout: layout,
                    value: initialValue,
                    onChanged: (value) {
                      Navigator.of(context).pop(value);
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}

class ItemPickerDialog<T> extends StatefulWidget {
  final ItemChildDelegate<T> items;
  final ItemPickerBuilder<T> builder;
  final ItemPickerLayout layout;
  final T? value;
  final ValueChanged<T?>? onChanged;
  const ItemPickerDialog({
    super.key,
    required this.items,
    required this.builder,
    this.value,
    this.onChanged,
    this.layout = const GridItemPickerLayout(),
  });

  @override
  State<ItemPickerDialog<T>> createState() => _ItemPickerDialogState<T>();
}

class _ItemPickerDialogState<T> extends State<ItemPickerDialog<T>> {
  void _onChanged(Object? value) {
    widget.onChanged?.call(value as T);
  }

  Widget _buildItem(BuildContext context, Object? item) {
    assert(item is T, 'Item type must be $T');
    return widget.builder(context, item as T);
  }

  @override
  Widget build(BuildContext context) {
    return Data.inherit(
      data: ItemPickerData(
        value: widget.value,
        onChanged: _onChanged,
        layout: widget.layout,
      ),
      child: widget.layout.build(context, widget.items, _buildItem),
    );
  }
}

class ItemPickerData {
  final Object? value;
  final ValueChanged<Object?>? onChanged;
  final ItemPickerLayout layout;
  const ItemPickerData({this.value, this.onChanged, required this.layout});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ItemPickerData) return false;
    return other.value == value &&
        other.onChanged == onChanged &&
        other.layout == layout;
  }

  @override
  int get hashCode => Object.hash(value, onChanged, layout);
}

class ItemPickerOption<T> extends StatelessWidget {
  final T value;
  final Widget? label;
  final Widget child;
  final AbstractButtonStyle? style;
  final AbstractButtonStyle? selectedStyle;
  const ItemPickerOption({
    super.key,
    required this.value,
    required this.child,
    this.style,
    this.selectedStyle,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    final data = Data.maybeOf<ItemPickerData>(context);
    if (data == null) {
      return LayoutBuilder(
        builder: (context, constraints) {
          Size size = constraints.biggest;
          if (size.width == size.height) {
            return Stack(
              fit: StackFit.passthrough,
              children: [
                child,
                if (label != null)
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Center(child: label),
                  ),
              ],
            );
          }
          if (label == null) {
            return child;
          }
          return BasicLayout(
            leading: child,
            content: label,
          );
        },
      );
    }
    if (data.layout is ListItemPickerLayout) {
      if (label == null) {
        return Button(
          onPressed:
              data.onChanged == null ? null : () => data.onChanged!(value),
          style: data.value == value
              ? (selectedStyle ?? ButtonVariance.primary)
              : (style ?? ButtonVariance.ghost),
          child: child,
        );
      }
      return Button(
        onPressed: data.onChanged == null ? null : () => data.onChanged!(value),
        leading: child,
        style: data.value == value
            ? (selectedStyle ?? ButtonVariance.primary)
            : (style ?? ButtonVariance.ghost),
        child: label!,
      );
    }
    return IconButton(
      icon: Stack(
        fit: StackFit.passthrough,
        children: [
          child,
          if (label != null)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Center(child: label),
            ),
        ],
      ),
      onPressed: data.onChanged == null ? null : () => data.onChanged!(value),
      variance: data.value == value
          ? (selectedStyle ?? ButtonVariance.primary)
          : (style ?? ButtonVariance.ghost),
    );
  }
}
