func set<G> myremove(set<G> @A, G elem):
	// primitive function remove already exists so this is
	// named myremove
	return @A.diff({elem});
endfunc

print('enter file name');
string fname << input();
set<G> @A << file_input(fname);

set<G> @B << myremove(@A, 10);

print(@B);