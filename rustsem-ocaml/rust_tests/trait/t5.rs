
trait shape{
      fn perimeter(& mut self, x:i32);
}

struct rectangle{
       length:i32,
       width :i32
}

impl shape for rectangle{
     fn perimeter(& mut self, x:i32) {
     	(*self).length = (*self) . width + x;
     }
}

fn main(){

   let mut r = rectangle{length:34, width: 45};
   (& mut r).perimeter(2) ;
   println!("{}", r.length);

}