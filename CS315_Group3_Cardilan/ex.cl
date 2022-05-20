imports{}

main
    // indetifier initialization
    testVariable << 52;
    set<G> @setD << file_input('input.txt');
    // set initialization  and operations
    set<G> @setA;
    @setA.union(set_input())
    set<G> @setB << set_input() ;
    @setC << @setA.diff(@setB);
    @setC << @setA.intersection(@setB);
    @setC << @setA.union(@setB);
    @setC << @setA.cartesian(@setB);
    
    // adding operation
    @setA.insert(1);
    @setA.insert('aString');
    @setA.insert( testVariable);
    
    bool << @setA.supersetOf(@setB);
    while @setA.supersetOf(@setB):
        if @setB.subsetOf(@setA):
            @setB.delete();
        endif
        else:
            @setA.delete();
        endelse
    endwhile

	G elem << a + 52 * -testfunc(@setC) % @setB.cardinality();

    bool1 << @setA.contain(52);
    bool2 << @setA.contain('aString');
    bool3 << @setA.contain(count);
    bool2 << @setA.contain('falseString');
    testVariable2 << 4;

    func foo( testVariable2):
        @setA.insert( testVariable2);
        @setA.insert( '52');
        @setA.insert( @setB);
        return @setA;
    endfunc

    @setA << foo( testVariable2);
    
    for(i = 1:21):
        @setA.print();
	for(i = 1:21):
        	@setA.print();
    	endfor
    endfor

    if(bool1 OR bool2):
        @setB.input();
    endif:
    else:
        @setA.print();
    endelse
    
    testVariable3 << 17;
    testVariable4 << 10;

    while(testVariable3 <= testVariable4 ):
        if @setA.subsetOf(@setB):
            testVariable3 << 97;
        endif
        else:
            @setA.union(@setB);
        endelse
	for(i = 1:21):
        	@setA.print();
		for(i = 1:21):
        		@setA.print();
    		endfor
    	endfor

    endwhile


    
    while foo(testVariable3):
        if @setA.subsetof(@setB):
            temp << 68;
        endif
        else:
            @setA.add(@setB);
        endelse
    endwhile

    if foo(testVariable4):
            temp << 16;
    endif
    else:
        @setA.union(@setB);
    endelse
endmain