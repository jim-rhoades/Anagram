# Anagram
A command line tool built to test the performance of various anagram checking methods.

Included are multiple versions of the function:

```swift
func isAnagram(string1: String, string2: String) -> Bool {

}
```
Unit tests are also included to ensure that each version of `isAnagram` works as expected.

##Rules
- ignore capitalization (given the strings "cow" and "Cow", the function should return true)
- ignore spaces (given the strings "Mia" and "I am", the function should return true)

##Why?
During a job interview I was given a "whiteboard" code challenge with this problem. After the interview I was curious and wanted to find a quick way of solving it with large strings.

Some ideas came from various members of the [iOS Developers Slack group](https://ios-developers.io).
