class Tuple<T1, T2> {
    public var first:T1;
    public var second:T2;
    
    public function new(first:T1, second:T2) {
        this.first = first;
        this.second = second;
    }

    public function setFS(f,s){
        this.first = f;
        this.second =s;
    }
}