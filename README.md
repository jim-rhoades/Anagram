# Anagram
A command line tool built to test the performance of various anagram checking methods.

Included are multiple versions of the function:

```swift
func isAnagram(string1: String, string2: String) -> Bool {

}
```
Unit tests are also included to ensure that each version of `isAnagram` works as expected.

### Rules
- ignore capitalization (given the strings "cow" and "Cow", the function should return true)
- ignore spaces (given the strings "Mia" and "I am", the function should return true)

### Why?
During a job interview I was given a "whiteboard" code challenge with this problem. After the interview I was curious and wanted to find a quick way of solving it with large strings.

Some ideas came from various members of the [iOS Developers Slack group](https://ios-developers.io).

### Key take-aways
- Version 2 (`isAnagramV2`) is the fastest, though it might not be the answer an interviewer is looking for during a whiteboard job interview.
- Originally I had written this in a Playground, but performance testing in a Playground is generally not a good idea. Testing the compiled code via this command line tool provides more accurate results.
- Performance differences between the debug build and release build can be dramatic. On my computer, `isAnagramV2` takes 10s when running the debug build, and less than 1s for the release build. So, it's best to test permformance on the release build.
