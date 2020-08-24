

fn sum(a:i32,b:i32) -> i32 {
   a + b
}

fn mult(a:i32,b:i32) -> i32 {
   a * b
}

fn main() {
   
   let a = 3;
   let b = 4;
   let c = 6;

   println!("{}", mult(sum(a,b),c));

}