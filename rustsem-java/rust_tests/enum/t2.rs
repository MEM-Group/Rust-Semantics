
struct Box  {
       data: i32
}

impl Box {
     fn new(x:i32) -> Box{
     	Box {data:x}
     }
}

enum Mix{
     integer(i32),
     box {b: Box}
}

fn main(){
   let x = Mix::box { b:Box::new(23) };
   let z = match x {integer(z) -> z, box(b) -> b.data};
   println!("{}",z);
}