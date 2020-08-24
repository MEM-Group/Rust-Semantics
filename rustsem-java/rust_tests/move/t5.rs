
struct Box< T > {
       data:T
}

impl Box < T > {
     fn new(x:T) -> Box < T > {
     	Box {data:x}
     }
}

fn moveOwn(x:Box<i32>) -> i32 {
   *x
}

fn main() {

   let x = Box::new(22);

   moveOwn(x);

   //The following cannot be executed due to the moving of x

   let z = x;

}
