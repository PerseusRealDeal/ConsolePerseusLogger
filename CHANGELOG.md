# Changelog

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).<br/>

Dates in this file meets Gregorian calendar. Date in format YYYY-MM-DD.

## [1.6.0] - [2025-10-NN], CPL

### Added

- End-user message.
- Log report.

## [1.5.1] - [2025-07-22], CPL

### Added

- SwiftUI debugging usage sample to README.

### Changed

- Renamed internals variables for the sake of consistency.

### Removed

- Platforms specification of Package manifesto.

### Updated

- GitHub CI scripts.

## [1.5.0] - [2025-06-17], CPL with json config

### Added

- Json config to reset options. Option `tuned` can be reseted manually only.
- Xcode Swift playground with CPL usage samples.

## [1.4.0] - [2025-06-14], CPL with PID and TID

### Added

- PID & TID for both stadard and custom output.

## [1.3.0] - [2025-05-21], CPL with Custom Output

### Added

- Output as a message parameter.

## [1.2.0] - [2025-05-15], CPL with Custom Output

### Added

- Custom output option.
- Minor changes.

## [1.1.0] - [2025-04-27], CPL

- Minimum build requirements: macOS 10.13+, iOS 11.0+, Xcode 14.2+. If standalone Xcode 10.1+.

### Changed

- Renamed API component: Output.xcodedebug > Output.standard
- Minor changes.

### Added

- Date and time to message.<br/>
  [TYPE] [DATE] [TIME] message, file: #, line: #

### Improved

- Message format.
- Source Code.
- Documentation.

### Removed

- Tag [LOG] from message.
- Unit tests, import test only.

## [1.0.3] - [2024-10-19], Console Output

### Security

- Message shouldn't be as a static or/and shareable field of CPL. To keep something in safe the best is do not keep it at all.

## [1.0.2] - [2024-10-17], Console Output

### Changed

- Default Message Level for DEBUG build from .notice to .debug.

## [1.0.1] - [2024-10-16], Console Output

### Fixed

- Mac Console ignores DEBUG messages if Simulator ([#6](https://github.com/perseusrealdeal/ConsolePerseusLogger/issues/6)).

## [1.0.0] - [2024-10-13], Console Output

### Added

- Output to Console on Mac.

## [0.1.0] - [2024-10-06], PerseusLogger

### Added

- [PerseusLogger](https://gist.github.com/perseusrealdeal/df456a9825fcface44eca738056eb6d5) as a foundation.

## [0.0.2] - [2024-10-04], GitHub CI update

### Added

- Github CI update for script [main.yml](/.github/workflows/main.yml).

## [0.0.1] - [2024-10-03], Developer Beginning Release

### Added

- Initial point of development process of [The Technological Tree](https://github.com/perseusrealdeal/TheTechnologicalTree).
