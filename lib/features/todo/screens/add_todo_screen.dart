import 'package:elred/features/todo/models/todo.dart';
import 'package:elred/shared/extensions/date_time.dart';
import 'package:elred/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/widgets/app_text_field.dart';
import '../providers/todo_provider.dart';
import '../widgets/delete_confirmation_dialog.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({
    super.key,
    this.todo,
  });

  final Todo? todo;

  static const String id = "/add-todo";

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  late final TextEditingController taskController;
  late final TextEditingController descriptionController;
  late final TextEditingController dateController;
  late DateTime date;

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    taskController = TextEditingController(text: widget.todo?.task);
    descriptionController = TextEditingController(text: widget.todo?.description);
    dateController = TextEditingController(
      text: widget.todo?.date == null ? DateTime.now().formatted : widget.todo?.date.formatted,
    );
    date = widget.todo?.date ?? DateTime.now();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              padding: const EdgeInsets.all(24.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    widget.todo == null ? "Add new todo" : "Edit todo",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 16.0,
                    ),
                  ),
                  const Spacer(),
                  IgnorePointer(
                    ignoring: widget.todo == null,
                    child: Opacity(
                      opacity: widget.todo != null ? 1 : 0,
                      child: GestureDetector(
                        onTap: () async {
                          final delete = await showDialog(
                            context: context,
                            builder: (context) => const DeleteConfirmationDialog(),
                          );

                          if (delete == true) {
                            await context.read<TodoProvider>().deleteTodo(widget.todo!);
                            Navigator.of(context).pop();
                          }
                        },
                        child: Icon(
                          Icons.delete_outline,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24.0),
            CircleAvatar(
              radius: 32.0,
              backgroundColor: Colors.white.withOpacity(0.4),
              child: CircleAvatar(
                backgroundColor: AppColors.primary,
                radius: 30.0,
                child: Icon(
                  Icons.today_outlined,
                  size: 32.0,
                  color: Colors.white.withOpacity(0.5),
                ),
              ),
            ),
            const SizedBox(height: 24.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    AppTextField(
                      controller: taskController,
                      hint: "Task",
                    ),
                    const SizedBox(height: 12.0),
                    AppTextField(
                      controller: descriptionController,
                      hint: "Description (Optional)",
                      isRequired: false,
                    ),
                    const SizedBox(height: 12.0),
                    AppTextField(
                      controller: dateController,
                      hint: "Date",
                      editingEnabled: false,
                      onTap: () async {
                        final d = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(
                            const Duration(
                              days: 1000,
                            ),
                          ),
                        );

                        if (d == null) return;

                        dateController.text = d.formatted;
                        date = d;
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32.0),
            GestureDetector(
              onTap: () async {
                FocusManager.instance.primaryFocus?.unfocus();

                if (formKey.currentState?.validate() == true) {
                  if (widget.todo == null) {
                    await context.read<TodoProvider>().addTodo(
                          Todo(
                            task: taskController.text,
                            description: descriptionController.text,
                            date: date,
                            completed: false,
                          ),
                        );
                  } else {
                    await context.read<TodoProvider>().updateTodo(
                          Todo(
                            id: widget.todo?.id,
                            task: taskController.text,
                            description: descriptionController.text,
                            date: date,
                            completed: false,
                          ),
                        );
                  }
                  Navigator.of(context).pop();
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.lightBlue,
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 12.0,
                      spreadRadius: -8,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(4.0),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 32.0),
                alignment: Alignment.center,
                width: double.maxFinite,
                padding: const EdgeInsets.all(16.0),
                child: const Text(
                  "SAVE YOUR TODO",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
