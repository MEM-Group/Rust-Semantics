
struct point {
       x : i32,
       y : i32
}

fn main(){

   let p = point{x:4,y:5};

   {

	let t = & (p.x);

   	let b = & (p.y);

	println!("{}", (*t) + (*b));

   }

   let p1 = & p;

   println!("({},{})", (*p1).x, (*p1).y);
      
}