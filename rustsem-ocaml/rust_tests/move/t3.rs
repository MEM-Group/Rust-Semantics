

fn main() {
   
   let x = vec![1,2,3,4,5];

   let y = x;

   println!("{}", y[4]); //After moving, y should have the ownership of the vecotr
   
}