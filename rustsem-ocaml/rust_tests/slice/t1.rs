
/**************slice****************/

struct slice {
    saddr: & (* mut T),
    slen  : usize
}

impl slice {
     fn as_ptr(&self) -> * mut T {
       val(#rawpt(* ( (*self).saddr)))
     }
     fn len(&self) -> usize {
     	val( (*self).slen )
     }
}

/************ str ****************/

impl #owner(str) {

     fn len(&self) -> usize {
           #lenStr(* self)
     }

     fn as_bytes(& self) -> slice {
	   slice {saddr: #selfX, len: (self.len)()}
     }
}

fn main() {

   let t = "Hello World" ;

   println!("{}",t.len());

   let s = (t.as_bytes());

   assert_eq!((&s).len(), 11);

}