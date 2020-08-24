
//invalid testing

#allocate(valcl(3),i32) ;cl
#readna(#heap(0,3))   
		//this operator should be stuck due to the read to an invalid location
