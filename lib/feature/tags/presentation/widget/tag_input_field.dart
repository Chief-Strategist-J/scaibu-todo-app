import 'package:todo_app/core/app_library.dart';

/// Doc Required
class TagInputField extends StatelessWidget {
  /// Doc Required
  const TagInputField({super.key});

  @override
  Widget build(final BuildContext context) {
    final TagBloc tagBloc = context.read<TagBloc>();

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: ContentWidget(
        title: 'Tag Name',
        prefixIcon: Padding(
          padding: const EdgeInsets.all(14),
          child: SvgPicture.asset(
            Assets.iconIcTag,
            width: 16,
            height: 16,
            colorFilter: ColorFilter.mode(
              cardColor.withValues(alpha: 0.3),
              BlendMode.srcIn,
            ),
          ),
        ),
        controller: tagBloc.tagTextEditingController,
        focusNode: tagBloc.tagTextFocusNode,
      ),
    );
  }
}
