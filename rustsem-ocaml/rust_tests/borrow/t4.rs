

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
   let x = Box::new(66);

   let y = & x;

   let z = & y;

   let t = & z;

   println!("{}", (* * * t).data);



}