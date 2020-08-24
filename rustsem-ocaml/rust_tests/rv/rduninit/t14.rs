
struct Box< T > {
       data:T
}

impl Box < T > {
     fn new(x:T) -> Box < T > {
        Box {data:x}
     }
}


fn main() {

   let b = Box::new(1);

   let v = b;

   let z = b; //read uninitialized

}