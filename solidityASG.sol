pragma solidity ^0.5.11;

contract student{
    enum class {onsite,online}
    enum gender {male,female}
    
    struct studentData{
        string name;
        uint rollNum;
        bool hasDegree;
        gender myGender;
        class myClass;
    }
    
    mapping(uint => studentData) students;

    uint numberOfstudents;
    
    
    address payable private myAddress = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;
    function setAddress(address payable add) public {
        myAddress = add;
    }
    
    function getbalane() public view returns(uint){
        return myAddress.balance;
    }
    function getAddress() public view returns(address){
        return myAddress;
    }
    function enroll(string memory yourName, uint RollNum, bool yourDegree, gender yourgender, class yourclass ) public payable returns(string memory){
        require(msg.value >= 2 ether);
        myAddress.transfer(msg.value); 
        studentData memory ssdata = studentData(yourName,RollNum,yourDegree,yourgender,yourclass);
        students[RollNum] = ssdata;
        numberOfstudents;

    }
    
    
    function getStudentsData(uint RollNum)public view returns(string memory,uint,bool,gender,class,uint){
        return (
            students[RollNum].name,
            students[RollNum].rollNum,
            students[RollNum].hasDegree,
            students[RollNum].myGender,
            students[RollNum].myClass,
            numberOfstudents
            );
    }
}
