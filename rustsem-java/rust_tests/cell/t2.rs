

struct Box< T > {
       data:T
}

impl Box < T > {
     fn new(x:T) -> Box < T > {
     	Box {data:x}
     }
}

/******************Cell***************/

struct Cell <T>  {
       value: T
}

impl Cell<T>{
     fn get(&self) -> T {
 
     }

     fn new(value:T) -> Cell<T> {
     	Cell {
	     value : value
	}
     }

     fn set(& self, val1:T) {
     	let r = (*self) as * mut Cell;
     	unsafe{ r.value = val1; }
     }
     
}

fn main(){

   let b = Box::new(1);

   let t = Cell::new(b);

   (&t).set(Box::new(2));

}