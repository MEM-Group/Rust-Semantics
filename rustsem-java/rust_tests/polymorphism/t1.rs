
trait Print {
      fn print();
}

struct A {}

impl Print for A {
     fn print() {
     	println!("A");
     }
}

struct B {}

impl Print for B {
     fn print() {
     	println!("B");
     }
}

fn do_something (P:Print) {
   P.print();
}


fn main(){

   let a = A {};
   do_something(a);

   let b = B {};

   do_something(b);



}








