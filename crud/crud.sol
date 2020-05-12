pragma solidity >=0.5.22 <0.7.0;

contract Crud{
    //create a custom data type struct for storing the user fist and last name
    struct User{
        uint id;
        string firstName;
        string lastName;
    }
    //use mapping to store the user information which will be linked to id     
    mapping(uint => User) user;
    uint userId = 1; //every use will be linked with this userId and keep on incrementing in creat fn()
    
    /**
        1. take the firstName and lastName as input and store them temporary variables
        2. put those varibale in struct and store the struct as value in user
            userId is acting as key and User struct as value.
            1 => User(1, "John", "Murphy")...
        3. incrementing the userId
    */
    function create(string memory _firstName, string memory _lastName)public{
        user[userId] = User(userId, _firstName, _lastName);
        userId++;
    }
    
    /**
        1. by using the userId as input we will read the user information
    */
    function read(uint _id) public view returns(uint, string memory, string memory){
        find(_id);
        return(user[_id].id, user[_id].firstName, user[_id].lastName);
    }
    /**
        1. by using the userId and providing the firtName and lastName
            updateing  the new values to the same key in user container.
    */
    function update(uint _id, string memory _firstName, string memory _lastName) public {
        find(_id);
        user[_id] = User(_id, _firstName, _lastName);
    }
    
    /**
        to delete the particular use we will use delete keyword of the giving id.
    */
    function destroy(uint _id) public {
        find(_id);
        delete user[_id];
    }
    /**
        1.to make the flow of contract more concise we will check the user id
        2. by using the fallback function require(). 
            if the give id === 0 or id is not in our mapping then says "this id does not exist."
    */
    function find(uint _id)internal view {
        require(_id != 0, "This id does not exist");
        require(_id == user[_id].id, "This id does not exist");
    }
}
