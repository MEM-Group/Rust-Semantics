


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

fn insertion_sort(v: &mut Vec< i32 >, len : i32) {

    let mut i = 1;
    while(i < len){
    	 let value = (*v)[i];  
	 insert(v, i , value);
	 i = i + 1;
    }
}


fn main() {
    let mut v = vec![4,5,6,7,1,2,3];
    insertion_sort(& mut v, 8);
}


