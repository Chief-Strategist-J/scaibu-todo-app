import 'package:todo_app/core/app_library.dart';

class CreateEntityComponent<T> extends StatelessWidget {
  final Widget Function(BuildContext, T) _listItemBuilder;
  final EmptyEntityModel<T> _model;

  const CreateEntityComponent({
    super.key,
    required Widget Function(BuildContext, T) listItemBuilder,
    required EmptyEntityModel<T> model,
  })  : _model = model,
        _listItemBuilder = listItemBuilder;

  @override
  Widget build(BuildContext context) {
    List<T> _list = _model.getList(context);

    if (_list.isEmpty) {
      return EmptyComponent<T>(model: _model);
    } else {
      return PressableBox(
        style: _model.style.dialogStyle(context),
        child: AnimatedScrollView(
          listAnimationType: ListAnimationType.None,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Offstage(),
                    Text(_model.title, style: boldTextStyle(size: 20)),
                    IconButton(icon: const Icon(Icons.add), onPressed: _model.onCreateTap),
                  ],
                ),
                ListView.separated(
                  itemCount: _list.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => const Divider(thickness: 0.5),
                  itemBuilder: (context, index) {
                    return _listItemBuilder(context, _list[index]);
                  },
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
