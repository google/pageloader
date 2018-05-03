Important developer note: all projects using any type of generator depend on
*all* generators. Since things like built_value are likely to show up in lots
of Dart projects, the generator code needs to be very tight in terms of
dependencies.

In particular: avoid dependencies on the PageLoader API, as it depends on
both old pageloader and WebDriver.