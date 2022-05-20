main
	print('enter file name');
	string fname << input();
	set<G> @A << file_input(fname);
	if @A.isempty():
		print('The set was empty')
	else:
		print(@A);
	endif
endmain