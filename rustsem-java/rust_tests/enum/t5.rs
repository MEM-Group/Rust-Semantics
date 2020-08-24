
enum Option <T> {
     None,
     Some( T )
}

fn main() {

   let t = Option::Some([1,2,3]);

   match t {
   	 None => { println!("None"); },
	 Some(S) => {println!("{}", S[3]) ; }
   };

   let t = Option::None;

      match t {
   	 None => { println!("None"); },
	 Some(S) => {println!("{}", S) ; }
   };


}