
struct A{
       a:i32
}

enum Tt{
     ea(A),
     b(i32)
}

fn main() {

   let A1 = A{a:2};
   let z = Tt::ea(A1) ;

   let k ;

   match z {
   	 ea(a) => {k = a;},
	 b(i) => {println!("{}",i); }
   };

}