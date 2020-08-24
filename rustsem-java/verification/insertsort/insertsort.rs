
fn insert(v: &mut Vec<i32>, pos: usize, value: i32){
        let mut pos = pos - 1;
        while (pos >= 0) {
            if (*v)[pos] <= value {
                break;
            };
            (*v)[pos + 1] = ((*v)[pos]);
            pos = pos - 1;
        }
        (*v)[pos + 1] = value;
    }

fn insertion_sort(v: &mut Vec< i32 >, len:i32) {

    let mut i = 1;
    while(i < len){
    	    let value = (*v)[i];
	    insert(v, i , value);
	    i = i + 1;
    }
}

fn Vec_Order(v: & Vec< i32 >, len:i32) -> bool {

   let mut i = 1;
   let mut res = true;
   while(i < len) {
   	   if ( ((*v)[i - 1] )> ((* v) [i])) {
	      res = false;
	   };
	   i = i + 1;
   }
   return res;
}

fn main() {
    let mut v = vec![4,5,6,7,1,2,3];
    insertion_sort(& mut v,7);
    assert!(Vec_Order(& v, 7) == true);

}
