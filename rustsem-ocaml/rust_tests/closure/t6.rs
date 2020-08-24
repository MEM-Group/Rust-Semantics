

struct Box< T > {
       data:T
}

impl Box < T > {
     fn new(x:T) -> Box < T > {
     	Box {data:x}
     }
}

fn main () {

   let f = | x:i32 | {Box :: new(x)};

   let t = f(56);

   println!("{}", t.data);

}