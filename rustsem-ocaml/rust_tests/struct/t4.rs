
struct target{
       t: i32
}

struct origin{
       o: target
}

fn main() {

   let t = target{t:2};

   let o = origin{o: t};

   println!("{}", o.o.t);

}