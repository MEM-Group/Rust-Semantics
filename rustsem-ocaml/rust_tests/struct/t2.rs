
struct Mix {
       i:i32,
       b:bool
}

fn main(){
   let m = Mix{i:10, b:false};

   if (m.b == true) {
      println!("{}", m.i);
   }
   else {
      println!("{}", m.b);
   }

}