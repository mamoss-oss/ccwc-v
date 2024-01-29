module main

import os

fn main() {
	args := parse_flags() or {
		println(err)
		return
	}

	text := if temp := os.read_file(args.path) {
		temp.str()
	} else if temp := get_line_result() {
		temp.str()
	} else {
		return
	}

	result := combine_out(args.select_output(text))
	println(result)
}
