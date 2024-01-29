# ccwc - wc implementation in v

Reimplementation of the GNU Core utility wc as part of [Coding Challenges](https://codingchallenges.fyi/challenges/challenge-wc/).

## Build

Clone the repository and cd into the folder. Compile the application with one of the commands below.
```
# Fast unoptimized build
v .
# Optimized build
v -prod .
```

## Usage

```
ccwc v0.0.1
-----------------------------------------------
Usage: ccwc [options] [ARGS]

Description: This tool counts words, lines and bytes in a given text file.
Returns byte count, word count and line count if no option is set.
Provide an option to limit the returned output.

The arguments should be at most 1 in number.

Options:
  -c, --bytes               print the byte count
  -l, --lines               print the line count
  -w, --words               print the word count
  -m, --chars               print the char count
  -h, --help                display this help and exit
  --version                 output version information and exit
```