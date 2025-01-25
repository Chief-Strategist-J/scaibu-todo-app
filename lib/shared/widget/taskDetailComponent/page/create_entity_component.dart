import 'package:todo_app/core/app_library.dart';

/// CreateEntityComponent
class CreateEntityComponent<T> extends StatelessWidget {
  /// CreateEntityComponent
  const CreateEntityComponent({
    required final Widget Function(BuildContext, T) listItemBuilder,
    required final EmptyEntityModel<T> model,
    super.key,
  })  : _model = model,
        _listItemBuilder = listItemBuilder;

  final Widget Function(BuildContext, T) _listItemBuilder;
  final EmptyEntityModel<T> _model;

  @override
  Widget build(final BuildContext context) {
    final List<T> list = _model.getList(context);

    if (list.isEmpty) {
      return EmptyComponent<T>(model: _model);
    } else {
      return PressableBox(
        style: _model.style.dialogStyle(context),
        child: AnimatedScrollView(
          listAnimationType: ListAnimationType.None,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Offstage(),
                    Text(_model.title, style: boldTextStyle(size: 20)),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: _model.onCreateTap,
                    ),
                  ],
                ),
                ListView.separated(
                  itemCount: list.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder:
                      (final BuildContext context, final int index) =>
                          const Divider(thickness: 0.5),
                  itemBuilder: (final BuildContext context, final int index) =>
                      _listItemBuilder(context, list[index]),
                ),
                16.height,
              ],
            ),
          ],
        ),
      );
    }
  }
}
