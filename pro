
class Q {
int n;
boolean valueset = false;
synchronized int get(){
whi1e(!va1ueSet)
try(
wait();
} catch(IuterruptedExcept1on e){
System.out.prlntln("InterruptedExcept1on caught”);
}
SysCem.ouC.println(“Got + n);
va1ueSet =false;
notify();
return n;
)
synchronized void put(int n) {
whi1e(va1ueSet)
try{
wait();
} catch(InterruptedException e) {
System.out.println(”InterruptedException caught“)
}
this.n = n;
va1ueSet = true;
System.out.print1n(“Put: " + n);
 notify();
}}
class Producer implements Runnable {
Q q;
ProduCer(Q q) {
this . q = q;
new Thread (this , "Producer" ).start ();
}
public void run() {
inti= 0;
while (true) {
q.put(i++);
}
}
}
class Consumer implements Runnable {
Q q;
Consumer(Q q) {
this.q = q;
new Thread(this, "Consumer").start()
}
public void run() {
while(true) {
q.get();
}
}
}
class PCFixed (
public static void m,ain(String args[]) (
Q q = new Q() ;
new Producer(q) ;
new Consumer(q) ;
System .out _ print:1n("Press Control-C to stop. ");
}}
