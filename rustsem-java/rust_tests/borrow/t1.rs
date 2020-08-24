

fn main() {

   let a = 8;
   {
	{
	    let b = & a;
	    println!("{}", *b);
	}
	let c = & a;
	println!("{}", *c);
   }

}