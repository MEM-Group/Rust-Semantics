
struct Box< T > {
       data:T
}

impl Box < T > {
     fn new(x:T) -> Box < T > {
     	Box {data:x}
     }
}

struct Point {
    x: i64,
    y: i64
}


struct Rectangle {
    p1: Point,
    p2: Point
}

fn origin() -> Point {
    Point { x: 0, y: 0 }
}

fn boxed_origin() -> Box < Point > {
    // Allocate this point on the heap, and return a pointer to it
    Box::new(Point { x: 0, y: 0 })
}

fn main() {
    // (all the type annotations are superfluous)
    // Stack allocated variables
    let point = origin();
    let rectangle = Rectangle {
        p1: origin(),
        p2: Point { x: 0, y: 0 }
    };

    // Heap allocated rectangle
    let boxed_rectangle = Box::new(Rectangle {
        p1: origin(),
        p2: origin()
    });

    // The output of functions can be boxed
    let boxed_point = Box::new(origin());


}
