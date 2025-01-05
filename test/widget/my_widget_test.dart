import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:playground/widget/my_app.dart';
import 'package:playground/widget/my_widget.dart';
import 'package:playground/widget/todo_list.dart';

void main() {
  testWidgets('MyWidget has a title and message', (WidgetTester tester) async {
    await tester.pumpWidget(const MyWidget(title: "title", message: "message"));

    final titleFinder = find.text('title');
    final messageFinder = find.text("message");

    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
  });

  testWidgets('finds a deep item in a long list', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp(
      items: List<String>.generate(10000, (i) => 'Item $i'),
    ));

    final listFinder = find.byType(Scrollable);
    final itemFinder = find.byKey(const ValueKey('item_50_text'));

    await tester.scrollUntilVisible(
      itemFinder,
      500.0,
      scrollable: listFinder,
    );

    expect(itemFinder, findsOneWidget);
  });

  testWidgets('Add and remove a todo', (WidgetTester tester) async {
    await tester.pumpWidget(const TodoList());

    await tester.enterText(find.byType(TextField), 'Hello');

    await tester.tap(find.byType(FloatingActionButton));

    await tester.pump();

    expect(find.text('Hello'), findsOneWidget);


    await tester.drag(find.byType(Dismissible), const Offset(500, 0));

    await tester.pumpAndSettle();

    expect(find.text('Hello'), findsNothing);
  });
}
