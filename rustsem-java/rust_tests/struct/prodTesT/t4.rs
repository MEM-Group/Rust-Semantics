
struct point {x:i32,y:i32}

struct A {
    p: point
}

fn main() {
    let p = point{x:3,y:4};
    
    let t = A{p:p};
    
    let k = t.p;
    
    println!("{}", k.x);

    //The following cannot be execute due to p has been moved
    //println!("{}", p.x);
    
}
