

/** Closure refer to outside variables **/


struct Box< T > {
       data:T
}

impl Box < T > {
     fn new(x:T) -> Box < T > {
     	Box {data:x}
     }
}

fn main () {

   let x = Box::new(3);

   let f = | | x ;

   let k = f();

   println!("{}", k.data);

}