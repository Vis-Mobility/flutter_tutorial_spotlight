/// The vertical position of the tooltip relative to the spotlight item.
enum SpotlightTooltipVerticalPosition {
  /// The tooltip will be positioned at the top of the spotlight item.
  top,

  /// The tooltip will be positioned at the bottom of the spotlight item.
  bottom,

  /// The tooltip will be positioned at the top if the spotlight item is closer
  /// to the bottom of the screen, otherwise will be positioned at the bottom.
  automatic;
}

/// The horizontal position of the tooltip.
enum SpotlightTooltipHorizontalPosition {
  /// The tooltip will be aligned to the left of the spotlight item.
  alignLeft,

  /// The tooltip will be aligned to the right of the spotlight item.
  alignRight,

  /// The tooltip will be aligned to the center of the screen.
  center;
}

/// The horizontal point along the spotlight item to which the tooltip's pointer
/// will point to.
enum SpotlightTooltipPointer {
  /// The tooltip's pointer will point to the left of the spotlight item.
  left,

  /// The tooltip's pointer will point to the right of the spotlight item.
  right,

  /// The tooltip's pointer will point to the center of the spotlight item.
  center;
}
