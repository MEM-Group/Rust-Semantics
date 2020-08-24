
fn first(v: & Vec < i32 >) {
   (*v)[0]
}

fn main() {

   let v = vec![1,2,4];
   let f = first(& v);
   println!("{}",f);
   
}