
struct integer {
       i:i32
}

struct boolean {
       b:bool
}

trait Foo {
      fn method(&self) -> void ;
}

impl Foo for integer {
     fn method(& self){
     	println!("The value of i32: {}", (* self).i);
     }
}

impl Foo for boolean {
     fn method(& self){
     	println!("The value of bool: {}", (*self).b);
     }
}

fn do_something(x: & Foo){

   x.method();
   
}

fn main() {

   let i = integer {i:10};

   let b = boolean {b:true};

   if (false) {
      do_something(& i);
   }else{
      do_something(& b);
   }

}