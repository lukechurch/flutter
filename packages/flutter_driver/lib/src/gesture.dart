// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'message.dart';
import 'find.dart';

/// Taps on a target widget located by [finder].
class Tap extends CommandWithTarget {
  @override
  final String kind = 'tap';

  /// Creates a tap command to tap on a widget located by [finder].
  Tap(SerializableFinder finder) : super(finder);

  /// Deserializes this command from JSON generated by [serialize].
  static Tap deserialize(Map<String, String> json) {
    return new Tap(SerializableFinder.deserialize(json));
  }

  @override
  Map<String, String> serialize() => super.serialize();
}

/// The result of a [Tap] command.
class TapResult extends Result {
  /// Deserializes this result from JSON.
  static TapResult fromJson(Map<String, dynamic> json) {
    return new TapResult();
  }

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{};
}


/// Command the driver to perform a scrolling action.
class Scroll extends CommandWithTarget {
  @override
  final String kind = 'scroll';

  /// Creates a scroll command that will attempt to scroll a scrollable view by
  /// dragging a widget located by the given [finder].
  Scroll(
    SerializableFinder finder,
    this.dx,
    this.dy,
    this.duration,
    this.frequency
  ) : super(finder);

  /// Deserializes this command from JSON generated by [serialize].
  static Scroll deserialize(Map<String, dynamic> json) {
    return new Scroll(
      SerializableFinder.deserialize(json),
      double.parse(json['dx']),
      double.parse(json['dy']),
      new Duration(microseconds: int.parse(json['duration'])),
      int.parse(json['frequency'])
    );
  }

  /// Delta X offset per move event.
  final double dx;

  /// Delta Y offset per move event.
  final double dy;

  /// The duration of the scrolling action
  final Duration duration;

  /// The frequency in Hz of the generated move events.
  final int frequency;

  @override
  Map<String, String> serialize() => super.serialize()..addAll(<String, String>{
    'dx': '$dx',
    'dy': '$dy',
    'duration': '${duration.inMicroseconds}',
    'frequency': '$frequency',
  });
}

/// The result of a [Scroll] command.
class ScrollResult extends Result {
  /// Deserializes this result from JSON.
  static ScrollResult fromJson(Map<String, dynamic> json) {
    return new ScrollResult();
  }

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Command the driver to ensure that the element represented by [finder]
/// has been scrolled completely into view.
class ScrollIntoView extends CommandWithTarget {
  @override
  final String kind = 'scrollIntoView';

  /// Creates this command given a [finder] used to locate the widget to be
  /// scrolled into view.
  ScrollIntoView(SerializableFinder finder) : super(finder);

  /// Deserializes this command from JSON generated by [serialize].
  static ScrollIntoView deserialize(Map<String, dynamic> json) {
    return new ScrollIntoView(SerializableFinder.deserialize(json));
  }

  // This is here just to be clear that this command isn't adding any extra
  // fields.
  @override
  Map<String, String> serialize() => super.serialize();
}
