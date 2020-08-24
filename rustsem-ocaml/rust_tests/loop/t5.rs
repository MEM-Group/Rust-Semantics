

struct Box< T > {
       data:T
}

impl Box < T > {
     fn new(x:T) -> Box < T > {
     	Box {data:x}
     }
}

fn main() {

   let t = 5;

   while t > 0 {
   	 let a = Box::new(t);
	 println!("{}", a.data);
	 t = t - 1;
   }

}