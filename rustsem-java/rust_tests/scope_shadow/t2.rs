


fn main() {
   let x = vec![1,2,3];
   {
	let x = vec![5,6,7];
	println!("inner x is {}", x[1]);
   }
   println!("outer x is {}", x[1]);
}