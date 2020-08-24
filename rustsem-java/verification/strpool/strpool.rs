

/*****************Ptr*****************/

struct ptr {}

impl ptr {

     fn copy_nonoverlapping(from:* mut T, to:* mut T, z:i32) {
     	#rmemcp(from, to , z);
	#forget(from) ;
	#forget(to);
     }

     fn null() -> * const T {
     	-1   //We just use -1 to denote null
     }

     fn null_mut() -> * const T {
     	-1	   
     }

}
/******************Map****************/

struct Pair<T1,T2> {
     f:T1,
     s:T2
     n:Pair
}

struct Map {
     
}

/******************Cell***************/

struct Cell <T>  {
       value: T
}

impl Cell<T>{
     fn get(&self) -> * mut T {     	
     	#rawpt((* self).value)
     }

     fn new(value:T) -> Cell<T> {
     	Cell {
	     value : value
	}
     }

     fn set(& self, val1:T) {
     	let t = (*self).value;
     	(*self).value := val1;
     }
     
}

struct RefCell<T> {
       borrow: Cell<usize>,
       value : T
}

impl RefCell<T> {
     fn new (value: T) -> RefCell<T> {
	 RefCell {
	   	borrow: Cell::new(0),
	   	value: value
	 }
     }

     fn borrow_mut(& self) -> reft(#prodId(HashMap)) {
        if ((& imm ((*self).borrow)).get() = 0 ) then
     	{
            (& imm ((* self).borrow)).set(1);
	    val (& mut (* self).value)
	}
	else {
	    panic!("cannot borrow");
	}
     }
}

/*********** Result  **************/

enum Result<T,E> {
     Ok(tvar(T)),
     Err(tvar(E))
}

/********* mem library *************/

struct mem {}

impl mem {
     fn forget <T> (t:T) {}
}

/**********end mem *****************/

/**************slice****************/

struct slice {
    saddr: & (* mut T),
    slen  : usize
}

impl slice {
     fn as_ptr(&self) -> * mut T {
       #rawpt(* ( (*self).saddr))
     }
     fn len(&self) -> usize {
       (*self).slen
     }
}


/************ str ****************/

impl str {

     fn len(&self) -> usize {
         #lenStr(* self)
     }

     fn as_bytes(& self) -> slice {
	 slice {saddr: #selfX, len: (self.len)()}
     }
}


/****************** Entry ***********************/

struct entry{
     l: reft(#Map),
     k: i32
}

impl entry{
     fn insert(& mut self, x:T) -> & mut T {
     	#mapAdd(* ((* self).l), (*self).k, x);
	& mut #mapValue(*((*self).l), (*self).k)
     }

     fn intomut(& mut self) -> & mut T {
     	& mut #mapValue(*((*self).l), (*self).k)
     }
}

enum Entry {
     Occupied(own(#prodId(entry))),
     Vacant(own(#prodId(entry)))
}

impl Entry {
     fn or_insert_with(& mut self, x:T) {
        match *self {
	      Occupied(e) -> (& mut e).intomut(),
	      Vacant(e) -> (& mut e).insert(x)
	}
     }
}


/*************HashMap*************/

struct HashMap {
       n: i32,
       tk: #Map,
       tv: #Map
}

impl HashMap {
     fn new() -> HashMap {
	HashMap {n:0, tk: rallocate(#Map), tv: rallocate(#Map)}
     }

     fn entry(& mut self, k:T) -> Entry {
	if (#mapKeyin((*self).tk, k) = true) then {
	      Entry::Occupied(entry{l:& ((*self).tv),
				    k:#mapValue((*self).tk, k) }) }
	   else {
	      #mapAdd((*self).tk, k, (*self).n);
	      #mapAdd((*self).tv, (*self).n, 0);
	      (*self).n := (*self).n + 1;
	      Entry::Vacant(entry{l:& ((*self).tv), k:(*self).n - 1})
	 }
     }
}


/**********internedString**************/

struct InternedString {
       data : * mut u8,
       len  : usize
}



impl InternedString {
     fn from_str(s:& str) -> InternedString {
     	 let bytes = s.as_bytes();
	 InternedString {
	     data: ((& imm bytes).as_ptr)(),
	     len: ( (& imm bytes).len)()
	 }
     }

     fn from_parts(data: *const T, len: usize) -> InternedString{
	   InternedString {
	       data: data,
	       len : len
	   }
     }
}


/**************************************/

/***********************************
	String Pool
************************************/

struct StringPool {
       start: Cell<* mut u8>,
       end:   Cell<* const u8>,
       index: RefCell<HashMap < InternedString, InternedString > >       
}


impl StringPool {

     fn new() -> StringPool {
	   StringPool {
	       start: Cell::new(ptr::null_mut()),
	       end:   Cell::new(ptr::null()),
	       index: RefCell::new(HashMap::new())
	   }
     }

     fn store(& self, s:& str) -> InternedString {
     	let sl = s.as_bytes();
     	let strstart = (& sl).as_ptr();
	let strlen = s.len();
	let tostart = (& ((*self).start)).get();
	unsafe{
	    ptr::copy_nonoverlapping(strstart, tostart , 1);
	    let interned_str = InternedString
	    	  ::from_parts((& ((*self).start)).get(), strlen);
	};
	interned_str
     }

     fn do_intern(& self, s: & str) -> InternedString {
     	(self.store)(s)
     }
 
     fn intern <'s> (& self, s:& str) -> InternedString {
	let search_string = InternedString::from_str(s);
	let mut index = (& mut ((*self).index)).borrow_mut();
	let entry = (index).entry(search_string);
	#stop("{}",1)
	let internedString = (& mut entry).or_insert_with((self.do_intern)(s));
	internedString
     }
}


fn main() {

   let s = StringPool::new();
   let t = "maybe" ;
   (& s).intern(t);

}
