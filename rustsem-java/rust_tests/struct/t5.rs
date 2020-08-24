// A struct with two fields
struct Point {
    x: i32,
    y: i32
}

// Structs can be reused as fields of another struct


struct Rectangle {
    p1: Point,
    p2: Point
}

fn main() {
    // Create struct with field init shorthand

    // Instantiate a `Point`
    let point = Point { x: 3, y: 4 };

    // Access the fields of the point
    println!("point coordinates: ({}, {})", point.x, point.y);

    // Make a new point by using struct update syntax to use the fields of our other one
    let new_point = Point { x: 1, y: point.y };
    // `new_point.y` will be the same as `point.y` because we used that field from `point`
    
    println!("second point: ({}, {})", new_point.x, new_point.y);


}