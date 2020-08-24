
struct Box< T > {
       data:T
}

impl Box < T > {
     fn new(x:T) -> Box < T > {
     	Box {data:x}
     }
}

fn moveOwn(x:& Box<i32>) -> i32 {
   (*x).data
}

fn main() {

   let x = Box::new(22);

   moveOwn(& x);

   //Compare with t5.rs, the following statement can be executed, since x is borrowed instead of moved

   let z = x;

}
