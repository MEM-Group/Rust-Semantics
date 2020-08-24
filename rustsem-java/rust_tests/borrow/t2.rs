
struct Box < T > {
       data : T
}

impl Box {
     fn new(x:T) -> Box < T > {
     	Box{
		data: x
	}
     }
}

fn main() {

   let b = Box::new(32);

   let a = & b;

   let c = & b;

   println!("a:{}, c:{}", (*a).data, (*c).data);

}