
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

   let c = | | { let x = Box::new(2); println!("{}", x.data);};

   thread::spawn( c ) ;

}