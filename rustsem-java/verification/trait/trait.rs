struct Lpoint{
    x:i32
}

struct Ppoint{
    x:i32,
    y:i32
}

trait Distance{
    fn distance(& self) -> i32;
}

impl Distance for Lpoint {
    fn distance(&self) -> i32 {
        let t ;
        if ((*self).x < 0){
            t = 0 - (*self).x ;
        } else {
            t = (*self).x
        } ;
        t
    }
}

impl Distance for Ppoint {
    fn distance(&self) -> i32 {
        let mut t ;
        if ((*self).x < 0){
            t = 0 - (*self).x ;
        } else {
            t = (*self).x
        };
        if ((*self).y < 0){
            t = t + (0 - (*self).y) ;
        } else {
            t = t + (*self).y
        };
        t
    }
}

fn main() {
   let lp = Lpoint {x:3} ;
   assert_eq!((&lp).distance(), 3);
   
   let pp = Ppoint {x:3, y:4} ;
   assert_eq!((&pp).distance(), 7);
}
