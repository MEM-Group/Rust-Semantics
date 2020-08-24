
enum Option <T> {
     None,
     Some( T )
}

fn main() {

   let t = Option::Some(12);

   match t {
   	 None => { println!("None"); },
	 Some(S) => {println!("{}", S) ; }
   };

   let t = Option::None;

      match t {
   	 None => { println!("None"); },
	 Some(S) => {println!("{}", S) ; }
   };


}