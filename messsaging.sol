// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 < 0.9.0;

contract message{
    struct messanging{
        address sender;
        address recipient;
        string content;
        uint256 timestamp;
    }

    messanging[] public ms;

    function postMessage(string memory _content) public{
        messanging memory newMessage = messanging({
            sender : msg.sender,
            recipient: msg.sender,
            content: _content,
            timestamp:block.timestamp
        });

        ms.push(newMessage);
    }

    function viewMessage(uint256 _index) public view returns(address, address, string memory, uint256){
        require(_index< ms.length,"index out of bounds");
        messanging memory m = ms[_index];
        // messanging memory r = ms[_index];
        return(m.sender, m.recipient, m.content,m.timestamp);
    }



}