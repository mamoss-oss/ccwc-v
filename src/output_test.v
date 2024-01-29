module main

fn test_bytecount() {
	assert bytecount('') == '0'
	assert bytecount('hello world!') == '12'
	assert bytecount('Д') == '2'
	assert bytecount('ㅊ') == '3'
	assert bytecount('𐩹') == '4'
}

fn test_combine_out() {
	assert combine_out(['']) == ''
	assert combine_out(['123', 'test.txt']) == '123	test.txt'
	assert combine_out(['123', '456', 'test.txt']) == '123	456	test.txt'
	assert combine_out(['123', '456', '789', 'test.txt']) == '123	456	789	test.txt'
}
