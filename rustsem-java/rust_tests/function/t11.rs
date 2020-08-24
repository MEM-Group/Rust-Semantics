

struct Box< T > {
       data:T
}

impl Box < T > {
     fn new(x:T) -> Box < T > {
     	Box {data:x}
     }
}

fn f() -> Box<i32>{
   let t = Box::new(2);
   return t;
}

fn main(){
   let t = f();
   println!("{}",t.data);
}