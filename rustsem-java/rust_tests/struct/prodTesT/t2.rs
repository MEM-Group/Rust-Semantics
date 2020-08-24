
struct point{
       x:i32,
       y:i32
}

fn main(){

   let p = point {x:3,y:6};

   let t = match p {
       	   	 point(x,y) => x + y
       	   };

   println!("{}", t);

}