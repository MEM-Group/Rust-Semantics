
/******************Cell***************/



struct Cell <T>  {
       value: T
}

impl Cell<T>{
     fn get(&self) -> T {
     	(*self).value
     }

     fn new(value:T) -> Cell<T> {
     	Cell {
	     value : value
	}
     }

     fn set(& self, val1:T) {
        let r = (*self) as * mut Cell;
     	r.value = val1;
     }
     
}

fn main(){

   let t = Cell::new(2);

   assert_eq!((& t).get(), 1);

   (&t).set(1);

   assert_eq!((&t).get(),2);

}