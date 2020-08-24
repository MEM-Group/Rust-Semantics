
fn main() {

    let a = vec![10, 20, 30, 40, 50];
    let mut index = 0;

    loop {
    	if(index >= 5) {break;};
        println!("the value is: {}", a[index]);
        index = index + 1;
    }
    
}