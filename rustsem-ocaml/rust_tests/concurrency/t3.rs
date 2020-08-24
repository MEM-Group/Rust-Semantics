


struct Box< T > {
       data:T
}

impl Box < T > {
     fn new(x:T) -> Box < T > {
     	Box {data:x}
     }
}

struct JoinHandle {
       handle:i32       
}

struct Builder {
     name: &str
}

impl Builder {
     fn new() -> Builder {
     	Builder {
	   name : ""
	}
     }
     fn spawn<F,T>(self,f:F) -> JoinHandle {
     	JoinHandle{ handle:#spawn(self.name, f)}
     }
}

struct thread {}

impl thread {
     fn spawn<T>(f:T) -> JoinHandle {
     	let builder = Builder::new();
	(builder.spawn)(f)
     }
}



fn main() {

   let x = Box::new(12);

   let c1 = | | { let y = Box::new(2); let t = 4; println!("{} {}", x.data + y.data, t);};

   thread::spawn(c1) ;

   let c2 =  | | { let y = Box::new(3); println!("{}", y.data);};

   thread::spawn(c2) ;

   println!("{}", 45);

}