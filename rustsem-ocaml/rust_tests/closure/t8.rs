
struct Box< T > {
       data:T
}

impl Box < T > {
     fn new(x:T) -> Box < T > {
     	Box {data:x}
     }
}

fn main() {

   let num = Box::new(6);

   let plus_num = move |x:i32| x + num.data;

   let t = plus_num(5);

   println!("{}",t);

//   let k = num;

}