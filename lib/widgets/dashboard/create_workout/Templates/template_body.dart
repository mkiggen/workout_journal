import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workout_journal_v2/models/workout/workout.dart';
import 'package:workout_journal_v2/providers/workout/workout_template_provider.dart';
import 'package:workout_journal_v2/widgets/custom/create_button.dart';
import 'package:workout_journal_v2/widgets/custom/no_items_found.dart';
import 'package:workout_journal_v2/widgets/dashboard/create_workout/Templates/template_item.dart';

class TemplateBody extends ConsumerStatefulWidget {
  const TemplateBody({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<TemplateBody> createState() => _TemplateBodyState();
}

class _TemplateBodyState extends ConsumerState<TemplateBody> {
  List<bool> bools = [];

  void checkBools(List<Workout> templates) {
    if (bools.isEmpty || bools.length != templates.length) {
      setState(() {
        bools = List<bool>.generate(templates.length, (index) => false);
      });
    }
  }

  void onSelected(bool? b, int index) {
    if (b == null) return;

    setState(() {
      bools.fillRange(0, bools.length, false);
      bools[index] = b;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Workout> templates = ref.watch(templatesProvider);
    checkBools(templates);

    if (templates.isEmpty) {
      return const NoItemsFound(
        title: 'No Templates Found',
        subtitle: 'Click the plus to create one',
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: templates.length,
              itemBuilder: (context, index) => TemplateItem(
                isSelected: bools[index],
                onSelected: onSelected,
                workout: templates[index],
                index: index,
              ),
            ),
          ),
          if (bools.contains(true))
            Padding(
              padding: const EdgeInsets.all(16),
              child: CreateButton(
                onPressed: () {},
              ),
            ),
        ],
      ),
    );
  }
}
