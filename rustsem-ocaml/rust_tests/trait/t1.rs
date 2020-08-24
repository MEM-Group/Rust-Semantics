
struct Sheep { naked: bool, Name: & 'static str }

trait Animal {
    // Static method signature; `Self` refers to the implementor type.
    fn new(& 'static str) -> #trait(Animal);

    // Instance method signatures; these will return a string.
    fn name(&self) -> &'static str;
    fn noise(&self) -> &'static str;

    fn talk(&self) -> void ;
}

impl Sheep{

    fn is_naked(&self) -> bool {
        (*self).naked
    }


}

// Implement the `Animal` trait for `Sheep`.
impl Animal for Sheep {
    // `Self` is the implementor type: `Sheep`.
    fn new(name: &'static str) -> Sheep {
        Sheep { naked: false, Name: name}
    }

    fn name(&self) -> &'static str {
        (*self).Name
    }

    fn noise(&self) -> &'static str {
        if self.is_naked() {
            "baaaaah?"
        } else {
            "baaaaah!"
        }
    }
    
    // Default trait methods can be overridden.
    fn talk(&self) {
        // For example, we can add some quiet contemplation.
        println!("{} pauses briefly... {}", **((*self).Name), **((self.noise)()));
    }
}


impl Sheep {

    fn shear(&mut self) {
        if self.is_naked() {
            // Implementor methods can use the implementor's trait methods.
            println!("{} is already naked...", **((self.name)()));
        } else {
            println!("{} gets a haircut!", **((*self).Name));

            (*self).naked = true;
        }
    }
}


fn main() {
    // Type annotation is necessary in this case.
    let mut dolly = Sheep::new("Dolly");
    // TODO ^ Try removing the type annotations.
    
    (& dolly).talk();
    (& mut dolly).shear();
    (& dolly).talk();
}
