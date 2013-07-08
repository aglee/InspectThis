# InspectThis

Demonstrates an approach to implementing the "inspector" UI pattern that is used in many Cocoa apps.  In this UI pattern, you have inspector views that let you view and edit various properties of a selected object.  The inspector views are subviews of a container view that I call the "multi-inspector view".

This implementation revolves around one simple class, ITMultiInspectorViewController ([.h][1], [.m][2]), which is the view controller for a multi-inspector view.  To tell an ITMultiInspectorViewController what object to inspect, set its objectToInspect property.

The windowDidLoad method of ITWindowWithInspectorsWindowController ([.h][3], [.m][4]) shows how to put inspectors into a multi-inspector view.

ITFloatingInspectorWindowController ([.h][5], [.m][6]) shows a way to implement a single application-wide inspector panel.

ITDataWindowController ([.h][7], [.m][8]) shows a way to implement document windows that each have their own inspector views.  Within each document window, the inspector views reflect the selected object in that window.

In this demo app, because the properties being inspected are simple, no subclassing is needed for the inspector views themselves, just different nibs.  Each inspector view is implemented using a plain NSView, standard Cocoa controls, and a plain NSViewController, along with bindings.

I'm sure there are more powerful libraries out there that already do the same or similar.  I just felt like rolling my own as an exercise.


[1]: https://github.com/aglee/InspectThis/blob/master/InspectThis/ITMultiInspectorViewController.h
[2]: https://github.com/aglee/InspectThis/blob/master/InspectThis/ITMultiInspectorViewController.m

[3]: https://github.com/aglee/InspectThis/blob/master/InspectThis/ITWindowWithInspectorsWindowController.h
[4]: https://github.com/aglee/InspectThis/blob/master/InspectThis/ITWindowWithInspectorsWindowController.m

[5]: https://github.com/aglee/InspectThis/blob/master/InspectThis/ITFloatingInspectorWindowController.h
[6]: https://github.com/aglee/InspectThis/blob/master/InspectThis/ITFloatingInspectorWindowController.m

[7]: https://github.com/aglee/InspectThis/blob/master/InspectThis/ITDataWindowController.h
[8]: https://github.com/aglee/InspectThis/blob/master/InspectThis/ITDataWindowController.m


