public static void main (String[] args) {
  Box<Integer> b0 = new Box<Integer>(0);
  Box<Integer> b1 = new Box<Integer>(1);
  
  ArrayList<Box<Integer>> l = new ArrayList<Box<Integer>>();
  l.add(b0);
  l.add(b1);
  
  l.get(0).set(1);
  l.get(1).set(2);
}