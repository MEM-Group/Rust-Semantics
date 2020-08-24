
struct T{
       x: i32,
       y: bool
}

trait Display {
      fn display() ;
}

impl Display for i32 {
     fn display(){
     	println!("i32");
     }
}

impl Display for bool {
     fn display(){
     	println!("bool");
     }
}

fn main() {
   let t = T{ x: 1, y: true};
   let x1 = & t.x ;
   let x2 = & t.y ;

   (*x1).display();

}