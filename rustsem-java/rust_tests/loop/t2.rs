
fn main(){

   let x = 10;

   loop{
	println!("{}",x);
	if (x == 6) {
	   break;
	};
	let y = 3;
	loop {
	     println!("{}", y);
	     if (y == 0) {
	     	break;
	     };
	     y = y - 1;
	}
	x = x - 1;
   }

}