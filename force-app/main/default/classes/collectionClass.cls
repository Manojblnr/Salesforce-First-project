public class collectionClass {
    public static void listMethod(){
        
        /****
         For creating list

         List<Datatype> l1 = new List<Datatype>();
         ***/
        List<Integer> l1 = new List<Integer>();
        l1.add(2);
        l1.add(3);
        l1.add(1);
        system.debug(l1);
        
        List<Integer> l2 = new List<Integer>{1,2,4,45,5};
        system.debug(l2);
        
        List<String> l3 = new List<String>{'i', 'Am', 'Pradeep'};
        system.debug(l3[0]);
        
        //List Array notation,  Can define in three ways
        
        Integer[] a1 = new Integer[4];
        
        Integer[] a2 = new List<Integer>{1,2,4,45,5};
        
        List<Integer> a3 = new Integer[4];
        
        //to add values
        a1[0] = 25;
        a1[1] = 52;
        a1[2] = 53;
        a1[3] = 76;
        
        system.debug(a1.size()); // Returns the number of elements in the list
        System.debug(a1.get(0)); //   Returns the element on the ith index
        l2.remove(0); //  Removes the element on the ith index.
        List<String> l5 = l3.clone(); //Make a duplicate of a list.
        a1.set(1,35); // Sets the element on the ith position of the list. If there is already a value then the value gets overridden.
        a1.sort(); // Sorts the item in ascending order but works with primitive data types only. Returns true if the list is empty.
        system.debug(a1.isEmpty()); // Sorts the item in ascending order but works with primitive data types only. Returns true if the list is empty.
        l5.clear(); //Clears the list.
    }
    
    public static void nestedListMethod(){
        
        // two dimensional list
        List<List<Integer>> list1 = new List<List<Integer>>();
        
        List<Integer> l1 = new List<Integer>{1,6,8};
        List<Integer> l2 = new List<Integer>{5,7,9};
        List<Integer> l3 = new List<Integer>{10,12,11};
         
        list1.add(l1);
        list1.add(l2);
        list1.add(l3);
        
        system.debug(list1); // for entire list
        system.debug(list1[0][0]); // for individual value in an matrix
        
        /********Or Another way to do it***************/
        List<List<Integer>> list2 = new List<List<Integer>>{new List<Integer>{1,6,8}, new List<Integer>{5,7,9}, new List<Integer>{10,12,11}};
        
        system.debug('the 2D matrix ' + list2);
        
        //Three dimensional list
        
        List<List<List<Integer>>> list3 = new List<List<List<Integer>>>
        									{
                                                new List<List<Integer>>{new List<Integer>{1,6,8}, new List<Integer>{5,7,9}, new List<Integer>{10,12,11}}, 
                                                new List<List<Integer>>{new List<Integer>{1,6,8}, new List<Integer>{5,7,9}, new List<Integer>{10,12,11}}, 
                                                new List<List<Integer>>{new List<Integer>{1,6,8}, new List<Integer>{5,7,9}, new List<Integer>{10,12,11}}
                                            };
                                                
        system.debug('3D matrix ' + list3);
    }
    
    /********************Set Method********************************/
    
    public static void setMethod(){
        Set<Integer> s = new Set<Integer>();
        s.add(1);
        s.add(4);
		s.add(2);
		s.add(3); 
        
        // OR
        Set<Integer> s1 = new Set<Integer>{1,3,2,4};
        
        system.debug(s);
        system.debug(s1);
        
        Set<String> s2 = new Set<String>{'I', 'Am', 'Pradeep', 'N S'};  // Ordering will be in Capital letters and small letters
        
        system.debug(s2);
        
        //Uniqueness of sObjects
        
       	Set<Account> sSet = new Set<Account>();
        
        Account a1 = new Account(Name = 'Amazon', NumberOfEmployees = 2000);
        Account a2 = new Account(Name = 'Flipkart', NumberOfEmployees = 3000);
        Account a3 = new Account(Name = 'Myntra'); // here NumberOfEmployees is set as NULL
        Account a4 = new Account(Name = 'Amazon', NumberOfEmployees = 2000);
        
        sSet.add(a1);
        sSet.add(a2);
        sSet.add(a3);
        sSet.add(a4);
        
        system.debug(sSet);
        system.debug(sSet.size());  // duplicated data is removed in this set method
        
        //Methods of Sets
        List<Integer> l1 = new List<Integer>{3,4,6};
        s1.addall(l1);   //This method also take set as an argument
        system.debug(s1); // {1,2,3,4,6} automatically sorted in set
        
        //system.debug(s1.contains(7)); //False
        //system.debug(s1.contains(3)); //True
        //system.debug(s1.containsAll(l1)); //True
        //system.debug(s1.size()); //5
        //system.debug(s1.retainAll(l1)); //True only retains elements in l1 in s1
        //system.debug(s1.removeAll(l1)); //Removes the l1 elements
        //system.debug(s1.clear()); //Clears the set
    }
    
    /*****************Map***************/
    
    public static void mapMethod(){
        
        //             Declaration
        //   Map<Datatype_key, Datatype_value> mmap = new Map<Datatype_key, Datatype_value>();
        Map<Integer, String> mmap = new Map<Integer,String>();
        
        mmap.put(11, 'pradeep');
        mmap.put(07, 'Reddy');
        mmap.put(18, 'Virat');
        mmap.put(12, 'K L Rahul');
        
        system.debug(mmap);  // {11=Pradeep, 07=Reddy, 08=Virat, 12=K L Rahul}
		
		mmap.put(07, 'Dhoni'); // It will override the reddy to dhoni
		system.debug(mmap);    
        
        Map<Integer, String> m1 = new Map<Integer,String>{02 => 'Pradeep', 08 => 'Dhoni', 08 => 'Virat', 01 => 'K L Rahul'};
        system.debug(m1);
        
        //Methods of map
        
        mmap.putAll(m1); //all the key value pairs in m1 to mmap
        system.debug(mmap.get(11)); // Pradeep
        system.debug(mmap.values()); //Returns a list that contains all the values in the map.
        system.debug(mmap.keySet()); //Returns a set that contains all of the keys in the map.	
        system.debug(mmap.containsKey(53)); //false  Returns true if the map contains a mapping for the specified key.	
        system.debug(mmap.isEmpty()); //Returns true if map has 0 key.	
        system.debug(mmap.size()); //Returns the number of key-value pairs in the map.	
        system.debug(mmap.remove(11)); //Removes the mapping for the specified key from the map, if present, and returns the corresponding value.	
    }
    
}