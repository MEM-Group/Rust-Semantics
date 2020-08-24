
struct Box< T > {
       data:T
}

impl Box < T > {
     fn new(x:T) -> Box < T > {
     	Box {data:x}
     }
}

fn main() {

   let a = Box::new(23);
   let z = a;
   //The following statement cannot executed since a has been moved
   let k = a;

}