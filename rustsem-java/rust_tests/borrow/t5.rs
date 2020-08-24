
fn A(x:& i32) {

   println!("{}", * x);
   
}

fn main(){

   let x = 8;

   A(& x);

}