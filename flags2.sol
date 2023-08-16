pragma solidity ^0.5.0;

contract Flags {

  /*
  event Flag(bool);

  bool private flag0 = true;
  bool private flag1 = true;


  function set0(int val) public returns (bool){
    if (val % 100 == 0) 
      flag0 = false;
  }

  

  function set1(int val) public returns (bool){
    if (val % 10 == 0 && !flag0) 
      flag1 = false;
  }
 
  function set3(bool val) public returns (bool){
    if (val==true) 
      flag1 = false;
  }

  function incremental_counter(uint counter) internal returns(uint) {   
    counter +=1; 
    return counter; 

  }
 */
  function manipulate_hash(bytes32 val) public returns (bytes32) {
     string memory mytest = "abc";
     bytes32 val2 = keccak256(abi.encodePacked((mytest)));
     if (val > val2){
      return val2;
     }
    return val;
  }


  function restrictive_branch(bytes32 val, bytes memory test_string) public returns (int){
    uint x = 3;
    uint y = 5; 
    byte one_byte;
   // uint counter = 0;    
    string memory val2 = "hello world";
    uint sum = x + y;
    bytes32 new_val =  manipulate_hash(val);
   // counter = incremental_counter(counter);
    bytes32 val_a = keccak256(abi.encodePacked(new_val, keccak256("MY_SALT")));  
    bytes32 val_b = keccak256(abi.encodePacked(val, keccak256(test_string)));      
    //to pass if, we need:
    //i)test_string = "MY_SALT" and ii) val <= keccak256(abi.encodePacked((mytest))
    if (val_b==val_a){
        one_byte = val_a[1];
        
      for (uint i; i < 32; i++) {
        if(val_a[i] != one_byte) {
          sum = sum + 10;           
        } 
      }
       
      uint divide = ((sum * 3)**uint(4))/5;
      uint mod = divide%33; 
      return int(mod) + int(sum);             
  } 
  
    if (new_val==keccak256(abi.encodePacked(("abc"))) && keccak256(abi.encodePacked(val))==keccak256(test_string)) {
      return int(val_b);
  } 
  return 0; 
  }



  function compareStrings(string memory a, string memory b) public view returns (uint) {
    if (keccak256(abi.encodePacked((a))) == keccak256(abi.encodePacked((b)))){
        return 1; 
    }
    return 0; 
}
/*
  function echidna_alwaystrue() public returns (bool){
    return(true);
  }

  function echidna_revert_always() public returns (bool){
    revert();
  }

  function echidna_sometimesfalse() public returns (bool){
    emit Flag(flag0);
    emit Flag(flag1);
    return(flag1);
  }
  */

}