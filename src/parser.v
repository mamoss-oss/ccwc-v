module main

import flag
import os

pub struct Args {
pub:
	bytes bool
	lines bool
	words bool
	chars bool
	path  string
}

pub fn parse_flags() !Args {
	mut fp := flag.new_flag_parser(os.args)
	fp.application('ccwc')
	fp.version('v0.0.1')
	fp.description('This tool counts words, lines and bytes in a given text file.')
	fp.description('Returns byte count, word count and line count if no option is set.')
	fp.description('Provide an option to limit the returned output.')
	fp.limit_free_args(0, 1)!

	fp.skip_executable()

	bytes := fp.bool('bytes', `c`, false, 'print the byte count')
	lines := fp.bool('lines', `l`, false, 'print the line count')
	words := fp.bool('words', `w`, false, 'print the word count')
	chars := fp.bool('chars', `m`, false, 'print the char count')
	path_list := fp.finalize() or { return error('could not finalize') }
	path := path_list[0] or {
		'' // empty string to trigger reading from stdin
	}

	return Args{
		bytes: bytes
		lines: lines
		words: words
		chars: chars
		path: path
	}
}
