module main

import regex
import os

// get_line_result wraps the builtin get_raw_lines_joined function to return a result.
// Error is returned on empty string.
fn get_line_result() !string {
	str := os.get_raw_lines_joined()
	if str.is_blank() {
		return error('empty string')
	}
	return str
}

// bytecounter returns the total count of bytes as a string for a given string.
fn bytecounter(s string) string {
	return s.bytes().len.str()
}

// linecounter returns the total count of lines a string in the given string.
fn linecounter(s string) string {
	mut count := s.count('\n')
	return count.str()
}

// wordcounter returns the word count of the given string.
fn wordcounter(s string) string {
	query := r'\s+'
	mut re := regex.regex_opt(query) or { panic(err) }
	count := re.split(s).len.str()
	return count
}

// charcounter returns the char count of the given string.
fn charcounter(s string) string {
	return s.runes().len.str()
}

fn combine_out(s []string) string {
	message := s.join('\t')
	return message
}

type Counter = fn (string) string

fn wrapper(function Counter, input string) string {
	return function(input)
}

fn (args Args) select_output(text string) []string {
	mut output_list := []string{}

	if args.bytes {
		output_list << wrapper(bytecounter, text)
	}

	if args.lines {
		output_list << wrapper(linecounter, text)
	}

	if args.words {
		output_list << wrapper(wordcounter, text)
	}

	if args.chars {
		output_list << wrapper(charcounter, text)
	}

	// default option
	if output_list.len == 0 {
		output_list << wrapper(linecounter, text)
		output_list << wrapper(wordcounter, text)
		output_list << wrapper(bytecounter, text)
	}

	output_list << args.path

	return output_list
}
