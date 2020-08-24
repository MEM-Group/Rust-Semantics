
trait shape{
      fn perimeter(&self) -> usize;
}

struct rectangle{
       length:i32,
       width :i32
}

impl shape for rectangle{
     fn perimeter(&self) -> usize {
     	2 * ((*self).length + (*self).width)
     }
}

fn main(){

   let r = rectangle{length:34, width: 45};
   println!("{}", (& r).perimeter());

}