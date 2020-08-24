struct A{a:i32}

impl A {
    
    fn f(self) {
        
    }
    
}

fn main(){

    let x = A{a:2};
    x.f();
    
    let z = x;
}