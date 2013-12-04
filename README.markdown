# InspectThis

[agl] Make the demo nicer.

Demonstrates an approach to implementing the "inspector" UI pattern that is used in many Cocoa apps.  In this UI pattern, you have inspector views that let you view and edit various properties of a selected object.  The inspector views are subviews of a container view.

This implementation revolves around one reusable class, ALInspectorPalette.  To tell an ALInspectorPalette what object to inspect, set its objectToInspect property.

ALInspectorPalette is an abstract base class.  ALSimpleInspectorPalette shows a simple implmentation where inspector views are arranged vertically as direct subviews of the container view.

ITDataWindowController shows a way to implement document windows that each have their own inspector views.  Within each document window, the inspector views reflect the selected object in that window.

ITFloatingInspectorWindowController shows a way to implement a single application-wide inspector panel whose inspectors reflect the selected object in whatever the current main window is.

In this demo app, because the properties being inspected are simple, no subclassing is needed for the inspector views themselves, just different nibs.  Each inspector view is implemented using a plain NSView, standard Cocoa controls, and a plain NSViewController, along with bindings.

