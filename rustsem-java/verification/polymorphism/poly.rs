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
    fn distance( & self) -> i32 {
        let t ;
        if (((* self) . x) < 0){
            t = 0 - (*self).x ;
        } else {
            t = (*self).x ;
        };
        t
    }
}

impl Distance for Ppoint {
    fn distance(&self) -> i32 {
        let mut t ;
        if (( * self) . x < 0){
            t = 0 - (*self).x ;
        } else {
            t = (*self).x ;
        };
        if ((*self).y < 0){
            t = t + (0 - (*self).y) ;
        } else {
            t = t + (*self).y;
        };
        t
    }
}

fn caldistance (t:& Distance) -> i32 {
    t.distance()
}

fn main() {
   let dis ;
   if (true ){
       let p = Lpoint {x:3} ;
       dis = caldistance(& p);
       assert_eq!(dis, 3);
   } else {
       let p = Ppoint {x:3, y:4} ;
        dis = caldistance(& p);
	assert_eq!(dis, 7);
   } ;

}