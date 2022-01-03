
# XCTest Crash Demo

This repo intends to centralize XCTest crash errors and the way they can be reproduced in order to help developers to understand them.


### 1.- Early unexpected exit
---
Error message:
```
XCTestCrash (67172) encountered an error (Early unexpected exit, operation never finished bootstrapping - no restart will be attempted. (Underlying Error: Test crashed with signal trap before starting test execution.
```
This happens when the App Host crashes, you can reproduce it by uncommenting `crash1()`or `crash2()` functions in `ViewController.swift` and executing `./run.sh`


### 2.- Restarting after unexpected exit
---
Error message:
```
Restarting after unexpected exit, crash, or test timeout in XCTestCrashTests.testExample(); summary will include totals from previous launches.
```
This happens when a Test Case crashes, you can reproduce it by uncommenting `testExample1()`or `testExample2()`  in `XCTestCrashTests.swift` and executing `./run.sh`

---

# Possible approaches/solutions

Of course the best solution is to solve the crash but the error messages doesn't add too much information what caused it.

A solution is to search in the DiagnosticReports directories:
 `$HOME/Library/Logs/DiagnosticReports` and `/Library/Logs/DiagnosticReports`
for the last crash report and export it, this is the script we are using to search the latest (up to 30 segs ago).


```
find $HOME/Library/Logs/DiagnosticReports /Library/Logs/DiagnosticReports \
  -type f -mtime -30s \( -name '*.ips' -o -name '*.crash' \) -print0 | \
  xargs -0 stat -f "%m %N" | \
  sort -rn | \
  head -1 | \
  cut -f2- -d" "
```
